	/*OVERALL*/	

	// our microarchitecture will contain a microprogram (in ROM)
	// whose job is to fetch, decode, and execute IJVM instructions

	// each instruction at the ISA level is a function to be called by a master program
	// where that is a simple, endless loop that determines a function to be invoked, calls
	// the function, then starts over

	// the microprogram has a set of variables, called the state of the computer,
	// which can be acessed by all the functions

	// IJVM instructions are short and sweet.

*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*
	/*DATAPATH*/

	// the data path is that part of the CPU containing the ALU, its inputs, and its outputs.

	// SSL8 (shift left logical) shifts the contentes left by 1 byte, filling the 8 least significant bits with zeros.
	// SRA1 (sifht right arithmetic) shifts the contents right by 1 bit, leaving the most significant bit unchanged.

	// somewhat detailed data path timing
	// tW: on the falling edge of the pulse, the bits that will drive all the gates are set up;
	// tX: the register needed is selected and driven onto the B bus. tX to have a stable value on B Bus;
	// tY: ALU and shifter have valid data to operate on. tY to have stable outputs.
	// tZ: the results have propagated along the C bus to the registers, where they can be loaded on the rising edge of the next pulse	

	// it is the design engineers's responsibility to make sure that the time tW + tX + tY + tZ comes sufficiently in advance
	// of the rising edge of the clock to have the register loads work reliably all the time

*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*
	/*MEMORY OPERATION*/

	// our machine has two different ways to communicate with memory:
	//		* (1) a 32-bit, word-addressable memory port  
	//		* (2) an 8-bit, byte-addressable memory port  
	// 	(1) is controlled by two registers, MAR ( memory address register) and MDR ( memory data register )
	//		MAR/MDR combination is used to read and write ISA-level data words
	//
	//  (2) is controlled by one register, PC, which reads 1 byte into the low-order 8 bits of MBR. 
	//	    this port can only read data from memory; it cannot write data to memory.
	//		PC/MBR combination is used to read the executable ISA-level program, which consists of a byte stream

	//	MBR can be gated onto the B bus in one of two ways: (1) unsigned or (2) signed
	//		(determined by which of the two control signals is asserted)
	//
	//  (1) the 32-bit word put onto the B bus contains the MBR value in the low-order 8 bits and zeros in the upper 24 bits
	//
	//  (2) treat it as a signed value between -128 and +127 and use this value to generate a 32-bit word with the same value
	//      done by duplicating the MBR sign bit (lefmost) into the upper 24 bit positions of the B bus, a process known as 
	//		sign extension
*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	
	/*MICROINSTRUCTIONS*/

	// data-path controlled by 24 signals ( for one cycle )
	// 9 signals to control writing data from the C bus into registers
	// 4 signals (4x16 decoder) to control enabling registers onto the B bus for ALU input
	// 8 signals to control the ALU and shifter functions
	// 2 signals to indicate memory read/write via MAR/MDR
	// 1 signal to indicate memory fetch via PC/MBR 

	// microinstruction = {Addr, JAM, ALU, C, Mem, B}
					        9     3    8   9   3   4   [bits] 
*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*
	/*MICROINSTR CONTROL: THE MIC-1*/

	// the sequencer is responsible for stepping through the sequence of operations for the execution
	// of a single ISA instruction
	// it must produce two kinds of information each cycle: 
	//  	(1) the state of every control signal in the system
	// 		(2) the adress of the microinstruction that is to be executed next
	//
	// the largest and most important item in the control portion of the machine 
	// is a memory called the control store
	// it is convenient to think of it as a memory that hold the complete microprogram
	// it contains 512 words, each consisting of one 36-bit microinstruction
	// control store's memory address register : MPC 
	// control store's memory data register : MIR
	// it takes tW to load MIR
	// it takes tW + tX to have stable inputs in the ALU
	// it takes tY to have ALU,N,Z and shifter outputs stable
	// after tZ the shifter output has reached the registers via C bus

	// N and Z values are save in a pair of 1-bit flip-flops

	// next microinstruction calculation begins after MIR Has been loaded and is stable
	// (1) next_address is copied to MPC
	// JAM field is inspected, if 000 nothing is done
	// if JAMN is set, the 1-bit N flip-flop is ORed into the high-order bit of MPC
	// if JAMZ is set, the 1-bit Z flip-flop is ORed into the high-order bit of MPC
	// if both are set, both are ORed

	// high-bit:  F = (JAMZ and Z) or (JAMN and N)

	// MPC can be either NEXT_ADDRESS or NEXT_ADDRESS with high-order bit ORed with 1

	// if JMPC is set, the 8 MBR bits are bitwise ORed with the 8 low-order bits of
	// the NEXT_ADDRESS field coming from the current microinstruction

	// all that matters is that MPC is not loaded until the registers it depends on
	// (MBR, N, and Z) are ready
*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*	*









































