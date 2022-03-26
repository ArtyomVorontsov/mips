# Median of three
# $8 = a
# $9 = b
# $10 = c
# $11 = comparison value / accumulator

.text

main: 

lui $12, 0x1000	# .data location

lw $8, 0($12)		# load value A
sll $0, $0, $0

lw $9, 4($12)		# load value B
sll $0, $0, $0

lw $10, 8($12)		# load value C
sll $0, $0, $0

slt $11, $8, $9
bne $11, $0, a_less_than_b
sll $0, $0, $0

or $11, $0, $9		# swap $8 and $9
or $9, $0, $8
or $8, $0, $11
a_less_than_b:


slt $11, $8, $10
bne $11, $0, a_less_than_c
sll $0, $0, $0

or $11, $0, $10		# swap $8 and $10
or $10, $0, $8
or $8, $0, $11
a_less_than_c:


slt $11, $9, $10
bne $11, $0, b_less_than_c
sll $0, $0, $0

or $11, $0, $10		# swap $9 and $10
or $10, $0, $9
or $9, $0, $11
b_less_than_c:
 
sw $9, 12($12)		# store value C
sll $0, $0, $0

.data
A:    .word 100
B:    .word 10
C:    .word 5

