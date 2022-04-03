# Exercise 4 — Array Maximum and Minimum
# $8 = address
# $9 = array length
# $10 = counter
# $11 = max address
# $12 = min address
# $13 = letter 1

.text
main:

lui $8, 0x1000		# set memory address for array size value
lw $9, 0($8)		# load array length
sll $0, $0, $0
addiu $8, $8, 4		# set memory address for array
ori $10, $0, 0		# init counter

lw $14, 0($8)		# load first array value to init min and max registers
sll $0, $0, $0

or $11, $0, $14		# init max address
or $12, $0, $14		# init min address

loop:

slt $14, $10, $9
beq $14, $0, loop_end
sll $0, $0, $0

lw $13, 0($8)		# load value
sll $0, $0, $0

slt $14, $13, $12	# if 13 < 12 set 1, otherwise 0
beq $14, $0, letter_larger
sll $0, $0, $0

or $12, $0, $13

letter_larger:

slt $14, $11, $13	# if 11 < 13 set 1, otherwise 0
beq $14, $0, letter_smaller 
sll $0, $0, $0

or $11, $0, $13

letter_smaller:

addiu $10, $10, 1
addiu $8, $8, 4

j loop
sll $0, $0, $0

loop_end:

.data
size:   .word 1
array:  .word 23
