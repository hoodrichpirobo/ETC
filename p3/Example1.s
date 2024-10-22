            .globl main
            .text 0x00400000

main:
            # Set $s0 to 10 in main
            li $s0, 10              # Load inmediate value 10 into $s0
            jal my_function         # Call my_function
            # After returning, $s0 should still be 10
            # Continue with the rest of the program..

my_function:
            # Save $s0 before modifying it
            sw $s0, 0($sp)          # Store $s0 to memory (stack)
            addi $sp, $sp, -4       # Adjust stack pointer

            # Use $s0 inside the my_function
            li $s0, 20              # Modify $s0

            # Restore $s0 before returning to main
            addi $sp, $sp, 4        # Adjust stack pointer back
            lw $s0, 0($sp)          # Load original $s0 from memory

            jr $ra                  # Return to caller (main)
