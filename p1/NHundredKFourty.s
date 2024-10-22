            .globl __start
            .data 0x10000000

N:          .space 4
            .text 0x00400000

__start:    la $t0, N                 # Load the address of N into $t0
            lui $s1, 0x0010           # Load the upper half of 0x100040 into $s1
            ori $s1, $s1, 0x0040      # Load the lower half of 0x100040 into $s1
            sw $s1, 0($t0)            # Store $s1 (0x100040) into memory location N
