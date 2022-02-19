.text
main:
	.text
	
	or $9, $0, 0x7000
	sll $9, $9, 16
	
	addu $8, $9, $9
	add $7, $9, $9
