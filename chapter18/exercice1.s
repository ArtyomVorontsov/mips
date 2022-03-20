# $8 = sum of evens
# $9 = sum of odds
# $10 = sum of all numbers
# $11 = counter
# $12 = limit 

.text

main:

ori $11 $0, 0		# Init counter
ori $12, $0, 99		# Init limit

loop1_start:
slt $13, $10, $12	# Check that all numbers sum is less than limit
beq $0, $13, loop1_end	# Branch to loop_end if all numbers sum is larger than limit
sll $0, $0, $0

addu $10, $10, 1

j loop1_start
sll $0, $0, $0
loop1_end:
sll $0, $0, $0


ori $8, $0, 0		# Init even numbers accumulator
loop2_start:
slt $13, $8, $12	# Check that even numbers sum is less than limit
beq $0, $13, loop2_end	# Branch to loop_end if even numbers sum is larger than limit
sll $0, $0, $0

addu $8, $8, 2

j loop2_start
sll $0, $0, $0
loop2_end:
sll $0, $0, $0


ori $9, $0, 1		# Init odd numbers accumulator
loop3_start:
slt $13, $9, $12	# Check that odd numbers sum is less than limit
beq $0, $13, loop3_end	# Branch to loop_end if odd numbers sum is larger than limit
sll $0, $0, $0

addu $9, $9, 2

j loop3_start
sll $0, $0, $0
loop3_end:
sll $0, $0, $0
