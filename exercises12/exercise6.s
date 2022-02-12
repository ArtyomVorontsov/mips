.text

main:

.text
	# load 0x76543210 into $1
	ori $1, $0, 0x7654
	sll $1, $1, 16
	ori $1, $1 0x3210

	# clear $3
	or $3, $0, $0

	# reverse bit pattern in $1 and store in $3

	srl $2, $1, 28 		# shift 28 positions right 
	or $3, $3, $2		# merge result into $3
	or $2, $0, $0		# clear $2
	
	srl $2, $1, 24 		# clear right side from bits
	sll $2, $2, 28		# clear left side from bits
	srl $2, $2, 24		# shift to desired position
	or $3, $3, $2		# merge result into $3
	or $2, $0, $0		# clear $2
	
	srl $2, $1, 20
	sll $2, $2, 28
	srl $2, $2, 20
	or $3, $3, $2
	or $2, $0, $0

	srl $2, $1, 16
	sll $2, $2, 28
	srl $2, $2, 16
	or $3, $3, $2
	or $2, $0, $0
	
	srl $2, $1, 12
	sll $2, $2, 28
	srl $2, $2, 12
	or $3, $3, $2
	or $2, $0, $0
	
	srl $2, $1, 8
	sll $2, $2, 28
	srl $2, $2, 8
	or $3, $3, $2
	or $2, $0, $0
	
	srl $2, $1, 4
	sll $2, $2, 28
	srl $2, $2, 4
	or $3, $3, $2
	or $2, $0, $0
	
	sll $2, $1, 28
	or $3, $3, $2
	or $2, $0, $0

