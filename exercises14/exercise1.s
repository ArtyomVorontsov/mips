# Write a program to evaluate a polynomial, similar to newMult.asm from the chapter. Evaluate the polynomial:

# 3x^2 + 5x - 12
# Pick a register to contain x and initialize it to an integer value (positive or negative) at the beginning of the program. 
# Assume that x is small enough so that all results remain in the lo result register. Evaluate the polynomial and leave its value in a register.

# Verify that the program works by using several initial values for x. Use x = 0 and x = 1 to start since this will make debugging easy.

# Optional: write the program following the hardware rule that two or more instructions must follow a mflo instruction before another mult instruction. 
# Try to put useful instructions in the two slots that follow the mflo. Otherwise put no-op instructions, sll $0,$0,0, in the two slots.

.text

.globl main

main:

	or $8, $0, 5	# init x
	or $9, $0, 5	

	mult $9, $8 	# 5 * x 
	mflo $9		# $9 = 5 * x	

	sll $0, $0, $0 # hardware rule
	sll $0, $0, $0 # hardware rule
		
	mult $8, $8
	mflo $10
	or $8, $0, $10	# $8 = x^2

	or $10, $0, 3
	mult $8, $10
	
	mflo $10
	or $8, $0, $10	# $8 - 3x^2

	addu $8, $8, $9	# 3x^2 + 5x
	
	or $10, $0, 12
	subu $8, $8, $10



	

	
