# capitalize 
# $8 = memory address
# $9 = letter
# $10 = value before lowest lowecase letter in ascii (0x61, a)
# $11 = next letter
# $12 = space symbol ascii
# $13 = letter is uppercase

.text

main:
lui $8, 0x1000		# load memory address
ori $9, $0, 0x20	# load first letter as ascii space
ori $10, $0, 0x60	# load lowest value before lowest lowercase letter in ascii
ori $12, $0, 0x20	# load space symbol

j check_next_letter	# to check fisrst letter in string, and capitalize it if it is needed we apply this trick
sll $0, $0, $0

loop:
lb $9, 0($8)		# load letter 
sll $0, $0, $0

beq $9, $0, loop_end	# if letter == null, end loop
sll $0, $0, $0

addiu $8, $8, 1		# increase memory address for 1 byte

check_next_letter:

lb $11, 0($8)		# load next letter 
sll $0, $0, $0

bne $9, $12 skip_capitalization		# if letter is not space, skip capitalization of next letter
sll $0, $0, $0

slt $13, $11, $10 	# if 1 capitalization skipped (because letter already is capitalized), if 0 not 
bne $13, $0, skip_capitalization
sll $0, $0, $0

addiu $11, $11, -0x20	# capitalize letter
sb $11, 0($8)		# save capitalized letter in memory
sll $0, $0, $0

skip_capitalization:

j loop
sll $0, $0, $0
loop_end:



.data
string:   .asciiz    "in a  Hole in the   ground there lived a hobbit"
