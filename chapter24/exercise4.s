# Triangle of Stars
# $s1 = triangle counter 
# $s2 = lines counter
# $s3 = pixels counter
# $s4 = triangle width
# $s5 = triangle center
# $s6 = triangle address

# $t1 = from
# $t2 = to 
# $t3 = space symbol (0x20)
# $t4 = asteriks symbol (0x2A)
# $t5 = new line symbol (0x0A)

.text
main:

li $t4, 0x2A	# set asteriks symbol
li $t3, 0x20	# set space symbol
li $t5, 0x0A	# set new line symbol
li $v0, 5	# get triangle width
syscall
move $s4, $v0	# set triangle width

div $s5, $s4, 2		# compute center of triangle
addiu $s5, $s5, 1

loop:			# print line loop
sub $t1, $s5, $s2	# set from
add $t2, $s5, $s2	# set to
bltz $t1, loop_end	# if from < 0, end loop
li $s3, 0		# clear pixel counter

loop2:
bgt $s3, $s4, loop2_end			# if pixel counter > triangle with, end loop 2
bleu $s3, $t1, save_space_symbol 	# if pixel counter < from, save space symbol
bgeu $s3, $t2, save_space_symbol 	# if pixel counter > to, save space symbol

sb $t4, triangle($s1) 		# save asteriks symbol
j increment_counters

save_space_symbol:
sb $t3, triangle($s1)		# save space symbol

increment_counters:
addiu $s1, $s1, 1	# increment triangle counter
addiu $s3, $s3, 1	# increment pixel counter 

j loop2
loop2_end:

sb $t5, triangle($s1)	# store new line
addiu $s1, $s1, 1	# increment triangle counter 
addiu $s2, $s2, 1	# increment lines counter
j loop

loop_end:

li $v0, 4		# print triangle
la $a0, triangle
syscall

li $v0, 10		# exit
syscall

.data
triangle: .space 500
