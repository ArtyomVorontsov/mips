.text
.globl main 
.ent main

main:
.data
PI: .float 3.14

.text

li $v0, 2
l.s $f12, PI
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
