.text

main:
	.text
		ori $1, $0, 0x5555
		sll $1, $1, 16
		ori $1, $1, 0x5555
		sll $2, $1, 1
		or $3, $1, $2
		and $4, $1, $2
		xor $5, $1, $2
