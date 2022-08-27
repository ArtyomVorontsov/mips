# Test Object on asm


.text
.globl main
main:

la $a0, object1
lw $t0, ($a0)		# Load print method address
jalr $t0		# Jump to print method
nop

la $a0, object2
lw $t0, ($a0)		# Load print method address
jalr $t0		# Jump to print method
nop

li $v0, 10		# End program
syscall


.data
object1: 
.word print
.asciiz "Hello"

object2:
.word print 
.asciiz "World!\n"


.text
.globl print
print:
la $a0, 4($a0)
li $v0, 4
syscall

jr $ra
nop


