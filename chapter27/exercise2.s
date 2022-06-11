# Exercise 1 — Same String

.text
.globl main
main:

# prolog
nop
subu $sp, $sp, 4	# push $ra on stack
sw $ra, ($sp)
nop

# code 
# ask for string 1
la $a0, buffer1
li $a1, 100
jal ask_for_string
nop

# ask for string 2
la $a0, buffer2
li $a1, 100
jal ask_for_string
nop

# compare strings 
la $a0, buffer1
la $a1, buffer2 
la $a2, buffer3
jal compare_strings
nop

move $t0, $v0		# move result

la $t1, is_equal
beqz $t0, strings_is_equal
nop

addiu $t1, $t1, 16	# set string pointer to is_not_equal

strings_is_equal:

la $a0, new_line
jal print_string
nop

la $a0, buffer1
jal print_string
nop

la $a0, new_line
jal print_string
nop

la $a0, buffer2
jal print_string
nop

la $a0, new_line
jal print_string
nop

la $a0, buffer3
jal print_string
nop

la $a0, new_line
jal print_string
nop

move $a0, $t1		# move string pointer to argument
jal print_string

# epilog
lw $ra, ($sp)
nop
addiu $sp, $sp, 4	# pop $ra from stack

li $v0, 10		# exit
syscall
nop

#jr $ra
#nop

.data
buffer1: .space 100
buffer2: .space 100
buffer3: .space 100
is_equal: .asciiz "String is equal"
is_not_equal: .asciiz "String is not equal"
new_line: .asciiz "\n"

.text
# $a0 = buffer address
# $a1 = buffer length
.globl ask_for_string
ask_for_string:
# prolog

# code
move $t0, $a0	# preserve buffer address
li $v0, 4	# print string
la $a0, ask_for_string_prompt
nop
syscall

li $v0, 8 	# read string
move $a0, $t0	# move buffer address
syscall

# epilog
jr $ra 
nop
.data
ask_for_string_prompt: .asciiz "\nPlease write string: \n > "


.text
# $a0 = first string buffer address
# $a1 = second string buffer address
# $a2 = diff string buffer address
# $s0 = first char
# $s1 = second char
# $v0 = result (0 = equal, 1 = not equal)
.globl compare_strings
compare_strings:

# prolog
subu $sp, $sp, 4	# stack push
sw $s0, ($sp)

subu $sp, $sp, 4 	# stack push
sw $s1, ($sp)

move $t0, $a0		# move first string buffer address to $t0
move $t1, $a1		# move second string buffer address to $t1
move $t2, $a2		# move diff string buffer address to $t2

# code
li $v0, 0		# set default return value
li $t4, -1
li $t5, 0

compare_strings_loop:
lbu $s0, ($t0)
nop
lbu $s1, ($t1)
nop

bne $s0, 0x0a, first_string_not_end
nop
li $t4, 1

first_string_not_end:

bne $s1, 0x0a, second_string_not_end
nop
li $t5, 1

second_string_not_end:

beq $t4, $t5, compare_strings_loop_end		# exit loop
nop

bne $s0, $s1, compare_strings_loop_not_equal
nop
 
li $t3, 0x20
sb $t3, ($t2)		# place space
nop

j compare_strings_increment_addresses
nop

compare_strings_loop_not_equal:
li $v0, 1
li $t3, 0x2A
sb $t3, ($t2)		# place * symbol
nop

compare_strings_increment_addresses:

addiu $t0, $t0, 1	# increment first string address
addiu $t1, $t1, 1	# increment second string address
addiu $t2, $t2, 1	# increment diff string address

j compare_strings_loop
nop
compare_strings_loop_end:

# epilog
lw $s1, ($sp)		# stack pop
addiu $sp, $sp, 4

lw $s0, ($sp)		# stack pop
addiu $sp, $sp, 4	

jr $ra
nop
.data


.text
# $a0 = string address
.globl print_string
print_string:
# prolog

# code
li $v0, 4
syscall

# epilog
jr $ra
nop
.data




