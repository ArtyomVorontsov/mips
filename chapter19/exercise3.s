# perfect number verifier

.text
main:

lui $8, 0x1000		# base memory address
ori $9, $0, 0		# init divider
ori $10, $0, 0		# init accumulator
ori $11, $0, 0		# reminder
ori $7, $0, 0		# potencial perfect number
ori $13, $0, 500		# limit

external_loop:

addiu $7, $7, 1

loop:
addiu $9, $9, 1		# increment divider
div $7, $9
mfhi $11		# load reminder
bne $11, $0, loop
sll $0, $0, $0
addu $10, $10, $9	# add divider to accumulator
bne $9, $7, loop
sll $0, $0, $0
loop_end:

sub $10, $10, $7
bne $10, $7, end
sll $0, $0, $0
sw $7, ($8)		# store perfect number in memory location
addiu $8, $8, 4

end:
sll $0, $0, $0

# clear divider and accumulator registers
or $9, $0, $0
or $10, $0, $0

bne $13, $7, external_loop
sll $0, $0, $0
external_loop_end:

.data
array: .space 800

