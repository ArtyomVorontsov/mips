.text
.globl main
.ent main
main: 
	
	.data

	.text
	addi $t1, $zero, 10
	addi $t2, $zero, 5
	mul $a0, $t1, $t2
	li $v0, 1
	syscall

li $v0, 10
syscall
.end main

