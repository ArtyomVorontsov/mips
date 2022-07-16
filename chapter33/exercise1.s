# Exercise 1 — Date
# 9/7/2003

.text
.globl main
main:
# structure:
# day
# month
# year 

li $v0, 9		# Allocate memory for structure
li $a0, 12
syscall

move $s0, $v0		# Move structure address to $s0

li $t0, 9		# Populate structure fields
sw  $t0, ($s0)
nop

li $t0, 7
sw $t0, 4($s0)
nop

li $t0, 2003
sw $t0, 8($s0)
nop

move $a0, $s0
jal print_struct
nop

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

