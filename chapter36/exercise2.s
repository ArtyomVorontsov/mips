          .globl   main
          .text
main: 
	
	li $t1, 0	# Counter
	loop:         
	la $t0, jump_table
	mul $t2, $t1, 4
	addu $t0, $t0, $t2		# Increment jump table address
        lw $t0, ($t0)			# Get entry point
	beqz $t0, loop_end
        jalr $t0			# Pass control
	addiu $t1, $t1, 1
	j loop
	loop_end:

          
          li      $v0,10              # return to OS
          syscall

          .data
jump_table:
sub1add: .word sub1                  # Jump Table
sub2add: .word sub2
sub3add: .word sub3
sub4add: .word sub4
end: .word 0

          .text          
sub1:     li       $v0,4
          la       $a0,messH
          syscall
          jr       $ra
          .data
messH:    .asciiz  "Hello "

          .text
sub2:     li       $v0,4
          la       $a0,messW
          syscall
          jr       $ra
          .data
messW:    .asciiz  "World\n"

.text
sub3:
	li $v0, 4
	la $a0, messWo
	syscall
	jr $ra
.data	
messWo: .asciiz "Wonderfull\n"

.text
sub4:
	li $v0, 4
	la $a0, messA
	syscall
	jr $ra
.data
messA: .asciiz "Assembly!"

