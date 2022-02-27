# 3x^2 + 5x - 12
# $8 = x
# $9 = poly
# $10 = accumulator
# $11 = temp


.text

main:

lui $9, 0x1000	# .data address
lw $8, 0($9) 	# x

sll $0, $0, $0
sll $0, $0, $0

ori $10, $0, 5	# 5
mult $8, $10
mflo $10 	# 5x

addi $10, $10, -12 # 5x - 12 

sll $0, $0, $0	

mult $8, $8	# x^2
mflo $8		# x^2
ori $11, $0, 3	# 3
sll $0, $0, $0	

mult $11, $8
mflo $11
add $10, $10, $11	# 3x^2 + 5x - 12

sw $10, 4($9)

.data
x: .word 17
poly: .word 0
