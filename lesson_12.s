.text
.globl main
.ent main
main:

.data
	item_one: .word 20
	item_two: .word 10
.text

	lw $t0, item_one
	lw $t1, item_two
	mulo $a0, $t0, $t1
	li $v0, 1
	syscall

li $v0, 10
syscall
.end main
