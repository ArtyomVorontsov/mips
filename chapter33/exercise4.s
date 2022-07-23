# Exercise 4 - Image Allocation

.text
.globl main 
main:
# $s0 = counter
# $s1 = rows count 
# $s2 = column count
# $s3 = address
# $s4 - allocation memory size 

# prolog
subu $sp, $sp, 4
sw $ra, ($sp)
nop

subu $sp, $sp 4
sw $fp, ($sp)
nop

# code

la $a0, ask_row_count
li $v0, 4
syscall

li $v0, 5		# ask for row count
syscall
move $s1, $v0

la $a0, ask_column_count
li $v0, 4
syscall

li $v0, 5		# ask for column count
syscall
move $s2, $v0

mul $s4, $s1, $s2	# calc memory allocation size
mul $s4, $s4, 4
move $a0, $s4
li $v0, 9
syscall 		# allocate memory 

move $s3, $v0		# address of allocated memory

loop:
bge $s0, $s1, loop_end
nop

move $a0, $s2
move $a1, $s3
move $a2, $s0
jal write_row
nop


mul $t1, $s2, 4  
addu $s3, $s3, $t1  
addiu $s0, $s0, 1
j loop
nop
loop_end:

# epilog
lw $fp, ($sp)
nop
addiu $sp, $sp, 4

lw $ra, ($sp)
nop
addiu $sp, $sp, 4

jr $ra
nop

.data
ask_row_count: .asciiz "\nType rows count: \n"
ask_column_count: .asciiz "\nType columns count: \n"


.text
.globl write_row
write_row:
# $a0 = row size
# $a1 = address
# $a2 = write value 
# $t3 = counter

# prolog

subu $sp, $sp, 4
sw $ra, ($sp)
nop

subu $sp, $sp, 4
sw $fp, ($sp)
nop

# code 
move $t0, $a0
move $t1, $a1
move $t2, $a2
li $t3, 0	# counter

write_row_loop:
bge $t3, $t0, write_row_loop_end
nop

sw $t2, ($t1)
nop

addiu $t1, $t1, 4	# increment address
addiu $t3, $t3, 1	# increment counter
j write_row_loop
nop
write_row_loop_end:

# epilog
lw $fp, ($sp)
nop
addiu $sp, $sp, 4

lw $ra ($sp)
nop
addiu $sp, $sp 4

jr $ra
nop

.data

