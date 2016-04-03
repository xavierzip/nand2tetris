// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

(SC)			// Label Screen Part
	@SCREEN 	// Load R0ess SCREEN
	D=A 		// Save to D
	@R0 		// Declear a location variable R0 and load to A
	M=D			// M=D
	@R1
	M=D
	@KBSTART
	0;JMP
(SCBLACK)		// Label Screen Loop Start
	@R0			// Load R0 to A
	D=M			// D=M
	@24575
	M=A
	D=D-M		// check to make sure not to access the memory out of the screen
	@KBSTART
	D;JGT		// if D>0 jump out of the loop
	@R0			// Load R0 to A
	A=M			// A=M
	M=-1		// Write M=-1 to blacken the row
	@R0			// load R0 to A
	M=M+1		// M=M+1
	//@SCBLACK	// load screen loop Start 
	//0;JMP 	// jump to screen loop start
(KBSTART)		// Label KB detection Loop Start
	@24576		// Load KB value
	D=M
	@SCBLACK 	// Load Screen processing sequence
	D;JGT		// Process screen if D>0
	@R0
	D=M
	@R1
	D=D-M		// check if there is any black pixel
	@SCCLEAN
	D;JNE		// if there is black pixels, go  and clean one word
	@KBSTART
	0;JMP
(SCCLEAN)		// clean one word
	@R0
	M=M-1		// decrement current screen pointer
	@R0
	A=M
	M=0
	@KBSTART
	0;JMP
