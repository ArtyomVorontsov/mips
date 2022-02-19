## divEg.asm
## 
## Program to calculate (y + x) / (y - x)
##
## Register Use:
##  $8   x
##  $9   y
##  $10  x+y ;  quotient
##  $11  y-x ;  remainder

        .text
        .globl  main

main:

	ori $8, $0, 8 
	ori $9, $0, 36

	addu $10, $8, $9

	nor $8, $8, $8 # do -x 
	addiu $8, $8, 1
	
	addu $11, $9, $8

	div $10, $11
	
	mflo $10
	mfhi $11
