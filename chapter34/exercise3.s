## linked.asm --- hard-coded linked list
##
          .text
          .globl main
          
main:
          la     $s0,head       # get pointer to head
	  li $s1, 0		# declare sum register
          
loop:     beqz   $s0,done       # while not null
          lw     $t0,0($s0)     # get the data 
	  add $s1, $s1, $t0	# accumulate in sum register
          
          lw     $s0,4($s0)     #   get next
          b      loop
          
done:     
	  move $a0, $s1		# print sum
	  li $v0, 1
	  syscall

	  la     $a0,linef      # print end of line
          li     $v0,4
          syscall               
		
          la     $a0,endmess	# print ending message
          li     $v0,4
          syscall
          
          li     $v0,10         # return to OS
          syscall   
           
          .data

head:
elmnt01:  .word  1
          .word  elmnt02

elmnt02:  .word  2
          .word elmnt03 

elmnt03:  .word  3
          .word elmnt04 

elmnt04:  .word  5
          .word  elmnt05
          
elmnt05:  .word  7
          .word  0

sep:      .asciiz "  "
linef:    .asciiz "\n"
endmess:  .asciiz "done\n"

