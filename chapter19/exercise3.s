# perfect number searcher

.text
main:

lui $8, 0x1000		# base memory address
ori $9, $0, 0		# init divider
ori $10, $0, 0		# init accumulator
ori $11, $0, 0		# divided number
ori $7, $0, 5		# potencially perfect number
ori $13, $0, 0		# memory offset  
ori $14, $0, 100		# perfect number limit

searcher_loop:

addiu $7, $7, 1		# increment potencially perfect number

loop:
addiu $9, $9, 1		# increment divider
div $7, $9
mfhi $11
bne $11, $0, loop
sll $0, $0, $0
addu $10, $10, $9	# add divider to accumulator
beq $10, $7, loop_end
sll $0, $0, $0
slt $12, $10, $7
bne $12, $0, loop
sll $0, $0, $0
loop_end:

bne $10, $7, check_end
sll $0, $0, $0
addu $8, $8, $13
sw $7, ($8)
addiu $13, $13, 4

check_end:
sll $0, $0, $0

ori $9, $0, 0		# drop to default
ori $10, $0, 0
ori $11, $0, 0

slt $12, $7, $14	# set $12 to 1 if value in $7 is less than in $14, otherwise set 0
bne $12, $0, searcher_loop
sll $0, $0, $0

searcher_loop_end:
sll $0, $0, $0
 

.data
array: .space 800
