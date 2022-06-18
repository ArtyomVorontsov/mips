# Exersice 1 - Play Compiler
#
# main()
# {
#   int f;
#   int c;
#   
#   f = 50;
#   c = toCent( f );
#   
#   print( "f=", f, "c=", c );
# }

# int toCent( int x )
# {
#   int v;
#   v =  x - 32;
#   v =  5*v
#   v =  v/9;
#   return v;
# }

.text
.globl main
main:
# prolog

subu $sp, $sp, 4	# push to stack return address
sw $ra ($sp)
nop

subu $sp, $sp, 4	# push to stack frame pointer
sw $fp, ($sp)
nop

# store s registers
# ...

# handle variables
subu $sp, $sp, 8	# 0 = f, 1 = c
move $fp, $sp

# code
li $t0, 50
sw $t0, 0($fp)
nop

lw $t0, 0($fp)
nop
move $a0, $t0
jal toCent
nop

move $t0, $v0
sw $t0, 4($sp)
nop

# print F

lw $t0, 0($sp)
nop
move $a0, $t0
li $v0, 1
syscall

la $t0, f_equals
move $a0, $t0
li $v0, 4
syscall

# print C

lw $t0, 4($sp)
nop
move $a0, $t0
li $v0, 1
syscall

la $t0, c_equals
move $a0, $t0
li $v0, 4
syscall

# epilog

# handle variables
addiu $sp, $sp, 8

# restore s registers
# ...

lw $fp, ($sp)
nop
addiu $sp, $sp, 4	# pop from stack frame pointer

lw $ra, ($sp)
nop
addiu $sp, $sp, 4

jr $ra
nop
.data
f_equals: .asciiz " = f  \n"
c_equals: .asciiz " = c  \n"


.text
.globl toCent
toCent:
# prolog

subu $sp, $sp, 4	# push to stack
sw $ra, 0($sp)
nop

subu $sp, $sp, 4 	# push to stack
sw $fp, 0($sp)
nop

# save A registers
# ...

# handle variables
subu $sp, $sp, 4
move $fp, $sp

# code
move $t0, $a0
subu $t0, $t0, 32
sw $t0, 0($fp)
nop

lw $t0, 0($fp)
nop
mul $t0, $t0, 5
sw $t0, 0($fp)
nop

lw $t0, 0($fp)
nop
divu $t0, $t0, 9
sw $t0, 0($fp)
nop

lw $t0, 0($fp)
nop
move $v0, $t0

# epilog

addiu $sp, $sp, 4	# pop from stack variables

# restore A registers

lw $fp, 0($sp)
nop 
addiu $sp, $sp, 4	# pop from stack

lw $ra, 0($sp)
nop
addiu $sp, $sp, 4	# pop from stack

jr $ra
nop

.data

