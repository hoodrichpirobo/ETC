            .globl __start
            .data 0x10000000

N:          .space 4
            .text 0x00400000

            # Inmediate values can be written in either decimal or hexadecimal

__start:    la $t0, N             # Load the address of N into $t0
            li $s1, 200000        # Load inmediate value 200000 into $s1
            sw $s1, 0($t0)        # Store $s1 (200000) into memory location N
