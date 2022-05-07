# String Concatenation
# $s1 = counter 
# $s2 = string counter
# $t1 = string address
# $t2 = concat buffer address 
# $t3 = string letter
# $t4 = new line
# $t5 = is second string

.text
main:

loop1:

li $s1, 0	# clear counter
li $s2, 0	# clear string counter
li $t5, 0	# set is second string to 0 (false)

li $v0, 8	# ask first string
la $a0, string_buffer_1
li $a1, 50
syscall

li $v0, 8			# ask second string
la $a0, string_buffer_2
li $a1, 50
syscall

la $t1, string_buffer_1		# load address of first string
la $t2, string_concat_buffer	# load address of concat buffer

loop2:
lb $t3, string_buffer_1($s2)	# load letter from string

bne $t3, 0x0a, not_new_line
bne $t5, $zero, loop2_end		# if is second string == 1, end loop
add $t5, 1				# set is second string to 1
la $t1, string_buffer_2			# load second string
li $t4, 0x20				# load space
sb $t4, string_concat_buffer($s1) 	# load space into buffer
addiu $s1, $s1, 1			# increment counter
li $s2, 50				# set string counter to start of second string
j loop2

not_new_line:
sb $t3, string_concat_buffer($s1)	# save letter in buffer
addiu $s1, $s1, 1	# increment counter
addiu $s2, $s2, 1	# increment string counter:
j loop2

loop2_end:
li $v0, 4		# print result
la $a0, string_concat_buffer
syscall

j loop1
loop1_end:

.data
string_buffer_1: .space 50
string_buffer_2: .space 50
string_concat_buffer: .space 100


