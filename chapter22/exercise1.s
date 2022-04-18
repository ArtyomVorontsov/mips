# milles per km (5.6)
# $t0 = question address
# $t1 = consume (l/km)
# $t2 = distance (km) 
# $t3 = result whole numbers
# $t4 = new line character
# $t5 = value 100
# $t6 = numbers after the decimal point

.text

main:
ori $t5, $zero, 100		# load value 100
li $v0, 4			# load print string value
la $a0, consume_question	# load consume question string address
syscall

li $v0, 5	# read consume int value
syscall

move $t1, $v0

li $v0, 1
move $a0, $t1
syscall		# print consume value

li $v0, 4			# load print string value
la $a0, distance_question	# load distance question string address
syscall

li $v0, 5	# read distance int value
syscall
move $t2, $v0

beq $t2, $zero, exit 

li $v0, 1
move $a0, $t2
syscall		# print distance value

mult $t2, $t1	# distance * consume
mflo $t3
nop 
nop
divu $t3, $t5	# (distance * consume) / 100
mflo $t3
mfhi $t6


la $a0, new_line	# print new line symbol
li $v0, 4
syscall

li $v0, 1		# print result of consumed fuel in liters (whole numbers)
move $a0, $t3
syscall

la $t6, comma 
li $v0, 4		# print ascii comma value
move $a0, $t6 
syscall

li $v0, 1		# print result of consumed fuel in liters (numbers after decimail point)
move $a0, $t6
syscall

la $a0, new_line	# print new line symbol
li $v0, 4
syscall

j main
nop

exit:

li $v0 10
syscall

.data
new_line: .asciiz "\n"
comma: .asciiz ","
consume_question: .asciiz "How much your car consumes gasoline? "
distance_question: .asciiz "\n How long is your trip? (in km) "

