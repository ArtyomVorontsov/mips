# $10 = significant bit count
# $11 = not significant bit count

.text

main:

lui $8, 0x0029		# load number number for counting significant bits
ori $8, $8, 0x8D7D

ori $10, $0, 32		# maximum amount of significant bits
addiu $11, $0, -1	# amount of not significant bits

loop_start:
addiu $11, $11, 1	# add 1 not significant bit

sll $9, $8, $11		# check if last bit in bit pattern is 1 
srl $9, $9, 31

beq $9, $0, loop_start	# if last bit in bit pattern is 1, significant bits pattern started
sll $0, $0, $0 

subu $10, $10, $11	# substract not significant bits from maximum amount of significant bits 
			# to get a significant bits value

