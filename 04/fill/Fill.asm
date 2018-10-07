// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

@KBD
D = A - 1
@lastPixel
M = D

(START)
  @KBD
  D = M
  @KEYPRESSED
  D; JNE
  @NOKEYPRESSED
  0; JMP

  (KEYPRESSED)
  @0
  D = !A
  @R3
  M = D
  @FILLSCREEN
  0; JMP

  (NOKEYPRESSED)
  @0
  D = A
  @R3
  M = D
  @FILLSCREEN
  0; JMP

  (FILLSCREEN)

  // filling pixel
  @SCREEN
  D = A
  @R1
  M = D

  (LOOP)
  @R3
  D = M

  @R1
  A = M
  M = D

  @R1
  M = M + 1
  D = M

  @lastPixel
  D = D - M

  @START
  D; JGT

  @LOOP
  0; JMP
