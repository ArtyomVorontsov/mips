# Lottery Odds 
# formula:
# N * (N-1) * (N-2) * (N-3) * (N-4) * ... * (N-K+1)
# -------------------------------------------------
#       1  *   2   *   3   *  4    * ... * K 

# $s1 = N Accumulator 
# $s2 = C Accumulator
# $t1 = N
# $t2 = K
# $t3 = counter
# $t4 = result
.text

main:
li $s1, 50		# init N Accumulator 
li $s2, 1		# init C Accumulator 

li $t1, 50
li $t2, 3

loop:
addiu $t3, $t3, 1	# increment counter
bgtu $t3, $t2, loop_end

addu $t1, $t1, -1
mul $s1, $s1, $t1

mul $s2, $s2, $t3 

j loop

loop_end:

div $s1, $s2
mflo $t4

# print 
li $v0, 1
move $a0, $t4
syscall 

# end
li $v0, 10
syscall

