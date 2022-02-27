# ax^3 + bx^2 + cx + d
# $8 = data address
# $9 = x
# $10 = accumulator
# $11 = temp
# $12 = temp2

.text

main:

lui $8, 0x1000
lw $9, 0($8)	# x

lw $11, 4($8)	# a
sll $0, $0, $0
mult $11, $9	# ax
mflo $10

lw $11, 8($8)	# b
sll $0, $0, $0
addu $10, $10, $11	# ax + b

mult $10, $9	# ax^2 + bx
mflo $10 

lw $11, 12($8)	# c
sll $0, $0, $0

addu $10, $10, $11 # ax^2 + bx + c
mult $10, $9	
mflo $10	# ax^3 + bx^2 + cx

lw $11, 16($8)	# d
sll $0, $0, $0
addu $10, $10, $11	# ax^3 + bx^2 + cx + d


.data
x: .word 7
a: .word -3
b: .word 3
c: .word 9
d: .word -24
