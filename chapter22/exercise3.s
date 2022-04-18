#String to Integer
# $s0 = prompt buffer address
# $s1 = acc
# $s2 = prompt buffer length
# $t0 = prompted number (in ascii string format)
# $s3 = new line character 

.text
main:

move $s1, $zero
la $a0, prompt_buffer		# set prompt buffer address
lw $a1, prompt_buffer_length	# set prompt buffer length 
li $s3, 0x0a

li $v0, 8		# prompt number in ascii format
syscall
la $s0, prompt_buffer	# load prompt buffer address

loop:
lb $t0, 0($s0)		# load number (in ascii format)
nop
beq $t0, $s3, loop_end	# if character is null, end loop

addiu $t1, $t0, -0x30
addu $s1, $s1, $t1	# add converted value to accumulator
li $t1, 10
mult $s1, $t1	
mflo $s1

addiu $s0, $s0, 1	# increment address 

j loop
nop
loop_end:

li $t1, 10
divu $s1, $t1
mflo $s1

move $a0, $s1
li $v0, 1
syscall		# print converted value

la $a0, new_line
nop
li $v0, 4
syscall		# print converted value

j main
nop

.data
prompt_buffer_length: .word 64
prompt_buffer: .space 64
new_line: .asciiz "\n"
