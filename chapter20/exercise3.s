# remove space from string with 1 buffer 
# $8 = memory address 
# $9 = memory address for setting letters
# $10 = space letter
# $11 = letter

.text
main:

lui $8, 0x1000
or $9, $0, $8
ori $10, $0, 0x20

loop:

lb $11, 0($8) 
sll $0, $0, $0

sb $0, 0($8)
sll $0, $0, $0

beq $11, $0, loop_end
sll $0, $0, $0

addiu $8, $8, 1

beq $11, $10, loop
sll $0, $0, $0

sb $11, 0($9)
sll $0, $0, $0

addiu $9, $9, 1

j loop
sll $0, $0, $0
loop_end:

.data
string:  .asciiz    "aaaa bbbb  cccc   dddd    eeee"
