# linear search
# $s0 = counter
# $s1 = searcheble number
# $s2 = array size
# $s3 = array pointer

# $t0 = number

.text
main:

lw $s2, size	# load array size

li $v0, 5	# ask searcheble number
syscall
move $s1, $v0	# move searcheble number

loop:

lw $t0, array($s3)	# load number
beq $t0, $s1, found_case	# if loaded number == searcheble number, end loop

addiu $s0, $s0, 1	# increment counter
addiu $s3, $s3, 4	# increase by 1 word array pointer
bgt $s0, $s2, not_found_case	# if counter > array size, end loop
j loop

not_found_case:
li $v0, 4	# print not found string
la $a0, not_found
syscall
j loop_end

found_case:
li $v0, 4	# print found string
la $a0, found
syscall
li $v0, 1	# print counter
move $a0, $s0	
syscall

loop_end:

li $v0, 10
syscall

.data
size:     .word 12
array:    .word 50, 12, 52, -78, 03, 12, 99, 32, 53, 77, 47, 00
found: 	  .asciiz "\nLocation of number is: "
not_found: .asciiz "\nNumber not found."


