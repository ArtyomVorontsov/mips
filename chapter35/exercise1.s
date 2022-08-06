# Exercise 1 — Subroutines

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

# Ask user for linked list length
li $v0, 4
la $a0, ask_user_for_list_length
syscall

li $v0, 5
syscall

sw $v0, 4($fp)		# Store linked_list_length
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

li $v0, 5
syscall

sw $v0, ($fp)		# Store in user_input_value
nop

# Populate first node by value
lw $t0, 12($fp)		# Load address_of_current_node
nop

lw $t1, ($fp)		# Load user_input_value
nop

sw $t1, ($t0)		# Populate node value 
nop

# Create and populate all nodes
li $t0, 1		# Init counter
sw $t0, 8($fp)		# Store counter in counter variable
nop

create_linked_list_loop:
lw $t0, 4($fp)		# Load list length
nop
lw $t1, 8($fp)		# Load counter
nop

bge $t1, $t0, create_linked_list_loop_end
nop

li $v0, 9		# Allocate memory for new node
li $a0, 8
syscall

lw $t0, 12($fp)		# Load address_of_current_node
nop

sw $v0, 4($t0)		# Populate pointer of current node with new node address
nop

sw $v0, 12($fp)		# Set new node address as address_of_current_node
nop

# Ask user for node value
li $v0, 4
la $a0, ask_user_for_a_node_value
nop
syscall

li $v0, 5
syscall
nop

sw $v0, ($fp)		# Store in user_input_value
nop

# Populate node value
lw $t0, 12($fp)		# Load current_node_address
nop

lw $t1, ($fp)		# Load user_input_value
nop

sw $t1, ($t0)		# Populate node value
nop


lw $t0, 8($fp)		# Load counter
nop
addiu $t0, $t0, 1	# Increment counter
sw $t0, 8($fp)		# Store counter
nop

j create_linked_list_loop
nop
create_linked_list_loop_end:

# Populate last item successor address by null
lw $t0, 12($fp)		# Load current_node_address
nop

sw $zero, 4($fp)	# Store null in successor address
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

li $v0, 1		# Print node value
lw $a0, ($t0)
nop
syscall

li $v0, 4
la $a0, new_line
nop
syscall

lw $t0, 4($t0)		# Load next node address
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
