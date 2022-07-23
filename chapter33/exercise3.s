# exercise3

.text
.globl main
main:
# $s0 = array size
# $s1 = size address
# $s2 = counter
# $s4 = temp for address
# $s5 = offset

# prolog

subu $sp, $sp, 4
sw $ra, ($sp)
nop

subu $sp, $sp, 4
sw $fp, ($sp)
nop

# handle S registers

subu $sp, $sp, 4
sw $s0, ($sp)
nop

subu $sp, $sp, 4
sw $s1, ($sp)
nop

subu $sp, $sp, 4
sw $s2, ($sp)
nop

subu $sp, $sp, 4
sw $s4, ($sp)
nop

subu $sp, $sp, 4
sw $s5, ($sp)
nop

# code
li $v0, 5	# ask how many dates are needed
syscall

move $s0, $v0	# move user input to $t0
la $s1, size
sw $s0, ($s1)


loop:
bge $s2, $s0, loop_end		# if counter < array size, end loop
nop

li $v0, 9	# allocate space for structure
li $a0, 12
syscall
move $s4, $v0	# move allocated address in $s4

la $s1, dates
mul $s5, $s2, 4		# calc offset
add $s1, $s1, $s5	# add offset to array address
sw $s4, ($s1)		# store address in array
nop

move $a0, $s4
jal populate_structure
nop

addiu $s2, $s2, 1	# increment counter
j loop
nop
loop_end:

li $s2, 0	# clear counter
li $s5, 0	# clear offset

loop2:
bge $s2, $s0, loop2_end		# if counter < array size, end loop
nop
la $s4, dates
nop
mul $s5, $s2, 4		# calc offset
add $s4, $s4, $s5	# add offset to array address

lw $a0, ($s4)
nop
jal print_struct
nop

addiu $s2, $s2, 1	# increment counter
j loop2
nop
loop2_end:

# epilog

lw $s5, ($sp)
nop
addiu $sp, $sp, 4

lw $s4, ($sp)
nop
addiu $sp, $sp, 4

lw $s2, ($sp)
nop
addiu $sp, $sp, 4

lw $s1, ($sp)
nop
addiu $sp, $sp, 4

lw $s0, ($sp)
nop
addiu $sp, $sp, 4

lw $fp, ($sp)
nop
addiu $sp, $sp, 4

lw $ra, ($sp)
nop
addiu $sp, $sp, 4

jr $ra
nop

.data
size:     .word   0
dates:    .space  25*4       


.text
.globl print_struct
print_struct:
# $a0 = structure address

# prolog
subu $sp, $sp, 4
sw $ra, ($sp)
nop

subu $sp, $sp, 4
sw $fp, ($sp)
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

lw $fp, ($sp)
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
la $a0, ask_for_year
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

