# Exercise 1 — Arithmetic Evaluation (stack-based)
# 3ab - 2bc - 5a + 20ac - 16
# $t0 = temp
# $t1 = temp2
# $t3 = counter

.text


la $t1, variable

loop: 
beq $t3, 3, loop_end	# if counter == 3, end loop
li $v0, 4		# print prompt
move $a0, $t1
syscall
li $v0, 5		# read int
syscall
mul $t0, $t3, 4
sw $v0, a($t0)		# store byte
addiu $t1, $t1,  10	# shift address
addiu $t3, $t3, 1	# increment counter
j loop
loop_end:

li $t0, 0

lw $t0, a		# get a
lw $t1, bb		# get b
mul $t0, $t0, $t1	# a * b
mul $t0, $t0, 3		# 3 * ab
subu $sp, $sp, 4	# shift stack pointer 
sw $t0, ($sp)		# push value 3ab 

lw $t0, bb 		# get b
lw $t1, c 		# get c
mul $t0, $t0, $t1 	# b * c
mul $t0, $t0, -2	# bc * -2
subu $sp, $sp, 4	# shift stack pointer
sw $t0, ($sp)		# push value -bc2

lw $t0, a		# get a
mul $t0, $t0, -5	# -5a
subu $sp, $sp, 4	# shift stack pointer
sw $t0, ($sp)		# push value -a5

lw $t0, a 		# get a
lw $t1, c		# get c 
mul $t0, $t0, $t1	# a * c
mul $t0, $t0, 20	# ac * 20
subu $sp, $sp, 4	# shift stack pointer 
sw $t0, ($sp)		# store value 20ac

li $t0, -16		# load to $t1 value -16

lw $t1, ($sp) 		# pop from stack
addiu $sp, $sp, 4	# shift stack pointer
addu $t0, $t0, $t1	# 20ac - 16

lw $t1, ($sp)		# pop from stack
addiu $sp, $sp, 4	# shift stack pointer
addu $t0, $t0, $t1 	# -5a + 20ac - 16

lw $t1, ($sp)		# pop from stack
addiu $sp, $sp, 4	# shift stack pointer
addu $t0, $t0, $t1 	# -2bc - 5a + 20ac - 16

lw $t1, ($sp)		# pop from stack
addiu $sp, $sp, 4	# shift stack pointer
addu $t0, $t0, $t1	# 3ab - 2bc - 5a + 20ac -16

li $v0, 4
la $a0, answer
syscall

li $v0, 1
move $a0, $t0
syscall

li $v0, 10
syscall

.data
a: .space 4
bb: .space 4
c: .space 4
variable: .asciiz "\n Type a:"
variable2: .asciiz "\n Type b:"
variable3: .asciiz "\n Type c:
answer: .asciiz "\n Answer is: "
