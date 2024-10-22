            .globl __start
            .data 0x10000000
X:          .space 4
            .text 0x00400000

__start:    lui $t0, 0x1000         # $t0 wil be at 0x10000000, which is where X is at
            andi $t1, $t1, 0x0000   # AND with zero is zero, $t1 is zero
            sw $t1, 0($t0)          # store zero at X
