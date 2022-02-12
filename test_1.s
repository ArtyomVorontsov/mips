.text
.globl main 
.ent main

main:
.data
	value: .word 0

.text
	lw $a0, value 
	addu $a0, $a0, 2147

	li $v0, 1
	syscall

.data
	str: .asciiz "\n"
.text

li $v0, 4
la $a0, str
syscall

li $v0, 10
syscall
.end main
