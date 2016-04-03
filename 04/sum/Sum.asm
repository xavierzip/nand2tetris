// Computes sum = 1+...+100
	@i
	M=1
	@sum
	M=0
(LOOP)
	@i
	D=M
	@100
	D=D-A	// D register to store temperary values
	@END	// Load END address into A register
	D;JGT	// if D > 0 (Greater Than) then jump to the address in A register
	@i
	D=M		// D = i
	@sum	// A = sum
	M=D+M	// A (sum) = i + sum
	@i 		// A = i
	M=M+1	// i = i + 1
	@LOOP	// Load LOOP address into A register
	0;JMP   // Jump to A register
(END)
	@END 	// Load END address 
	0;JMP 	// End the program with an endless loop