.text
main:
	.text
	
	or $8, $0, $0

	# add 0x1000 to $8 16 times
	
	addi $8, $8, 0x1000
	addi $8, $8, 0x1000
	addi $8, $8, 0x1000
	addi $8, $8, 0x1000

	addi $8, $8, 0x1000
	addi $8, $8, 0x1000
	addi $8, $8, 0x1000
	addi $8, $8, 0x1000

	addi $8, $8, 0x1000
	addi $8, $8, 0x1000
	addi $8, $8, 0x1000
	addi $8, $8, 0x1000

	addi $8, $8, 0x1000
	addi $8, $8, 0x1000
	addi $8, $8, 0x1000
	addi $8, $8, 0x1000

	addi $9, $0, 0x1000
	sll $9, $9, 4

	addi $10, $0, 0x1000
	add $10, $10, $10 
	add $10, $10, $10 
	add $10, $10, $10 
	add $10, $10, $10 
