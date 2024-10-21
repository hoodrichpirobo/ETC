         .globl __start            # Declare the starting point of the program (global symbol for the entry point)
         
         .data 0x10000000          # Specify the beginning of the data segment at memory address 0x10000000
         
A:       .word 25                  # Variable A stores the value 25 at memory address 0x10000000
B:       .word 30                  # Variable B stores the value 30 at memory address 0x10000004 (since .word allocates 4 bytes)
P:       .space 4                  # Reserve 4 bytes of space for storing the perimeter (P) at memory address 0x10000008
                                   # This space will be used to store the final result (perimeter).
         
         .text 0x00400000          # Start the text segment (instructions) at memory address 0x00400000

__start: la $t0, A                 # Load the address of variable A (0x10000000) into register $t0
                                   # This makes $t0 point to memory location A, which contains the value 25

         la $t1, B                 # Load the address of variable B (0x10000004) into register $t1
                                   # This makes $t1 point to memory location B, which contains the value 30

         la $t2, P                 # Load the address of variable P (0x10000008) into register $t2
                                   # This makes $t2 point to the reserved space for the perimeter (P) in memory
         
         lw $s0, 0($t0)            # Load the value from memory address stored in $t0 (A) into register $s0
                                   # $s0 now contains the value 25, which was stored in A
                                   # This is a load word instruction that accesses memory and puts the value in $s0

         lw $s1, 0($t1)            # Load the value from memory address stored in $t1 (B) into register $s1
                                   # $s1 now contains the value 30, which was stored in B
                                   # This is a load word instruction that accesses memory and puts the value in $s1

         add $s2, $s1, $s0         # Add the values in registers $s1 and $s0 and store the result in $s2
                                   # $s2 now contains the value (30 + 25) = 55, which is the sum of the two sides

         add $s2, $s2, $s2         # Double the value in $s2 by adding it to itself
                                   # $s2 now contains the value (2 * 55) = 110, which is the perimeter of the rectangle

         sw $s2, 0($t2)            # Store the value in $s2 (the perimeter) into memory at the address stored in $t2 (P)
                                   # The memory location P (0x10000008) will now contain the value 110
                                   # This is a store word instruction that writes the perimeter to memory
