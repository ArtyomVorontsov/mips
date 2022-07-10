# sum = sum*x + a[j]

.text
main:
# $t0 = counter
# $t1 = limit
# $f2 = x
# $f3 = sum
# $f4 = a[j]
# $t5 = j address

li.s $f3, 0.0	# init sum by 0.0

li $v0, 6
syscall
mov.s $f2, $f0

lw $t1, n	# load limit
nop

la $t5, a	# load array address 

loop:
nop

mul.s $f3, $f3, $f2		# sum*x

l.s $f4, ($t5)			# a[j]
nop

add.s $f3, $f3, $f4		# sum * x + a[j]

bge $t0, $t1, loop_end
addiu $t5, $t5, 4	# increment address
addiu $t0, $t0, 1	# increment counter
j loop
nop
loop_end:

li $v0, 2
mov.s $f12, $f3
syscall

li $v0, 10		# exit
syscall

.data
n: .word  5
a: .float 4.3, -12.4, 6.8, -0.45, 3.6
