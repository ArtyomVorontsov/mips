.text
.globl main
.ent main

main:

.data
	double_value: .double 7.0821
	zero: .double 0.0
.text

	li $v0, 3
	l.d $f0, double_value
	l.d $f2, zero
	add.d $f12, $f0, $f2
	l.d $f12, double_value
	syscall
	
	li $v0, 10
	syscall
.end main




