.text
main:                                 # object1.print(); 
          la       $a0,object1        #   get address of first object
          lw       $t0,0($a0)         #   get address of print method
          jalr     $t0                #   call the method
                                      # object1.cancel();
          #la       $a0,object1        #   get address of first object
          #lw       $t0,4($a0)         #   get address of cancel method
          #jalr     $t0                #   call the method
                                      # object1.print();
          la       $a0,object1        #   get address of first object
          lw       $t0,0($a0)         #   get address of print method
          jalr     $t0                #   call the method
                                      # object2.print();         
          la       $a0,object2        #   get address of second object
          lw       $t0,0($a0)         #   get address of object's method
          jalr     $t0                #   call the object's method


	la $a0, object3 
	lw $t0, 0($a0)
	jalr $t0
          
	la $a0, object3 
	lw $t0, 8($a0)
	jalr $t0


	la $a0, object3 
	lw $t0, 0($a0)
	jalr $t0

          li      $v0,10              # return to OS
          syscall

# Objects constructed in static memory.
# The implementation of an object consists of the data for each object
# and a jump table of entry points common to all objects
# of this type.

          .data
object1:
          .word    print                    # Jump Table
          .word    cancel
	.word reverse
          .asciiz  "Hello World\n"          # This object's data

object2:
          .word    print                    # Jump Table
          .word    cancel
	.word reverse
          .asciiz  "Silly Example\n"        # This object's data

object3:
	.word print			# Jump table
	.word cancel
	.word reverse
	.asciiz "New object\n"		# This object's data


# print() method
# Parameter: $a0 == address of the object
          .text         
print:
          li       $v0,4                   # print string service
          addiu    $a0,$a0,12               # address of object's string
          syscall                          # 
          jr       $ra
          
# cancel() method
# Parameter: $a0 == address of the object
# 
# Registers:
# $t0 == address of the char in the string
# $t1 == char from the string
# $t2 == 'x'

          .text         
cancel:
          addiu    $t0,$a0,12      # the string starts 8 bytes
                                   # from the start of the object
          li       $t2,'x'         # replacement character                             
          lb       $t1,0($t0)      # get first ch of string
loop:     beqz     $t1,done        # while ( ch != '\0' )
          sb       $t2,0($t0)      #   replace ch with 'x'
          addiu    $t0,$t0,1       #
          lb       $t1,0($t0)      #   get next ch
          b        loop            # end while     
done:
          jr       $ra             # return to caller

reverse: 
# $t6 = counter
# $t5 = temp
# $t4 = temp
# $t3 = counter
# $t2 = string address
# $t1 = string length
# $t0 = stack first address

li $t1, 10		# String length
move $t2, $a0		# Load object address
addu $t2, $t2, 12	# String address
move $a0, $t1		# Allocate memory for stack
li $v0, 9
syscall

move $t0, $v0		# Stack first address
li $t3, 0		# Set counter

reverse_loop:		# Push to stack
beq $t1, $t3, reverse_loop_end
addu $t4, $t2, $t3
lb $t5, ($t4)		# Load char

addu $t4, $t0, $t3
sb $t5, ($t4)		# Store char

addiu $t3, $t3, 1	# Increment counter
j reverse_loop
reverse_loop_end:
addiu $t3, $t3, -1

li $t6, 0		# Clear counter

reverse_loop2:
beq $t1, $t6, reverse_loop2_end
addu $t4, $t0, $t3	# Calc stack address
lb $t5, ($t4)		# Load char from stack

addu $t4, $t2, $t6	# Calc string address
sb $t5, ($t4)		# Store char in string

addiu $t3, $t3, -1	# Increment counter
addiu $t6, $t6, 1	# Increment counter
j reverse_loop2
reverse_loop2_end:

jr $ra			# Return to caller
