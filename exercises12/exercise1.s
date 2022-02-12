# put bit pattern 0xDEADBEEF into $1

.text

main:	
	.text
		or $8, $0, $0	
		ori $8, $0, 0xD 
		sll $8, $8, 28
		or $1, $1, $8
		
		or $8, $0, $0	
		ori $8, $0, 0xE
		sll $8, $8, 24
		or $1, $1, $8

		or $8, $0, $0
                ori $8, $0, 0xA
                sll $8, $8, 20
		or $1, $1, $8

		or $8, $0, $0
                ori $8, $0, 0xD
                sll $8, $8, 16
		or $1, $1, $8

		or $8, $0, $0
                ori $8, $0, 0xB
                sll $8, $8, 12
                or $1, $1, $8	
		
		or $8, $0, $0
                ori $8, $0, 0xE
                sll $8, $8, 8
                or $1, $1, $8	

		or $8, $0, $0
                ori $8, $0, 0xE
                sll $8, $8, 4
                or $1, $1, $8	

		or $8, $0, $0
                ori $8, $0, 0xF
                or $1, $1, $8	
		
		
