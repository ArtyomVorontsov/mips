# Program will assemble instruction:
# ori $8 $9 0x004A
# as numbers

# binary representstion:
# op s d const

main:
	
	.data

	.text		
		or $25, $0, $0		# clear $25
		
		or $11, $0, $0		# clear $11 
		ori $11, $0, 0xD	# load 0xD value
		sll $11, $11, 26	# left shift $11 by 26 places
		or $25, $25, $11	# move opcode into target register

		or $11, $0, $0		# clear $11 
		ori $11, $0 0x9		# load 0x9 value
		sll $11, $11, 21	# left shift $12 by 21 places
		or $25, $25, $11	# move s into target register

		or $11, $0, $0		# clear $11 
		ori $11, $0, 0x8	# load 0x8 value
		sll $11, $11, 16 	# left shift $13 by 16 places
		or $25, $25, $11 	# move d into target register 
	
		or $11, $0, $0		# clear $11 
		ori $11, $0, 0x004A	# load 0x004A
		or $25, $25, $11 	# move const into target register
		
		or $a0, $0, $25		# print assembled instruction
		ori $v0, $0, 1
		syscall


or $v0, $0, $0
ori $v0, $0, 10 # program end
syscall

	
		
		

		
		
		
