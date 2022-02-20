.text

.globl main
main:

ori $8, $0, 0x8000
ori $9, $0, 0x00001000
mult $8, $9

