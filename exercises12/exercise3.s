.text
main:

	.text
		ori $1, $0, 0x01
		sll $2, $1, 1
		or $1, $1, $2

		sll $2, $1, 2
		or $1, $1, $2
		
		sll $2, $1, 4
		or $1, $1, $2

		sll $2, $1, 8
		or $1, $1, $2

		sll $2, $1, 16
		or $1, $1, $2
