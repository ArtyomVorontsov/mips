# Sequential memory locations

.text
main:

lui $7, 0x1000		# base memory location 
ori $8, $0, 0		# inner cycle counter
ori $9, $0, 0		# cycle counter
ori $10, $0, 4
ori $11, $0, 24


loop1:

addiu $9, $9, 1		# increment cycle counter
or $8, $0, $0		# clear inner cycle counter

loop2:
addiu $8, $8, 1		# increment inner cycle counter
sb $9, ($7)
addiu $7, $7, 1		# increment base memory location position

beq $8, $10, loop2_end
sll $0, $0, $0

j loop2
sll $0, $0, $0
loop2_end:

bne $9, $11, loop1
sll $0, $0, $0
loop1_end:


.data
array: .space 100


