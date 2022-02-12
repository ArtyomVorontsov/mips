	.text
	.globl main
	.ent main 
	main:

	.data
str: .asciiz "Hello assembly!\n"
	.text

# Code start

li $v0, 4
la $a0 str
syscall

# Code end

# Call syscall EXIT to prevent reading next instruction.
li $v0, 10
syscall
.end main
