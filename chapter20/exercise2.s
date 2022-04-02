# Capitalize letter after space
# $8 = memory address
# $9 = counter
# $10 = letter
# $11 = capitalize next letter
# $12 = space symbol in hex (ascii)
.text

main:
lui $8, 0x1000		# initialize memory address
ori $12, $0, 0x20	# load ascii hex space symbol
ori $11, $0, 1		# capiatalize first letter by initializing $12 by 1

loop:
lb $10, 0($8)		# load letter from memory
sll $0, $0, $0
beq $10, $0, loop_end	# if letter equal to null end loop
sll $0, $0, $0

beq $10, $12, not_capitalize_letter	# if loaded letter is space, skip capitalizing
sll $0, $0, $0

beq $11, $0, not_capitalize_letter
sll $0, $0, $0
addiu $10, $10, -0x20
sb $10, 0($8)
sll $0, $0, $0
ori $11, $0, 0		# set flag to not capitalize next letter
not_capitalize_letter:

bne $10, $12, not_equal_to_space
sll $0, $0, $0
ori $11, $0, 1		# set flag to capilalize next letter 
not_equal_to_space:

addiu $8, $8, 1		# icrement address by 1 byte

j loop
sll $0, $0, $0
loop_end:


.data
string:   .asciiz    "in a  hole in the   ground there lived a hobbit"
