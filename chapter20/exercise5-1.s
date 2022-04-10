# Ascending Numbers Detector 
# $7 = memory address
# $8 = counter 
# $9 = array length
# $10 = array value
# $11 = array value 2 
# $13 = temp
# $14 = result (0 = desc, 1 = asc)

.text

main:
lui $7, 0x1000		# init memory address
or $8, $0, $0		# init counter
lw $9, 0($7)		# load array length
addiu $7, $7, 4		# increment memory address
lw $10, 0($7)		# load array value 1
or $11, $0, $0 		# init array value 2
ori $14, $0, 1		# init result to asc

loop:
slt $13, $8, $9		# if counter < array length, set $13 to 1
beq $13, $0, loop_end
sll $0, $0, $0

lw $11, 4($7)		# load array value 2
sll $0, $0, $0

slt $13, $10, $11 	# if array value 1 < array value 2, set $13 1
beq $13, $0, set_desc
sll $0, $0, $0

or $10, $0, $11 	# copy array value 2 to array value 1

addiu $8, $8, 2		# increment counter
addiu $7, $7, 4		# increment memory address by 1 word

j loop
sll $0, $0, $0

set_desc:
or $14, $0, $0		# set result to desc

loop_end:

.data
size:   .word 10
array:  .word 2, 4, 7, 12, 34, 36, 42, 8, 57, 78	# asc
array:  .word 78, 57, 8, 42, 36, 34, 12, 7, 4, 2	# desc
