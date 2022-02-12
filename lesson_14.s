.text
.globl main
main:

.data

	item1: .word 40
	item2: .word 2

.text

	lw $t1, item1
	lw $t2, item2

	div $t1, $t2	# Division
	
	mflo $a0
	
	li $v0, 1
	syscall

li $v0 10;
syscall
.end main
