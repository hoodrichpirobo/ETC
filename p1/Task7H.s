            .globl __start
            .data 0x10000000
X:          .space 4
            .text 0x00400000

__start:    li $t1, 50
            sw $t1, X
