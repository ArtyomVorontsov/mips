# Exercise 3 - Triangle or square

# Subroutine name: Main
# 
# Variables:
# $s0 = figure type (0 = triangle, 1 = square)
# $s1 = figure size
.text
.globl main
main:
# start
subu $sp, $sp, 4	# push to stack
sw $ra, ($sp)		
nop

# code

jal ask_for_figure
nop

move $s0, $v0
move $s1, $v1  

beqz $s0, main_draw_triangle
nop

move $a0, $s1		# set argument size
jal draw_square
nop
j end_main
nop

main_draw_triangle:
move $a0, $s1		# set argument size
jal draw_triangle
nop

end_main:

# end
lw $ra, ($sp)
nop
addiu $sp, $sp, 4	# pop from stack

jr $ra			# return control to OS
nop

.data

# Subroutine name: Ask for figure
# 
# Variables:
# $s0 = figure type
# $s1 = figure size
#
# Return:
# $v0 = figure type
# $v1 = figure size 
.text
.globl ask_for_figure
ask_for_figure:

# start
subu $sp, $sp, 4	# push to stack
sw $s0, ($sp)
nop

subu $sp, $sp, 4	# push to stack
sw $s1, ($sp)
nop

# code

li $v0, 4
la $a0, ask_for_type
syscall

li $v0, 5	# prompt figure type
syscall
move $s0, $v0

li $v0, 4
la $a0, ask_for_size
syscall

li $v0, 5	# prompt figure size
syscall
move $s1, $v0

# move to return values
move $v0, $s0
move $v1, $s1

# end
lw $s1, ($sp)
nop
addiu $sp, $sp, 4	# pop from stack

lw $s0, ($sp)		
nop
addiu $sp, $sp, 4	# pop from stack

jr $ra
.data
ask_for_type: .asciiz "\nInput figure type:"
ask_for_size: .asciiz "\nInput figure size:\n\n"


# Subroutine name: Draw triangle
#
# Arguments:
# $a0 = size
# 
# Variables:
# $s0 = counter
# $s1 = size
#
# Return: void
.text
.globl draw_triangle
draw_triangle:

# start
subu $sp, $sp, 4 	# push to stack
sw $ra, ($sp)		
nop

subu $sp, $sp, 4	# push to stack
sw $s0, ($sp)
nop

subu $sp, $sp, 4	# push to stack
sw $s1, ($sp)
nop

# code 
li $s0, 0		# clear counter
move $s1, $a0		# move size

draw_triangle_loop:
bge $s0, $s1, draw_triangle_loop_end
nop

addiu $s0, $s0, 1	# increment counter
move $a0, $s1		# line length argument
move $a1, $s0		# stars amount argument
jal draw_star_line
nop

j draw_triangle_loop
nop

draw_triangle_loop_end:

# end
lw $s1, ($sp)
nop
addiu $sp, $sp, 4	# pop from stack

lw $s0, ($sp)
nop
addiu $sp, $sp, 4	# pop from stack

lw $ra, ($sp)
nop
addiu $sp, $sp, 4	# pop from stack

jr $ra
nop
.data


# Subroutine name: Draw square
#
# Arguments:
# $a0 = size
#
# Variables:
# $s0 = counter
# $s1 = size
#
# Return: void
.text
.globl draw_square
draw_square:
# start

subu $sp, $sp, 4	# push to stack
sw $ra, ($sp)
nop

subu $sp, $sp, 4	# push to stack
sw $s0, ($sp)
nop

subu $sp, $sp, 4	# push to stack
sw $s1, ($sp)
nop

# code
li $s0, 0	# clear counter
move $s1, $a0	# move size

draw_square_loop:
beq $s0, $s1, draw_square_loop_end
nop

move $a0, $s1	# set length argument 
move $a1, $s1	# set stars amount argument
jal draw_star_line
nop

addiu $s0, $s0, 1	# increment counter
j draw_square_loop
nop
draw_square_loop_end:

# end
lw $s1, ($sp)
nop
addiu $sp, $sp, 4	# pop from stack

lw $s0, ($sp)
nop
addiu $sp, $sp, 4	# pop from stack

lw $ra, ($sp)		
nop
addiu $sp, $sp, 4	# pop from stack

jal $ra			# return control to parent subroutine
nop
.data


# Subroutine name: Draw star line
#
# Arguments:
# $a0 = length
# $a1 = stars amount
#
# Variables:
# $s0 = counter
# $s1 = length
# $s2 = stars amount
# 
# Return: void
.text
.globl draw_star_line
draw_star_line:

# start
subu $sp, $sp, 4	# push to stack
sw $s0, ($sp)
nop

subu $sp, $sp, 4	# push to stack
sw $s1, ($sp)
nop

subu $sp, $sp, 4	# push to stack
sw $s2, ($sp)
nop

# code
li $s0, 0	# clear counter
move $s1, $a0	# move length 
move $s2, $a1	# starts amount

draw_star_line_loop:

beq $s0, $s1 draw_star_line_loop_end
nop

bge $s0, $s2, draw_star_line_loop_draw_space
nop

li $v0, 4
la $a0, astriks_symbol
syscall

j draw_star_line_loop_jump_to_start
nop

draw_star_line_loop_draw_space:
li $v0, 4
la $a0, space_symbol
syscall

draw_star_line_loop_jump_to_start:
addiu $s0, $s0, 1	# increment counter
j draw_star_line_loop
nop
draw_star_line_loop_end:

li $v0, 4		# print new line symbol
la $a0, new_line_symbol
syscall
 
# end
lw $s2, ($sp)
nop
addiu $sp, $sp, 4	# pop from stack

lw $s1, ($sp)
nop
addiu $sp, $sp, 4	# pop from stack

lw $s0, ($sp)
nop
addiu $sp, $sp, 4	# pop from stack

jr $ra
nop
.data
space_symbol: .asciiz " "
astriks_symbol: .asciiz "*"
new_line_symbol: .asciiz "\n" 
