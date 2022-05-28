# Exercise 1 — Arithmetic Expression
# 5u^2 - 12uv + 6v^2

.text
# $s0 = x
# $s1 = y
# $s2 = z

.globl main
main:
jal prompt_num	# ask user for x
nop
move $s0, $v0

jal prompt_num	# ask user for y
nop
move $s1, $v0

jal prompt_num	# ask user for z
nop
move $s2, $v0

addu $s3, $s0, $s1
addu $s3, $s3, $s2

li $v0, 1
move $a0, $s3
syscall

li $v0, 10	# exit
syscall

.data



.text
.globl prompt_num
prompt_num:
li $v0, 4			# print string
la $a0, prompt_number_string
syscall

li $v0, 5			# read int
syscall

jr $ra
nop
.data
prompt_number_string: .asciiz "\nType number: "
