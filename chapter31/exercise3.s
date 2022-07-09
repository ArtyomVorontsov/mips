# Exercise 3 — Web Page RGB Colors

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

# handle registers
# handle variables

# code

loop:
li $v0, 5
syscall
move $t1, $v0

bgt $t1, 255, loop_end
nop

move $a0, $t1
jal int_to_float
nop
move $t1, $v0		# move return value to $t1

move $a0, $t1
jal convert_rgb
nop
move $t1, $v0

mtc1 $t1, $f12
li $v0, 2
syscall

li $v0, 4
la $a0, new_line
syscall

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
new_line: .asciiz "\n"

.text
int_to_float:
.globl int_to_float

# Arguments
# $a0 = 8bit int number

# Variables:
# counter = counter (offset  = 12)
# x = int bit pattern (offset = 8)
# y = most significant bit (offset = 4)
# z = max exponent (7)	(offset = 0)

# Return
# $v0 = floating point value

# prolog

subu $sp, $sp, 4		# push return address
sw $ra, ($sp)
nop

subu $sp, $sp, 4
sw $fp, ($sp)
nop

# handle s registers 

# handle variables
subu $sp, $sp, 16
move $fp, $sp

# code

li $t1, 7
sw $t1, ($sp)		# store z
nop

li $t1, 0
sw $t1, 12($sp)		# store counter
nop

move $t1, $a0	
sw $t1, 8($fp)		# store x
nop

lw $t1, 8($fp)
nop
sll $t1, $t1, 24

sw $t1 8($fp)
nop 

int_to_flat_loop:

lw $t1, 8($fp)		# load x
nop

srl $t1, $t1, 31	# shift x right by 31

sw $t1, 4($fp)		# store x in y
nop

lw $t1, 8($fp)		# load x
nop

sll $t1, $t1, 1		# shift left by 1 

sw $t1, 8($fp)		# store x
nop

lw $t1, 4($fp)		# load y
nop

beq $t1, 1, int_to_flat_loop_end
nop

lw $t1, 12($sp)		# load counter 
nop

addiu $t1, $t1, 1	# increment counter 

sw $t1, 12($sp)		# store counter
nop

bgt $t1, 7, int_to_flat_loop_end_zero
nop

j int_to_flat_loop
nop

int_to_flat_loop_end_zero:
# return zero

int_to_flat_loop_end:

lw $t1, 12($sp)
nop

nor $t1, $t1, $t1	# compute exponent
addiu $t1, $t1, 1
addiu $t1, $t1, 7
addiu $t1, $t1, 127

sll $t1, $t1, 23	# shift exponent to floating point ieee position
move $v0, $t1		# move exponent to return value

lw $t1, 8($sp)		# load x
nop
srl $t1, $t1, 9		# shift mantissa to floating point ieee position

or $v0, $v0, $t1	# merge sign bit, exponent and mantissa

# epilog
addiu $sp, $sp, 16	# remove variables

# handle s registers

lw $fp, ($sp)
nop
addiu $sp, $sp, 4	# pop from stack

lw $ra, ($sp)
nop
addiu $sp, $sp, 4	# pop from stack

jr $ra
nop

.data


.text
.globl convert_rgb
convert_rgb:
# convert rgb from rgb 255 to rgb decimal
# arguments:
# $a0 = floating point rgb 255 
# variables
# x = rgb 255 (offset = 0)
# y = counter (offset = 4)
# z = result (offset = 8)
# return:
# $v0 = floating point rgb decimal

# prolog
subu $sp, $sp, 4
sw $ra, ($sp)
nop

subu $sp, $sp, 4
sw $fp, ($sp)
nop

# handle s registers
# handle variables
subu $sp, $sp, 12
move $fp, $sp

# code

sw $a0, ($fp)		# x = $a0
nop

li.s $f0, 0.0	# set counter
li.s $f1, 0.0 	# set result
li.s $f2, 0.0	# set x
mtc1 $t1, $f3	# rgb 255
li.s $f4, 10.0	# 10.0
li.s $f5, 25.5	# 25.5
li.s $f6, 1.0	# 1.0

c.lt.s $f3, $f6 
bc1t convert_rgb_loop_end
nop

sub.s $f3, $f3, $f6
convert_rgb_loop:

div.s $f1, $f0, $f4	# counter / 10

mul.s $f2, $f0, $f5	# x

add.s $f0, $f0, $f6
c.lt.s $f3, $f2
bc1t convert_rgb_loop_end
nop

j convert_rgb_loop
nop
convert_rgb_loop_end:

mfc1 $v0, $f1		# move to return register

# epilog

# handle variables
addiu $sp, $sp, 12
move $fp, $sp

# handle s registers

lw $fp, ($sp)
nop
addiu $sp, $sp, 4

lw $ra, ($sp)
nop
addiu $sp, $sp, 4

jr $ra
nop

.data


