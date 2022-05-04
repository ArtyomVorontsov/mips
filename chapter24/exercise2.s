# String Reversal
# $t1 = first letter
# $t2 = second letter
# $t3 = temp
# $s1 = counter
# $s2 = string length 
# $s3 = buffer address
# $s4 = buffer length

.text
main:

program_loop:

li $s1, 0	# counter 0
li $s2, -1	# string length
la $s3, buffer		# buffer address
li $s4, 100	# buffer length (in bytes)

# print prompt
li $v0, 4
la $a0, message
syscall

# get string
li $v0, 8
la $a0, buffer
move $a1, $s4
syscall

loop:
li $s1, 0	# counter 0

beq $s2, -1, string_length_is_not_found
addiu $s2, $s2, -1
bleu $s2, 0, loop_end	# if string length == 0, end loop
string_length_is_not_found:

loop_2:

bgeu $s1, $s2, loop

lb $t1, buffer($s1)	# load first letter 
beqz $t1, program_loop_end

addiu $s1, $s1, 1	# increment counter

lb $t2, buffer($s1)	# load second letter
bne $t2, 0x0a, second_letter_is_not_new_line
move $t3, $s1		# set full string length constant as a counter 
addiu $t3, $t3, -1	# remove new line escape character from reverse
move $s2, $t3		# set string length as a counter
j loop
second_letter_is_not_new_line:

# swap letters and store in memory
sb $t1, buffer($s1)
addiu $s1, $s1, -1	# decrement counter
sb $t2, buffer($s1)
addiu $s1, $s1, 1	# increment counter

j loop_2
loop_2_end:

j loop
loop_end:

# set null 
#sb $zero, buffer($s5)

# print result
li $v0, 4
la $a0, buffer
syscall

j program_loop
program_loop_end:

li $v0, 10	# exit
syscall

.data
message: .asciiz "\nInput a string: "
buffer: .space 100

