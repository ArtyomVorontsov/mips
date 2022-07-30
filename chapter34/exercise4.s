## linked.asm --- hard-coded linked list
##
          .text
          .globl main
          
main:

li $s2, 1

main_loop:
	bnez $s2, number_was_found
	nop
	
	 la $a0, not_found	# print not found
	 li $v0, 4
	 syscall

	number_was_found:

	li $s2, 0	# clear matched number	

	la $a0, ask_user	# ask user
	li $v0, 4
	syscall

	li $v0, 5	# ask user for int
	syscall
	move $s1, $v0	# move user input to $s1

	blt $s1, $zero, done
	nop

          la     $s0,head       # get pointer to head
          
loop:     beqz   $s0,main_loop       # while not null
	  nop
          lw     $a0,0($s0)     #   get the data 
	  nop

          lw     $s0,4($s0)     #   get next
	  bne $s1, $a0, not_match	# if user input not match 
	  nop
	  move $s2, $s1		#   matched number
          li  $v0,1          	#   print it
          syscall               #
          la     $a0,sep        #   print separator
          li     $v0,4
	  syscall
		   
	  not_match:

          b loop
	  nop

done:     la     $a0,linef      # print end of line
          li     $v0,4
          syscall               # print ending message
          la     $a0,endmess
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
ask_user: .asciiz "\nType your search query:\n"
not_found: .asciiz "\nNot found!\n"
