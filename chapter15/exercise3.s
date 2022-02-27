# 6x^3 - 3x^2 + 7x + 2
# $8 = x
# $9 = temp
# $10 = accumulator


.text

main:

ori $8, $0, 4	# x
ori $9, $0, 6 # 6

add $10, $9, $10	# 6

mult $10, $8	# 6x
mflo $10

ori $9, $0, 3	# 3
# create value -3
nor $9, $9, $9
addi $9, $9, 1	# -3
addu $10, $10, $9	# 6x - 3

mult $10, $8
mflo $10	# 6x^2 - 3x

addiu $10, $10, 7 # 6x^2 - 3x + 7
sll $0, $0, $0

mult $10, $8
mflo $10	# 6x^3 - 3x^2 + 7x

addiu $10, $10, 2



