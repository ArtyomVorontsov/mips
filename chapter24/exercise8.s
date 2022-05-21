# selection sort 

# s0 = minIndex
# s1 = counter
# s2 = counter2
# s3 = array size
# s4 = array size - 2
# s5 = array size - 1

# t0 = temp
# t1 = minValue 
# t2 = minValue2

.text
main:

li $s0, 0
li $s1, 0
li $s2, 0
lw $s3, size		# load array size
addiu $s4, $s3, -2 	# array size -2
addiu $s5, $s3, -1 	# array size -1

loop:
blt $s4, $s1, loop_end		# if array size - 2 < counter, end loop
move $s0, $s1			# minIndex = counter

addiu $s2, $s1, 1		# set counter2
loop2:
blt $s5, $s2, loop2_end		# if array size - 1 < counter2, end loop 2

mul $t0, $s0, 4 		# generate address for minValue
lw $t1, array($t0)		# load minValue

mul $t0, $s2, 4 		# generate address for minValue2
lw $t2, array($t0)		# load minValue2

blt $t1, $t2, min_value_is_smallest		# if minValue < minValue2, go to loop2
move $s0, $s2			# minIndex = counter2
min_value_is_smallest:

addiu $s2, $s2, 1		# increment counter2
j loop2				# jump to loop2
loop2_end:

# swap values
mul $t0, $s1, 4			# generate address for minValue 
lw $t1, array($t0)		# minValue
mul $t0, $s0, 4			# generate address for minValue2
lw $t2, array($t0)		# minValue2

mul $t0, $s1, 4			# generate address for minValue 
sw $t2, array($t0)
mul $t0, $s0, 4			# generate address for minValue2 
sw $t1, array($t0)

addiu $s1, $s1, 1		# increment counter 
j loop
loop_end:

li $s1, 0			# reset counter
print_loop:
li $v0, 1			# load print int argument
bgt $s1, $s5, print_loop_end	# if counter > array length - 1, end print loop
mul $t0, $s1, 4			# generate address
lw $a0, array($t0)
syscall

li $v0, 4
la $a0, space_symbol
syscall

addiu $s1, $s1, 1		# increment counter
j print_loop
print_loop_end:

li $v0, 10
syscall

.data
size:     .word 20
array:    .word 99, 23, 45, 82, 09, 34, 71, 64, 88, 42, 12, 87, 33, 36, 83, 18, 17, 04, 52, 46
space_symbol: .asciiz " "
