// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

	@R2			// Declare a variable, result
	M=0			// Set to 0
	@counter	// Declare a variable, counter
	M=1			// Set to 1
(LOOP)			// Mark starting of LOOP
	@counter	// load counter
	D=M			// load R1
	@R1			// save R1 - counter into D
	D=D-M		// if counter > R1
	@END		// Load END address
	D;JGT		// If D > 0 jump to the END
	@R0			// load R0
	D=M			// save into D
	@R2			// load result
	M=D+M		// update M
	@counter	// load counter
	M=M+1		// save counter + 1 into M
	@LOOP		// Load LOOP
	0;JMP		// jump to LOOP
(END)
	@END
	0;JMP