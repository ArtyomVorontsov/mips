# Exercise 2 - Two Linked Lists

.text
.globl main
main:
# prolog
subu $sp, $sp, 4
sw $ra, ($sp)
nop

subu $sp, $sp, 4
sw $fp, ($sp)
nop

# code

li $v0, 4
la $a0, p_numbers
syscall

la $t0, headP
lw $t0, ($t0)
nop
move $a0, $t0

jal traverse_linked_list
nop


li $v0, 4
la $a0, c_numbers
syscall

la $t0, headC
lw $t0, ($t0)
nop
move $a0, $t0

jal traverse_linked_list
nop

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

headP: .word elmnt01
headC: .word elmnt02

elmnt01: .word 1
	 .word elmnt03

elmnt02: .word 2
	 .word elmnt04

elmnt03: .word 3
	 .word elmnt05

elmnt04: .word 4
	 .word elmnt06

elmnt05: .word 5
	 .word elmnt07

elmnt06: .word 6
	 .word elmnt08

elmnt07: .word 7
	 .word elmnt11

elmnt08: .word 8
	 .word elmnt09

elmnt09: .word 9
	 .word elmnt10

elmnt10: .word 10
	 .word elmnt12

elmnt11: .word 11
	 .word elmnt13

elmnt12: .word 12
	 .word elmnt14

elmnt13: .word 13
	 .word elmnt17

elmnt14: .word 14
	 .word elmnt15

elmnt15: .word 15
	 .word elmnt16

elmnt16: .word 16
	 .word elmnt18

elmnt17: .word 17
	 .word elmnt21

elmnt18: .word 18
	 .word elmnt19

elmnt19: .word 19
	 .word elmnt20

elmnt20: .word 20
	 .word elmnt22

elmnt21: .word 21
	 .word elmnt23

elmnt22: .word 22
	 .word elmnt24

elmnt23: .word 23
	 .word 0

elmnt24: .word 24
	 .word elmnt25

elmnt25: .word 25
	 .word 0

p_numbers: .asciiz "\nPrime numbers:\n"
c_numbers: .asciiz "\nComposite numbers:\n"


.text
.globl traverse_linked_list
traverse_linked_list:
# $a0 = first node address
# $t0 = node address
# $t1 = node value

# prolog
subu $sp, $sp, 4
sw $ra, ($sp)
nop

subu $sp, $sp, 4
sw $fp, ($sp)
nop

# code

move $t0, $a0		# move first node address to temp register

loop_traverse_linked_list:
beqz $t0, loop_traverse_linked_list_end
nop

lw $t1, ($t0)
nop

li $v0, 1		# print node value
move $a0, $t1
syscall

li $v0, 4
la $a0, new_line
syscall

addiu $t0, $t0, 4
lw $t0, ($t0)		# load next address

j loop_traverse_linked_list
nop
loop_traverse_linked_list_end:

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
new_line: .asciiz "\n"

