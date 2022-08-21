# Exercise 2 — Linked List of Strings

.text
.globl main
main:

# prolog
subu $sp, $sp, 4
sw $ra, ($sp)
nop

subu $sp, $sp, 4
sw $fp, ($sp)
nop

# code

la $a0, first
nop
jal create_linked_list
nop


lw $a0, first
nop
jal print_linked_list
nop


# epilog
lw $fp, ($sp)
nop
addiu $sp, $sp, 4

lw $ra, ($sp)
nop
addiu $sp, $sp, 4

jr $ra
nop

.data
first: .word 0


.text
.globl create_linked_list
create_linked_list:
# args:
# $a0 = address of first node

# registers
# $t0 = temp
# $t1 = temp

# variables
# buffer_address = 20
# address_of_first_node_pointer = 16
# address_of_current_node - 12
# counter - 8
# linked_list_length - 4
# user_input_value - 0

# prolog
subu $sp, $sp, 4
sw $ra, ($sp)
nop

subu $sp, $sp, 4
sw $fp, ($sp)
nop

# variables
subu $sp, $sp, 24
move $fp, $sp 


# code
sw $a0, 16($fp)		# Store address_of_first_node_pointer to variable
nop

# Create first node 
li $v0, 9		# Allocate memory for first node
li $a0, 8
syscall

lw $t0, 16($fp)		# Load address_of_first_node_pointer from variable
nop

sw $v0, ($t0)		# Store first node address in address_of_first_node_pointer
nop

sw $v0, 12($fp)		# Store address in address_of_current_node
nop

# Ask user for a node value:
li $v0, 4
la $a0, ask_user_for_a_node_value
syscall

li $v0, 9		# Allocate buffer for a string 
li $a0, 128
syscall

sw $v0, 20($fp)		# Store in buffer_address
nop

# Ask for a string
lw $t0, 20($fp)		# Load buffer address
move $a0, $t0		# Move buffer to arg
li $a1, 128		# Set buffer length
li $v0, 8
syscall

lw $t0, 20($fp)		# Load buffer address
move $a0, $t0
jal copy_buffer
nop

sw $v0, ($sp)		# Store in user_input_value

# Populate first node by value
lw $t0, 12($fp)		# Load address_of_current_node
nop

lw $t1, ($fp)		# Load user_input_value
nop

sw $t1, 4($t0)		# Populate node value 
nop

# Create and populate all nodes

create_linked_list_loop:
# End loop is string "Done" is written
lw $t0, 12($fp)		# Load address_of_current_node
addiu $t0, $t0, 4
lw $t0, ($t0)
move $a0, $t0
jal is_done
nop

beqz $v0, create_linked_list_loop_end
nop

li $v0, 9		# Allocate memory for new node
li $a0, 8
syscall

lw $t0, 12($fp)		# Load address_of_current_node
nop

sw $v0, ($t0)		# Populate pointer of current node with new node address
nop

sw $v0, 12($fp)		# Set new node address as address_of_current_node
nop

# Ask user for node value
li $v0, 4
la $a0, ask_user_for_a_node_value
nop
syscall

lw $t0, 20($fp)		# Load buffer_address

move $a0, $t0		# Ask user for a string
li $a1, 128
li $v0, 8
syscall
nop

move $a0, $t0
jal copy_buffer
nop

sw $v0, ($fp)		# Store in user_input_value
nop

# Populate node value
lw $t0, 12($fp)		# Load current_node_address
nop

lw $t1, ($fp)		# Load user_input_value
nop

sw $t1, 4($t0)		# Populate node value
nop

j create_linked_list_loop
nop
create_linked_list_loop_end:

# Populate last item successor address by null
lw $t0, 12($fp)		# Load current_node_address
nop

sw $zero, ($fp)		# Store null in successor address
nop


# epilog
addiu $sp, $sp, 24
move $fp, $sp

lw $fp, ($sp)
nop
addiu $sp, $sp, 4

lw $ra, ($sp)
nop
addiu $sp, $sp, 4

jr $ra
nop

.data
ask_user_for_a_node_value: .asciiz "\nPlese type node value: \n"
ask_user_for_list_length: .asciiz "\nPlease type list length: \n"

.text 
.globl is_done
is_done:
# args
# $a0 = string address

# return:
# $v0 = (0 or 1)

# registers
# $t0 = current letter in done word
# $t1 = current letter in string from argument
# $t2 = done word address
# $t3 = provided string address

# prolog
subu $sp, $sp, 4
sw $ra, ($sp)
nop

subu $sp, $sp, 4
sw $fp, ($sp)
nop

# code

la $t2, done	# Load first letter of done word
nop
move $t3, $a0	# Load first letter of provided string

li $v0, 0	# Init return value

is_done_loop:
lb $t0, ($t2)
nop
lb $t1, ($t3)
nop

beqz $t0, is_done_loop_end
nop

bne $t0, $t1, is_done_loop_not_equal
nop

# Increment addresses
addiu $t2, $t2, 1
addiu $t3, $t3, 1

j is_done_loop
nop
is_done_loop_not_equal:
li $v0, 1		# Return not equal

is_done_loop_end:

# epilog

sw $ra, ($sp)
nop
addiu $sp, $sp, 4

sw $fp, ($sp)
nop
addiu $sp, $sp, 4

jr $ra
nop

.data
done: .asciiz "done"

.text
.globl print_linked_list
print_linked_list:
# args:
# $a0 = first node address

# variables
# first_node_address - 4
# current_node_value - 0

# prolog
subu $sp, $sp, 4
sw $ra, ($sp)
nop

subu $sp, $sp, 4
sw $fp, ($sp)
nop

subu $sp, $sp, 8
move $fp, $sp

# code
sw $a0, 4($fp)		# Store first_node_address
nop

lw $t0, 4($fp)		# Load first_node_address
nop

sw $t0, ($fp)		# Store current_node_address
nop

print_linked_list_loop:
lw $t0, ($fp)		# Load current_node_address
nop

beqz $t0, print_linked_list_loop_end
nop

li $v0, 4		# Print node value
lw $a0, 4($t0)
nop
syscall

li $v0, 4
la $a0, new_line
nop
syscall

lw $t0, ($t0)		# Load next node address
nop

sw $t0, ($fp)		# Save as current node address
nop

j print_linked_list_loop
nop
print_linked_list_loop_end:

# epilog
addiu $sp, $sp, 8
move $fp, $sp

lw $fp, ($sp)
nop
addiu $sp, $sp, 4

lw $ra, ($sp)
nop
addiu $sp, $sp, 4

jr $ra
nop

.data
new_line: .asciiz "\n"

.text
.globl copy_buffer
copy_buffer:
# It is needed to copy values from existing buffer and 
# create new buffer with length of all values in existing buffer.
# args:
# $a0 = buffer_address
# return:
# $v0 = new_buffer_address
# variables:
# 8 = new_buffer_address
# 4 = buffer_address
# 0 = buffer_length / counter

# prolog
subu $sp, $sp, 4
sw $ra, ($sp)
nop

subu $sp, $sp, 4
sw $fp, ($sp)
nop

subu $sp, $sp, 12
move $fp, $sp

# code 

sw $zero, ($fp)		# set counter to 0
nop

sw $a0, 4($fp)		# store buffer_address
nop

copy_buffer_loop:

lw $t0, ($fp)		# load buffer_length
nop
addiu $t0, $t0, 1	# increment buffer_length
sw $t0, ($fp)		# save in buffer_length
nop

# Check if byte is zero

lw $t0, 4($fp)		# load buffer_address
nop

lw $t1, ($fp)		# load buffer_length / counter
nop

addu $t0, $t0, $t1	# address with offset

lb $t1, ($t0)		# load byte from buffer_address
nop

beqz $t1, copy_buffer_loop_end
nop 

j copy_buffer_loop
nop
copy_buffer_loop_end:

lw $t0, ($fp)		# load buffer length
nop

li $v0, 9		# allocate new buffer
move $a0, $t0
syscall			# new_buffer_address is in $v0

sw $v0, 8($fp)		# save new_buffer_address


sw $zero, ($fp)		# clear buffer_length / counter
nop

copy_buffer_loop2:

beqz $t2, copy_buffer_loop2_end
nop 

lw $t0, 4($fp)		# load buffer_address
nop

lw $t1, ($fp)		# load buffer_length
nop

addu $t0, $t0, $t1	# address with offset

lb $t2, ($t0)		# load byte from buffer_address
nop

lw $t3, 8($fp)		# load new_buffer_address
nop

add $t3, $t3, $t1	# new_buffer_address with offset 

sb $t2, ($t3)
nop

lw $t1, ($fp)		# load buffer_length
nop

addiu $t1, $t1, 1	# increment buffer length

sw $t1, ($fp)
nop


j copy_buffer_loop2
nop
copy_buffer_loop2_end:

lw $v0, 8($fp)		# load new buffer address
nop
# epilog

addiu $sp, $sp, 12

lw $fp, ($sp)
nop
addiu $sp, $sp, 4

lw $ra, ($sp)
nop
addiu $sp, $sp, 4

jr $ra
nop

.data


