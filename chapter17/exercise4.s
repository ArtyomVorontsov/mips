# first_number = $8
# second_number = $9
# counter = $10
# temp = $11
# limit = $12

.text
.globl main

main:

ori $10, $0, 1		# counter
ori $12, $0, 100	# limit
ori $8, $0, 1		# first number
ori $9, $0, 2		# second number

fib_start:
beq $10, $12, exit
or $11, $0, $8		# move first number in $11
or $8, $0, $9		# new first number
addu $9, $9, $11	# new second number

addu $11, $8, $9
addiu $10, $10, 1

j fib_start
sll $0, $0, $0

exit:
sll $0, $0, $0

