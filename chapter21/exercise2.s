# Pair-wise Addition
# $s0 = result address
# $s1 = first array address
# $s2 = second array address
# $s3 = array size
# $t0 = counter 
# $t1 = value from first array
# $t2 = value from second array
# $t3 = sum

.text



lw $s3, size 		# load array size
la $s0, result 		# load result address
la $s1, array1 		# load array 1 address 
la $s2, array2 		# load array 2 address 
or $t0, $zero, $zero	# init counter 

loop:
beq $s3, $t0 loop_end
nop

lw $t1, 0($s1)		# load first value 
nop

lw $t2, 0($s2)		# load second value
nop

addu $t3, $t1, $t2	# add $t1 and $t2

sw $t3, 0($s0)		# store result

addu $s0, $s0, 4	# increment by 1 word result address
addu $s1, $s1, 4	# increment by 1 word first value address
addu $s2, $s2, 4	# increment by 1 word second value address
addu $t0, $t0, 1 	# increment counter

j loop
nop

loop_end:

.data
size:    .word       7
array1:  .word     -30, -23, 56, -43, 72, -18, 71
array2:  .word      45,  23, 21, -23, -82,  0, 69
result:  .word       0,   0,  0,   0,   0,  0,  0
