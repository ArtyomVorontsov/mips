# Exercise 3 — Vowel Removal (stack-based)
#  a, e, i, o, u - vowels
# $t0 = counter
# $t1 = temp
# $t2 = buffer counter
.text
main:

# ask string
li $v0, 8
la $a0, buffer
li $a1, 100
syscall

subu $sp, $sp, 4	# shift stack pointer
sb $zero, ($sp)		# push zero

li $t2, -1		# init buffer counter

# push to stack
loop:
lbu $t1, buffer($t0)
beq $t1, 0x0a, loop_end

# vowel check
beq $t1, 0x61, is_vowel
beq $t1, 0x65, is_vowel
beq $t1, 0x69, is_vowel
beq $t1, 0x6F, is_vowel
beq $t1, 0x75, is_vowel

subu $sp, $sp, 4	# shift stack pointer
sb $t1, ($sp)		# push value
addiu $t2, $t2, 1	# increment buffer counter

is_vowel:
addiu $t0, $t0, 1	# increment counter
j loop
loop_end:

# clear buffer
loop2:
beq $t0, $zero, loop2_end
sb $zero, buffer($t0)
subu $t0, $t0, 1
j loop2
loop2_end:

# pop from stack 
loop3:
lbu $t1, ($sp)			# pop value
addiu $sp, $sp, 4		# shift stack pointer
sb $t1, buffer($t2)
subu $t2, $t2, 1		# decrement buffer counter
beq $t1, $zero, loop3_end
j loop3
loop3_end:

# print string
li $v0, 4
la $a0, buffer
syscall

li $v0, 10	# exit
syscall

.data
buffer: .space 100
 
