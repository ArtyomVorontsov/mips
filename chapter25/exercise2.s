# Exercise 2 — String Reversal (stack-based)
# $t0 = counter
# $t1 = temp
# $t2 = counter2
.text

li $v0, 8	# prompt user for a string
la $a0, buffer
li $a1, 100
syscall

# stack pushing
loop:
lbu $t1, buffer($t0)
beq $t1, 0x0a, loop_end	# if symbol == null, end loop
addiu $sp, $sp, 4		# shift stack pointer
sb $t1, ($sp)			# push value
addiu $t0, $t0, 1		# increment counter
j loop
loop_end:

# stack poping
loop2:
beq $t0, $zero, loop2_end	
lbu $t1, ($sp)		# pop value
subu $sp, $sp, 4	# shift stack pointer
sb $t1, buffer($t2)
addiu $t2, $t2, 1	# increment counter2
subu $t0, $t0, 1	# decrement counter
j loop2
loop2_end:

# print reversed string
li $v0, 4
la $a0, buffer
syscall

# exit program
li $v0, 10
syscall

.data
buffer: .space 100
