# $8 = base adress
# $9 = acc
# $10 = temp

.text
lui $8, 0x1000

lbu $10, 0($8)
sll $0, $0, $0
addu $9, $9 $10

lbu $10, 1($8)
sll $0, $0, $0
addu $9, $9 $10

lbu $10, 2($8)
sll $0, $0, $0
addu $9, $9 $10

lbu $10, 3($8)
sll $0, $0, $0
addu $9, $9 $10

lbu $10, 4($8)
sll $0, $0, $0
addu $9, $9 $10

ori $10, $0, 5
div $9, $10
mflo $9
sll $0, $0, $0

sh $9, 8($8)	# store half-word

.data
	.byte   12
	.byte   97
	.byte  133
	.byte   82
	.byte  236
