            .globl __start
            .data 0x10000000

N:          .space 4
            .text 0x00400000

__start:    la $t0, N             # Load the address of N into $t0
            li $s1, 0             # Load inmediate value 0 into $s1
            sw $s1, 0($t0)        # Store $s1 (0) into memory location N
