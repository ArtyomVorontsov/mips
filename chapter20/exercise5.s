# Exercise 5 — Ascending Numbers
# $7 = array size
# $8 = memory address
# $9 = counter 
# $10 = difference between values in sequence 
# $11 = value 1  
# $12 = value 2 
# $13
# $14 = sequence flag current
# $15 = sequence flag old	

.text

main:

lui $8, 0x1000		# init memory address
lw $7, 0($8)		# load array size 
ori $15, $0, 1		# init old sequence flag

loop:

lw $11, 4($8)		# load value 1
sll $0, $0, $0
addiu $9, $9, 1		# increment counter
addiu $8, $8, 4		# increment memory address

slt $13, $9, $7		# if counter less than array size, set $13 to 1
beq $13, $0, loop_end	# if counter larger than array size, end loop
sll $0, $0, $0

lw $12, 4($8)		# load value 2
sll $0, $0, $0
sll $0, $0, $0

subu $10, $11, $12

slt $13, $10, $0
bne $13, $0, set_curr_flag_to_asc
sll $0, $0, $0

ori $14, $0, 0		# set current flag to desc

j continue
sll $0, $0, $0
set_curr_flag_to_asc:

ori $14, $0, 1		# set current flag to asc
continue:

beq $14, $15, flags_equal
sll $0, $0, $0

ori $14, $0, 3
ori $15, $0, 3
j loop_end		# jump to loop_end, flags not equal
sll $0, $0, $0

flags_equal:

or $15, $0, $14	# copy new flag to old
addiu $9, $9, 1 	# increment counter
j loop
sll $0, $0, $0

loop_end:

.data
size:   .word 10
array:  .word 2, 4, 7, 12, 34, 36, 42, 8, 57, 78
