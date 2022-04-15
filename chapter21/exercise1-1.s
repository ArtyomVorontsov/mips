# Horner's Method
# ax^3 + bx^2 + cx + d

# $s0 = accumulator
# $t0 = temp
# $t1 = x

.text

lw $t1, x		# load x 

lw $t0, a 		# load a
nop

mult $t0, $t1		# ax
mflo $s0		# ax

lw $t0, bb		# load b
nop

addu $s0, $s0, $t0 	# ax + b

mult $s0, $t1		# ax^2 + b
mflo $s0

lw $t0, c		# load c
nop

addu $s0, $s0, $t0	# ax^2 + bx + c

mult $s0, $t1		# ax^3 + bx^2 + cx
mflo $s0

lw $t0, d		# load d
nop

addu $s0, $s0, $t0	# ax^3 + bx^2 + cx + d

sw $s0, result 		# store result
nop

.data
x:      .word    7
a:      .word   -3
bb:    	.word    3
c:      .word    9
d:      .word  -24
result: .word    0

