# infinite loop program 
# counter = $8
# sum = $9
# flag = $10

.text
.globl main

main:

ori $10, $0, 101
or $9, $0, $0
ori $8, $0, 1

loop:
beq $9, $10, exit

addu $9, $9, $8

j loop
sll $0, $0, $0

exit:	j exit
sll $0, $0, $0






