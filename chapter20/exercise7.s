# Array Reversal
# $8 = counter 
# $9 = memory address 
# $10 = array length 
# $11 = first value 
# $12 = second value
# $13 = min array length
# $14 = temp

.text

lui $9, 0x1000		# init array address
lw $10, 0($9)		# load array length
or $8, $0, $0		# init counter
ori $13, $0, 1		# init min array length
# addiu $10, $10, 1	

loop_1:

addiu $10, $10, -1	# decrement array length value
beq $10, $0, loop_1_end		# if array length == 0, jump to loop_1_end 
sll $0, $0, $0

or $8, $0, $0		# drop counter to zero
lui $9, 0x1000		# drop array address to 0x1000

loop_2:
slt $14, $8, $10	# if counter > array length, jump to loop_1 
beq $14, $0, loop_1
sll $0, $0, $0

lw $11, 4($9)		# load first value
sll $0, $0, $0
lw $12, 8($9)		# load second value
sll $0, $0, $0

sw $11, 8($9)		# store first value in memory place of second value 
sll $0, $0, $0
sw $12, 4($9)		# store second value in memory place of first value
sll $0, $0, $0

addiu $8, $8, 1		# increment counter
addiu $9, $9, 4		# increment memory address pointer for 1 byte

j loop_2
sll $0, $0, $0

loop_2_end:
loop_1_end:

main:

.data
size :  .word 7                     # number of elements
array:  .word 1, 2, 3, 4, 5, 6, 42
