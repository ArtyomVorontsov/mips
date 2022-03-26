# perfect number verifier

.text
main:

lui $8, 0x1000		# base memory address
ori $9, $0, 0		# init divider
ori $10, $0, 0		# init accumulator
ori $11, $0, 0		# divided number

lw $7, ($8)		# loaded number from memory

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

bne $10, $7, end
sll $0, $0, $0
ori $12, $0, 1
sw $12, 4($8)		# store 1 into is_perfect memory location

end:
sll $0, $0, $0
 

.data
N: .word 496
is_perfect: .word 0
