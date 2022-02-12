.text
	.globl main
	.ent main
	main:	

	.data
		str: .asciiz "My age is: "
		my_age: .word 19
		new_line: .asciiz "\n"
	.text

	# Load and print string value
	li $v0, 4
	la $a0, str
	syscall

	# Load and print int value 
	li $v0, 1
	lw $a0, my_age
	syscall
	
	# Load and print string value
	li $v0, 4
	la $a0, new_line
	syscall

# Progarm exit
li $v0, 10
syscall
