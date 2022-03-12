# infinite loop program 
# counter = $8
# sum = $9

.text
.globl main

main:

or $9, $0, $0
ori $8, $0, 1

loop:

addu $9, $9, $8

j loop
sll $0, $0, $0






