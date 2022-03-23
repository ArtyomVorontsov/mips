# $8 = temp 
# temp allowed range 20 <= temp <= 40 || 60 <= temp <= 80
# $3 = temperature flag (1 = allowed rage, 0 = not allowed range)
# $9 = flag

.text

main:

ori $8, $0, 101
ori $3, $0, 1

sltiu $9, $8, 20	# set $9 to 1 if $8 is less than 20, otherwise 0
bne $9, $0, first_check_failed
sll $0, $0, $0

sltiu $9, $8, 40	# set $9 to 1 if $8 is less than 40, otherwise 0
beq $9, $0, first_check_failed
sll $0, $0, $0

ori $9, $0, 1
j second_check
sll $0, $0, $0

first_check_failed:
or $9, $0, $0

second_check:
sltiu $10, $8, 80	# set $10 to 1 if $8 is less than 80, otherwise 0
beq $10, $0, second_check_failed
sll $0, $0, $0

sltiu $10, $8, 60	# set $10 to 1 if $8 is less than 60, otherwise 0
bne $10, $0, second_check_failed
sll $0, $0, $0

ori $10, $0, 1
j check_both_checks
sll $0, $0 $0

second_check_failed:
or $10, $0, $0

check_both_checks:
beq $9, $10, out_of_range
sll $0, $0, $0

j end
sll $0, $0, $0

out_of_range:
or $3, $0, $0		# set flag to 0
j end
sll $0, $0, $0

end: 
sll $0, $0, $0

