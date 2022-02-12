.text
.globl main
.ent main 
main:

	.data
		num1: .word 10
		num2: .word 5
	.text
		lw $s1, num1
		lw $s2, num2

		li $v0, 1
		sub $a0, $s1, $s2
		syscall
li $v0, 10
syscall
.end main
	
