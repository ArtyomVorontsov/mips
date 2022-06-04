# Exercise 2 — User Prompt 

.text
# $s0 = result flag
# $s1 = converted number
# $s2 = accumulator
.globl main
main:

main_loop:
jal user_prompt
nop

move $s0, $v0	# move converted number to $s0
move $s1, $v1	# move result flag to $s1

beq $s1, 0, main_loop		# skip value adding because it is converted incorrectly
nop
beq $s1, 2, main_loop_end	# if user printed done - end loop
nop

addu $s2, $s2, $s0	# add value to accumulator 

j main_loop
nop
main_loop_end:

li $v0, 1	# print result
move $a0, $s2
syscall

li $v0, 10	# exit
syscall
.data



.text
# $t0 = result
# $t1 = temp
# $t2 = multiplier
# $t3 = string length 

.globl user_prompt
user_prompt:

# clean registers
li $t0, 0
li $t1, 0
li $t2, 0
li $t3, 0
li $t4, 0

li $v0, 4
la $a0, ask_value
syscall

li $v0, 8		# read string
la $a0, buffer
li $a1, 100
syscall

# count string length 
user_prompt_loop:
lb $t1, buffer($t3)
beq $t1, 0x0a, user_prompt_loop_end	# if symbol is \n end loop
nop
addiu $t3, $t3, 1			# increment lenght 
j user_prompt_loop
nop
user_prompt_loop_end:

# convert to from ascii to int
user_prompt_loop2:
move $t1, $t3
li $t2, 1

subu $t1, $t1, 1
get_multiplier_loop:
ble $t1, $zero, get_multiplier_loop_end
nop
mul $t2, $t2, 10
subu $t1, $t1, 1		# decrement string length counter
j get_multiplier_loop
nop
get_multiplier_loop_end:

lbu $t1, ($a0)			# load byte
beq $t1, 0x0a user_prompt_loop_end2
blt $t1, 0x30, not_expected_value
bgt $t1, 0x39, not_expected_value

subu $t1, $t1, 0x30		# convert from ascii to int
mul $t1, $t1, $t2		# multiply by position
addu $t0, $t0, $t1		# add to result 
addiu $a0, $a0, 1		# increment address by 1 byte
subu $t3, $t3, 1		# decrement string length
j user_prompt_loop2
nop
user_prompt_loop_end2:

li $v1, 1			# input converted flag
move $v0, $t0			# move result to $v0 register
j user_prompt_end 
nop

not_expected_value:
li $v1, 0			# input not converted flag
li $v0, 0			

la $t2, buffer
la $t3, done 
check_for_done_loop:
beq $t2, 0x0a, check_for_done_loop_end

lb $t0, ($t2)				# load buffer
nop
beq $t0, 0x0a, is_done
nop
lb $t1, ($t3)				# load done
nop
bne $t0, $t1, check_for_done_loop_end
nop
addiu $t2, $t2, 1			# increment address
addiu $t3, $t3, 1			# increment address
j check_for_done_loop
nop
is_done:
li $v1, 2
li $v0, 0
check_for_done_loop_end:

user_prompt_end:
jr $ra 
nop
.data
buffer: .space 100
done: .asciiz "done"
ask_value: .asciiz "\nType number: "
