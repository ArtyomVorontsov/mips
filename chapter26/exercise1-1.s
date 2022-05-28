# Exercise 1 — Arithmetic Expression
# 5u^2 - 12uv + 6v^2

.text
# $s0 = result
# $s1 = temp1
# $s2 = temp2

.globl main
main:

loop:

li $s0, 0	# clear register result
li $s1, 0	# clear register temp1
li $s2, 0	# clear register temp2 	

jal prompt_num	# ask user for u
nop
move $s1, $v0

mul $s0, $s1, 5		# 5u
mul $s0, $s0, $s0	# 5u^2
mul $s1, $s1, 12	# 12u


jal prompt_num	# ask user for v
nop
move $s2, $v0

bne $s2, $zero, v_is_no_zero
nop
beq $s2, $s0, loop_end
nop
v_is_no_zero:

# evaluate experession
mul $s1, $s1, $s2	# 12uv
subu $s0, $s0, $s1	# 5u^2 - 12uv

mul $s2, $s2, 6		# 6v
mul $s2, $s2, $s2	# 6v^2
addu $s0, $s0, $s2	# 5u^2 - 12uv + 6v^2 

li $v0, 1	# print result 
move $a0, $s0
syscall

j loop
nop
loop_end:

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
