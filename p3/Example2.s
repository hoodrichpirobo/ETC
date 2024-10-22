            .globl main
            .text 0x00400000

main:
            # Set $t0 to 15 in main
            li $t0, 15          # Load inmediate value 15 into $t0
            jal use_temp        # Call function that uses temporary register

            # After returning, the value of $t0 is not guaranteed to be 15 anymore
            # Continue with the rest of the program...

use_temp:
            # Use temporary register $t0 without saving/restoring

            li $t0, 30          # Modify $t0
            jr $ra              # Return to caller (main)
