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
subu $sp, $sp, 20
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

sw $v0, ($fp)		# Store in user_input_value
nop

# Ask for a string
move $a0, $v0		# Move buffer to arg
li $a1, 128		# Set buffer length
li $v0, 8
syscall

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
lw $t0, 12($fp)
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

li $a0, 128		# Allocate memory for buffer
li $v0, 9
syscall

sw $v0, ($fp)		# Store in user_input_value
nop

move $a0, $v0		# Ask user for a string
li $a1, 128
li $v0, 8
syscall
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
addiu $sp, $sp, 20
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
addiu $t2, $t2, 4
addiu $t3, $t3, 4

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
