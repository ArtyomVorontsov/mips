# String Comparison
# $t1 = string address 1
# $t2 = string address 2
# $t3 = letter 1
# $t4 = letter 2
# $t5 = result 

.text

ori $t5, $0, 1		# init result register
la $t1, string1
la $t2, string2
nop

loop:

lb $t3, 0($t1)		# load letter 1
lb $t4, 0($t2)		# load letter 2
nop

beq $t3, $t4, letter_equal
nop

or $t5, $zero, $zero	# set result letters not equal
j loop_end
nop

letter_equal:

beq $t3, $0, loop_end
nop 

addiu $t1, $t1, 1	# increment string 1 address by 1 byte
addiu $t2, $t2, 1	# increment string 2 address by 1 byte

j loop
nop

loop_end:

sw $t5, result
nop

.data
result:  .word     0
string1: .asciiz   "puffin"
string2: .asciiz   "puffin"

