# Dynamic objects

.text
.globl main
main:

li $a0, 16	# Create object
li $v0, 9
syscall

move $t0, $v0	# Init object
la $t1, object1

sw $t0, ($t1)	# Save object address
la $t2, jump_table 

lw $t1, ($t2)	# Load set method address
sw $t1, ($t0)

lw $t1, 4($t2)	# Load print method address
sw $t1, 4($t0)

lw $t1, 8($t2)	# Load double method address
sw $t1, 8($t0)

lw $a0, object1
lw $t0, ($a0)
li $a1, 4
jalr $t0

lw $a0, object1
lw $t0, 4($a0)
jalr $t0

lw $a0, object1
lw $t0, 8($a0)
jalr $t0

lw $a0, object1
lw $t0, 4($a0)
jalr $t0

li $v0, 10
syscall

.data
object1: .word 0

jump_table: 
.word set
.word print
.word double
# Object
# 0 = set
# 4 = print
# 8 = double
# 12 = number


.text
.globl set
set:
# $a0 = object address
# $a1 = number
sw $a1, 12($a0)
nop
jr $ra

.globl print
print:
# $a0 = object address
lw $a0, 12($a0)
li $v0, 1		# Print integer
syscall
jr $ra

.globl double
double:
# $a0 = object address
addiu $t0, $a0, 12
lw $t1, ($t0)
sll $t1, $t1, 1
sw $t1 ($t0) 
jr $ra


