# Prime Number Tester
# $t1 = counter
# $t2 = user input
# $t3 = reminder
# $s1 = result (1 = true, 0 = false)
# $s2 = loop limit


.text
main:

li $t1, 1	# init counter 
li $t2, 0	# init user input
li $t3, 0 	# init reminder
li $s1, 1	# init result
li $s2, 0 	# init loop limit

# ask user for a number
li $v0, 4
la $a0, ask_number
syscall

# read user input 
li $v0,5
syscall
move $t2, $v0
move $s2, $t2

# set loop limit
#div $s2, $s2, 2

loop:
addiu $t1, $t1, 1
bgeu $t1, $s2, loop_end
remu $t3, $t2, $t1
bnez $t3, loop
li $s1, 0
loop_end:

# print result
li $v0, 1
move $a0, $s1
syscall

# exit
li $v0, 10
syscall

.data
ask_number: .asciiz "Type a number: \n"
