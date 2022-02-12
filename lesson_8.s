.text
.globl main
.ent main
main:

	.data
		num1: .word 10
		num2: .word 20
	.text

	lw $t1, num1
	lw $t2, num2
	
	add $t0, $t1, $t2 
	li $v0, 1
	move $a0, $t0 
	syscall

li $v0, 10
syscall
.end main
