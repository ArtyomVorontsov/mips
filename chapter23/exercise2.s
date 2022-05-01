# Integer Square Root
# $t1 = square root
# $t2 = integer
# $t3 = prev integer
# $t4 = user input

.text

main:

# get user input
li $v0, 5
syscall
move $t4, $v0

loop:
bgtu $t1, $t4, loop_end

move $t3, $t2
addiu $t2, $t2, 1
mul $t1, $t2, $t2

j loop
loop_end:

# print number 
li $v0, 1 
move $a0, $t3
syscall

# exit
li $v0, 10
syscall
