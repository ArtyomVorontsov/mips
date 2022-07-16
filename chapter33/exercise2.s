# Exercise 1 — Date
# 9/7/2003

.text
.globl main
main:
# structure:
# day
# month
# year 

# $s0 = strucrure address
# $s1 = amount of structures (user input)
# $s2 = all structures size
# $s3 = structure size
# $t3 = loop counter
# $t4 = offset

# prolog

subu $sp, $sp, 4
sw $ra, ($sp)
nop

subu $sp, $sp, 4
sw $s0, ($sp)
nop


# code

li $s3, 12 		# structure size

li $v0, 5 		# ask for array of structures amount
syscall
move $s1, $v0		# move user output to $t1
mul $s2, $s1, $s3	# multiply by 12 (12 is 1 structure size)

li $v0, 9		# Allocate memory for structures
move $a0, $s2
syscall

move $s0, $v0		# Move structure address to $s0

li $t3, 1 		# init counter
# Populate structure fields
main_loop:
bgt $t3, $s1, main_loop_end
nop

move $a0, $s0		# Move structure address to arg
jal populate_structure
nop

addiu $t3, $t3, 1	# increment counter
add $s0, $s0, $s3	# shift to next structure
j main_loop
nop
main_loop_end:

# return back to first structure address
subu $s0, $s0, $s2

# print structures
li $t3, 1		# init counter
main_loop_2:
bgt $t3, $s1, main_loop_2_end

move $a0, $s0
jal print_struct
nop

la $a0, new_line
li $v0, 4
syscall

addiu $t3, $t3, 1	# increment counter
add $s0, $s0, $s3	# shift to next structure
j main_loop_2
nop
main_loop_2_end:

# epilog

lw $s0, ($sp)
nop
addiu $sp, $sp, 4

lw $ra, ($sp)
nop
addiu $sp, $sp, 4

jr $ra
nop
.data


.text
.globl print_struct
print_struct:
# $a0 = structure address

# prolog
subu $sp, $sp, 4
sw $ra, ($sp)
nop

subu $sp, $sp, 4
sw $s0, ($sp)
nop

# code

move $s0, $a0		# move structure address to $s0
 
la $a0, day		# print "day: "
li $v0, 4
syscall

lw $a0, ($s0)		# print day
li $v0, 1
syscall

la $a0, new_line	# print \n
li $v0, 4
syscall

la $a0, month		# print "month: "
li $v0, 4
syscall

lw $a0, 4($s0)		# print month
li $v0, 1
syscall

la $a0, new_line	# print \n
li $v0, 4
syscall

la $a0, year 		# print "year: "
li $v0, 4
syscall

lw $a0, 8($s0)		# print year
li $v0, 1
syscall

la $a0, new_line	# print \n
li $v0, 4
syscall

# epilog
lw $s0, ($sp)
nop
addiu $sp, $sp, 4

lw $ra, ($sp)
nop
addiu $sp, $sp, 4

jr $ra
nop
.data
day: .asciiz "day: "
month: .asciiz "month: "
year: .asciiz "year: "
new_line: .asciiz "\n"

.text
.globl populate_structure
populate_structure:
# $a0 = structure address

# prolog

subu $sp, $sp, 4
sw $ra, ($sp)
nop

subu $sp, $sp, 4
sw $s0, ($sp)
nop

# code

move $s0, $a0		# move argument to $s0

# ask for day
la $a0, ask_for_day
li $v0, 4
syscall

li $v0, 5
syscall

move $t0, $v0
sw  $t0, ($s0)
nop

# ask for month
la $a0, ask_for_month
li $v0, 4
syscall

li $v0, 5
syscall

move $t0, $v0
sw $t0, 4($s0)
nop

# ask for year
la $a0, ask_for_month
li $v0, 4
syscall

li $v0, 5
syscall

move $t0, $v0
sw $t0, 8($s0)

# epilog

lw $s0, ($sp)
nop
addiu $sp, $sp, 4

lw $ra, ($sp)
nop
addiu $sp, $sp, 4

jr $ra
nop
.data
array_index_number: .asciiz "\nThis is array index: "
ask_for_day: .asciiz "\nType day: \n"
ask_for_month: .asciiz "\nType month: \n"
ask_for_year: .asciiz "\nType year: \n"

