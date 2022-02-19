# (3x+7)/(2x+8)

.text
.globl main
main:

	ori $8, $0, 4 	# init x
	nor $8, $8, $8 
	addiu $8, $8, 1
	
	ori $9, $0, 3	# load 3
	mult $9, $8	# 3x into lo
	mflo $9 	# 3x into $9
	addiu $9, $9, 7 # 3x + 7
	
	sll $10, $8, 1	# 2x
	addiu $10, $10, 8 # 2x + 8

	div $9, $10
	mflo $9
	
