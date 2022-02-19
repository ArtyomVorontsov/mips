.text
main:
	.text
	
	ori $8, $0, 5
	ori $9, $0, 10
	
	sll $10, $8, 1
	addu $10, $10, $8
	
	or $8, $0, $0
	
	sll $8, $9, 2
	addu $9, $8, $9
	
	subu $10, $10, $9
	
