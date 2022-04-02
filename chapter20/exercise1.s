# To Lower Case
# $8 = data address
# $9 = letter
# $10 = counter
.text

main:
lui $8, 0x1000		# init data address

loop:
lb $9, 0($8)		# load letter from memory
sll $0, $0, $0		
beq $9, $0, loop_end	# check if letter is null
sll $0, $0, $0
addiu $9, $9, 0x20	# to lower case
sb $9, 0($8)		# store lower case letter in memory
addiu $8, $8, 1		# increment data addess by 1 byte
j loop			# jump to loop start
sll $0, $0, $0
loop_end:

.data
string:   .asciiz    "ABCDEFG"

