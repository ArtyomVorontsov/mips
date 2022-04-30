# Fahrenheit/Celsius Converter
# F = (9/5)C + 32
# C = (5/9)(F - 32)
# $s1 = 55 = (5/9) * 100
# $s2 = 18 =  (9/5) * 10
# $s3 = 32
# $s4 = result
# $s5 = 0x43 (C)
# $s6 = 0x51 (Q)
# $t1 = string address
# $t2 = answer
# $t3 = user input
# $t4 = user input temperature

.text
main:

# init constants
li $s1, 55
li $s2, 18
li $s3, 32
li $s5, 0xa43	# C
li $s6, 0xa51	# Q

loop:

# print question about scale
la $a0, scale_question
li $v0, 4
syscall

# get answer about scale
la $a0, answer_buffer
nop
li $a1, 4
li $v0, 8
syscall

lw $t3, answer_buffer	# load user input
nop

beq $t3, $s6, loop_end	# if user input == Q
nop

# print question about user input temperature
la $a0, temperature_question
li $v0, 4
syscall

# get answer about temperature
li $v0, 5
syscall
move $t4, $v0	# move temperature to $t4

beq $t3, $s5, convert_c_to_f	# if user input == C
nop

convert_f_to_c: 
# C = (5/9)(F - 32)
sub $t4, $t4, $s3	# F - 32
mul $t2, $s1, $t4	# (5/9) * 100 * (F-32)
div $t2, $t2, 100	# (5/9) * 100 * (F-32) / 100


# print celsius answer
li $v0, 4
la $a0, celsius_answer
syscall

j print_result
nop

convert_c_to_f:
# F = (9/5)C + 32
mul $t2, $s2, $t4	# (9/5)10 * C
div $t2, $t2, 10	# (9/5)C
addu $t2, $t2, $s3	# (9/5) * C + 32


# print fahrenheit answer
li $v0, 4
la $a0, fahrenheit_answer
syscall


print_result:

# print result
li $v0, 1
move $a0, $t2
syscall

j loop
nop

loop_end:


# print exit_phaze
li $v0, 4
la $a0, exit_phraze
syscall

li $v0, 10
syscall

.data 
scale_question: .asciiz "\n Enter Scale: \n"
temperature_question: .asciiz "\n Enter Temperature: \n"
celsius_answer: .asciiz "\n Celsius Temperature:\n "
fahrenheit_answer: .asciiz "\n Fahrenheit Temperature: \n"
exit_phraze: .asciiz "\n done"
answer_buffer: .space 4



