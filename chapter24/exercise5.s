# Dot Product
# $s1 = counter

# $t1 = value1
# $t2 = value2
# $t3 = temp
# $t4 = acc

.text
main:

loop:
li $v0, 4		# ask value
la $a0, ask_value
syscall

li $v0, 5		# prompt value
syscall

move $t3, $v0		# move value to prompt
sw $t3, vectorA($s1)	# store value
addiu $s1, $s1, 4	# increment counter
bgt $s1, 20, loop_end	# if counter > 6, end loop
j loop
loop_end:

li $s1, 0		# clear counter
loop2:			# compute dot product
lw $t1, vectorA($s1)
lw $t2, vectorB($s1)
mul $t3, $t2, $t1	
add $t4, $t4, $t3
addiu $s1, $s1, 4
bgt $s1, 8, loop2_end
j loop2
loop2_end:

li $v0, 1	# print result
move $a0, $t4
syscall

li $v0, 10	# exit 
syscall 

.data
vectorA:  .space 12    # space for xyz integers
vectorB:  .space 12    # space for xyz integers
ask_value: .asciiz "\nPut number: "

