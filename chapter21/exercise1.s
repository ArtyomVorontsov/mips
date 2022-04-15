# Horner's Method
# ax3 + bx2 + cx + d

# $s0 = accumulator
# $t0 = temp
# $t1 = x

.text

lw $t1, x		# load x 

lw $t0, d		# load d
nop
addu $s0, $s0, $t0 	# d

lw $t0, c		# load c
nop

mult $t0, $t1		# cx
mflo $t0		# cx

addu $s0, $s0, $t0	# cx + d

lw $t0, bb		# load b
nop

mult $t0, $t1		# bx
mflo $t0

sll $t0, $t0, 1		# bx2

add $s0, $s0, $t0	# bx2 + cx + d

lw $t0, a		# load a
nop

mult $t0, $t1		# ax
mflo $t0
nop
nop

ori $t2, $zero, 3 
mult $t0, $t2		# ax3
mflo $t0

addu $s0, $s0, $t0 	# ax3 + bx2 + cx + d

.data
x:      .word    7
a:      .word   -3
bb:    	.word    3
c:      .word    9
d:      .word  -24
result: .word    0

