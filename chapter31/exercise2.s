# Exercise 2 — Harmonic Series
# 1/1 + 1/2 + 1/3 + 1/4 + ...

.text
main:
# $s0 = limit
# $s1 = counter
# $f0 = sum
# $f1 = float 1.0
# $f2 = dividor
# $f3 = temp

# ask user for a limit
li $v0, 4
la $a0, ask_for_limit
syscall

li $v0, 5 	
syscall
move $s0, $v0

li.s $f1, 1.0	# load float 1.0

loop:
bge $s1, $s0, loop_end
nop
addiu $s1, $s1, 1	# increment counter
add.s $f2, $f2, $f1	# increment dividor

# calculation
div.s $f3, $f1, $f2
add.s $f0, $f0, $f3

j loop
nop
loop_end:

li $v0, 4
la $a0, sum_is
syscall

li $v0, 2	# print sum
mov.s $f12, $f0
syscall

li $v0, 10
syscall

.data
ask_for_limit: .asciiz "\nPlease type harmonic series limit: \n"
sum_is: .asciiz "Harmonic series sum is: "

