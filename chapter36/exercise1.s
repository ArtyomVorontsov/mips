          .globl   main
          .text
main: 
          
          lw       $t0,sub1add        # get first entry point
          jalr     $t0                # pass control
          
          lw       $t0,sub2add        # get second entry point
          jalr     $t0                # pass control

	  lw 	   $t0,sub3add
	  jalr	   $t0
          
          li      $v0,10              # return to OS
          syscall

          .data
sub1add:  .word sub1                  # Jump Table
sub2add:  .word sub2
sub3add:  .word sub3

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
messWo: .asciiz "Wonderfull"
