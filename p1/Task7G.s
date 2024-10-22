            .globl __start
            .data 0x10000000
X:          .space 4
            .text 0x00400000

__start:    la $t0, X
            lw $t1, 0($t0)
            sw $t1, 0($t0)
