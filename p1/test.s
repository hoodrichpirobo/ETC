        .globl __start

        .data 0x10000000

        .text 0x00400000

__start: li $t0, 0x10000000
         lw $t1, 4($t0)
