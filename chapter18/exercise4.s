# find lowest value

.text

main: 

lui $10, 0x1000	# .data location
or $11, $0, $0		# .data location offset
lw $8, ($10)		# load value A
sll $0, $0, $0

loop:
addiu $11, $11, 4	# increment .data offset
addiu $10, $10, 4
lw $9, ($10)		# load second value (B,C)
sll $0, $0, $0
slt $12, $8, $9		# compare values, if $8 is less than $9, $12 will be 1, otherwise 0

bne $12, $0, first_value_is_less	# branch if first value is less than second, otherwise proceed
sll $0, $0, $0
or $8, $0, $9		# change $8 to lowest value

first_value_is_less:
ori $13, $0, 8
beq $11, $13, loop_end
sll $0, $0, $0
j loop
sll $0, $0, $0
loop_end:

addiu $10, $10, 4
sw $8, ($10)
sll $0, $0, $0

.data
A:    .word 23
B:    .word 98
C:    .word 17 
