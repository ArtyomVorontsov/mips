# *Exercise 1 — exp(x)

.text
.globl main
main:
# variables
# term = $f1
# x = $f2 (user input)
# n = $f3 (counter)
# sum = $f4
# limit = $f5
# constant = $f6 (1.0)

li.s $f1, 1.0
li.s $f3, 1.0
li.s $f4, 1.0
li.s $f5, 32.0
li.s $f6, 1.0

li $v0, 6		# read float
syscall
mov.s $f2, $f0		# move user input to $f2

loop:
c.lt.s	$f3, $f5
bc1f loop_end
nop

mul.s $f1, $f1, $f2	# term * x
div.s $f1, $f1, $f3	# term * x / n
add.s $f4, $f4, $f1	# sum += term

add.s $f3, $f3, $f6	# increment counter
j loop
nop
loop_end:

li $v0, 2		# print sum 
mov.s $f12, $f4
syscall

li $v0, 10		# exit
syscall

.data

