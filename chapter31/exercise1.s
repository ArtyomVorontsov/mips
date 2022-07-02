# Exercise 1 — Arithmetic Expression
# 5.4xy - 12.3y + 18.23x - 8.23

.text
main:
# $f4 = x
# $f5 = y

# Ask number
# Ask x
li $v0, 4
la $a0, ask_x
syscall

li $v0, 6
syscall
mov.s $f4, $f0

# Ask y 
li $v0, 4
la $a0, ask_y 
syscall

li $v0, 6
syscall
mov.s $f5, $f0

# Compute polynomial using horners method
li.s $f0, 0.0			# clear accumulator 

li.s $f1, 5.4			# 5.4
mul.s $f1, $f1, $f4		# 5.4x
mul.s $f1, $f1, $f5		# 5.4xy

add.s $f0, $f0, $f1		# 5.4xy

li.s $f1, -12.3			# -12.3
mul.s $f1, $f1, $f5		# -12.3y

add.s $f0, $f0, $f1		# 5.4xy - 12.3y

li.s $f1, 18.23			# 18.23
mul.s $f1, $f1, $f4		# 18.23x

add.s $f0, $f0, $f1		# 5.4xy - 12.3y + 18.23x

li.s $f1, -8.23
add.s $f0, $f0, $f1 

# Print result
li $v0, 4
la $a0, result_string
syscall

mov.s $f12, $f0
li $v0, 2
syscall

li $v0, 10
syscall

.data
ask_x: .asciiz "\nType x:"
ask_y: .asciiz "\nType y:"
result_string: .asciiz "\n Result is:"


