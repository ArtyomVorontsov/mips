# String length
# $t1 = counter
# $t2 = 0x0
# $t3 = letter
# $s1 = string address

.text

main:

la $s1, string		# load string address

loop:

move $t1, $zero		# clear counter

# print message
li $v0, 4
la $a0, message
syscall

# read string
li $v0, 8
la $a0, string
li $a1, 100
syscall

string_loop:
addiu $t1, $t1, 1	# increment counter
lb $t3, string($t1)	# fetch current letter
beqz $t3, string_loop_end	# exit loop
j string_loop
string_loop_end:

addiu $t1, $t1, -1	# substract null terminartor from length
beqz $t1, loop_end 	# string length == 0

# print answer
li $v0, 1
move $a0, $t1
syscall

j loop
loop_end:

# print exit message
li $v0, 4
la $a0, exit_message
syscall

li $v0, 10 	# end program 
syscall

.data
message: .asciiz "\nWrite string: "
exit_message: .asciiz "\nExit\n"
string: .space 100
