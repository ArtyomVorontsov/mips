# Dot Product
# $s1 = counter
# $s2 = value counter 
# $s3 = offset (12)

# $t1 = value1
# $t2 = value2
# $t3 = temp
# $t4 = acc

.text
main:

#loop:
#li $v0, 4		# ask value
#la $a0, ask_value
#syscall

#li $v0, 5		# prompt value
#syscall

#move $t3, $v0		# move value to prompt
#sb $t3, vectorA($s1)	# store value
#addiu $s1, $s1, 1	# increment counter
#bgt $s1, 5, loop_end	# if counter > 6, end loop
#j loop
#loop_end:

li $s1, 0		# clear counter
loop2:			# compute dot product
lb $t1, vectorA($s1)
lb $t2, vectorB($s1)
mul $t3, $t2, $t1	
add $t4, $t4, $t3
addiu $s1, $s1, 4
bgt $s1, 8, loop2_end
j loop2
loop2_end:

li $v0, 1		# print result
move $a0, $t4
syscall

li $v0, 10		# exit 
syscall 

.data
ask_value: .asciiz "\nPut number: "
vectorA:  .word 1, 2, 3    # space for xyz integers
vectorB:  .word 4, 5, 6    # space for xyz integers
