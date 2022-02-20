# (x*y)/z

ori $8, $0, 0x186A # x 
ori $9, $0, 0x1388 # y
ori $10, $0, 0x61A8 # z

sll $8, $8, 8
sll $9, $9, 4
sll $10, $10, 4

ori $11, $0, 1000

# Divide all values on 1000

div $8, $11
mflo $8

sll $0, $0, $0
sll $0, $0, $0

div $9, $11
mflo $9

sll $0, $0, $0
sll $0, $0, $0

div $10, $11
mflo $10

sll $0, $0, $0
sll $0, $0, $0

# Perform expression arifmetic

mult $8, $9
mflo $8

sll $0, $0, $0
sll $0, $0, $0

div $8, $10
mflo $8

sll $0, $0, $0
sll $0, $0, $0

mult $8, $11
mflo $8
