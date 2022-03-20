#
#  branch delay slots  filled
#
init:   
        ori    $8,$0,0        # count = 0
	ori    $10, $0, 0	# accumulator

test:   sltiu  $9,$8,10       # count < 10
        beq    $9,$0,endLp    # end loop if count >= 10
        sll    $0,$0,0        # delay

                              # do stuff
	
	addu $10, $10, $8
        addiu  $8,$8,1        # count++ ;
        j      test
        sll    $0,$0,0        # delay

endLp:  sll    $0,$0,0        # branch target
