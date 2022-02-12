## Program to add two plus three 
        .text
        .globl  main

main:
	.data
		op: .word 0x2
		op_two: .word 0x3

	.text

	lw $t1, opp	
	lw $t2, opp_two
        ori     $t3 , zero , $t1       # put two's comp. two into register 8
        ori     $t4 , zero , $t2       # put two's comp. three into register 9
        addu    $v0 , $t3 , $t4       # add register 8 and 9, put result in 10

## End of file
