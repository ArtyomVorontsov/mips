# Exercise 2 — Triangle Numbers

.text
.globl main
main:
# prolog
subu $sp, $sp, 4
lw $ra, 0($sp)
nop

# code

li $v0, 5
syscall

move $a0, $v0
li $a1, 0
jal triangle
nop

move $t0, $v0

move $a0, $t0
li $v0, 1
syscall

# epilog
lw $ra, ($sp)
nop
addiu $sp, $sp, 4

jr $ra
nop

.data


.text
.globl triangle
triangle:
# prolog

subu $sp, $sp, 4	# push to stack
sw $ra, ($sp)
nop

subu $sp, $sp, 4	# push to stack
sw $fp, ($sp)
nop

# no A registers

subu $fp, $sp, 4
move $sp, $fp

# code

move $t0, $a0
sw $t0, 0($fp)
nop

subu $t0, $t0, $a1
sw $t0, 0($fp) 
nop

lw $t0, 0($fp)
nop

beqz $t0, triangle_equal_zero
nop

lw $t0, 0($fp)
nop


# save temp
subu $sp, $sp, 4
sw $t0, 0($sp)
nop

move $a0, $t0
li $a1, 1
jal triangle
nop

# restore temp
lw $t0, 0($sp)
nop
addiu $sp, $sp, 4

addu $t0, $t0, $v0

triangle_equal_zero:
move $v0, $t0
# epilog

addiu $sp, $fp, 4

lw $fp, 0($sp)
nop
addiu $sp, $sp, 4

lw $ra, 0($sp)
nop
addiu $sp, $sp, 4

jr $ra
nop
.data
