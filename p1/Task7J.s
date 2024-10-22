            .globl __start
            .data 0x10000000
X:          .space 4
            .text 0x00400000

__start:    li $t0, 0x10000000
            li $t1, 0xFFFFFFFF
            sw $t1, 0($t1)
