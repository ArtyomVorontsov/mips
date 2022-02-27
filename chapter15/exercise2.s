# 17xy - 12x - 6y + 12
# $7 - adress of data location 
# $8 - x
# $9 - y
# $10 - accumulator
# $11 - temp

.text
main:

lui $7, 0x1000
lw $8, 0($7)	# x
lw $9, 4($7)	# y

ori $10, $0, 12	# 12
sll $0, $0, $0
sll $0, $0, $0

addiu $11, $0, -6	# -6
mult $11, $9	# -6y
mflo $11	# -6y

add $10, $11, $10	# -6y + 12

addiu $11, $0, -12
mult $11, $8
mflo $11	# -12x

addu $10, $11, $10	# -12x -6y + 12

ori $11, $0, 17
mult $11, $8
mflo $11	# 17x

sll $0, $0, $0
sll $0, $0, $0

mult $11, $9
mflo $11	# 17xy

addu $10, $11, $10

.data

x: .word 10
y: .word 5
answer: .word 0
