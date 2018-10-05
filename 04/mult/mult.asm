// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// Set R2 to 0
@2
D = M
@0
D = A
@2
M = D


(LOOP)
// Finish if R1 is 0
@1
D = M
@END
D; JEQ

// Adds R0 to R2
@2
D = M
@0
D = D + M
@2
M = D

// Descrement R1
@1
M = M - 1

// Loops
@LOOP
0; JMP

(END)
