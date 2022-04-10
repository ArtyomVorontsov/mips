# $8 = memory address
# $9 = counter 
# $10 = height
# $11 = height accumulator
# $12 = weight
# $13 = weight accumulator
# $14 = number of pairs

.text

main:
lui $8, 0x1000
lw $14, 0($8)		# load number of pairs
sll $0, $0, $0

loop:

beq $9, $14, loop_end
sll $0, $0, $0

lw $10, 4($8)
lw $12 8($8)

addu $11, $11, $10
addu $13, $13, $12

addiu $9, $9, 1
addiu $8, $8, 8

j loop
sll $0, $0, $0
loop_end:

div $11, $14
mflo $11
sll $0, $0, $0 
sll $0, $0, $0 

div $13, $14
mflo $13




.data
pairs:  .word 5                  # number of pairs
        .word 60, 90             # first pair: height, weight
        .word 65, 105
        .word 72, 256
        .word 68, 270
        .word 62, 115

