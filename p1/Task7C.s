            .globl __start
            .data 0x10000000
X:          .space 4
            .text 0x00400000

__start:    la $t0, X 
            sb $zero, 0($t0)
            sb $zero, 1($t0)
            sb $zero, 2($t0)
            sb $zero, 3($t0)
