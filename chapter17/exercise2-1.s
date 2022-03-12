# loop with overflow trap
# $8 = counter

.text
.globl main

main:

ori $8, $0, 1 

loop:

addu $8, $8, $8

j loop
sll $0, $0, $0





