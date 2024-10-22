        .globl __start
        .text 0x00400000

__start:
        li $s0,32             # Initialize $s0 to 32 (starting ASCII value).
        li $s1,127            # Set $s1 to 127 (upper limit for the loop, exclusive).
        li $s2,4              # Initialize $s2 to 4.

loop:
        addi $s2, $s2, -1     # Decrement $s2 by 1.

        li $v0,1              # Load system call code for 'print_int' (code 1).
        move $a0,$s0          # Move the current value of $s0 (ASCII code) to $a0.
        syscall               # Print the integer value of $s0.

        li $v0,11             # Load system call code for 'print_char' (code 11).
        li $a0,9              # Load ASCII value for Tab character ('\t') into $a0.
        syscall               # Print the Tab character.

        li $v0,11             # Load system call code for 'print_char' (code 11).
        move $a0,$s0          # Move the current value of $s0 (ASCII code) to $a0.
        syscall               # Print the character corresponding to $s0.

        bnez $s2, print_tab   # If $s2 != 0, jump to 'print_tab' (else part).

        li $s2,4              # Reset $s2 to 4 if $s2 == 0.
        li $v0,11             # Load system call code for 'print_char' (code 11).
        li $a0,10             # Load ASCII value for Line Feed ('\n') into $a0.
        syscall               # Print the Line Feed (newline) character.
        j increment           # Jump to increment block.

print_tab:
        li $v0,11             # Load system call code for 'print_char' (code 11).
        li $a0,9              # Load ASCII value for Tab character ('\t') into $a0.
        syscall               # Print the Tab character.

increment:
        addi $s0,$s0,1        # Increment $s0 by 1 (Next ASCII code).
        blt $s0,$s1,loop      # If $s0 < 127, branch back to loop to continue.

exit:
        li $v0,10             # Load system call code for 'exit' (code 10).
        syscall               # Terminate the program.
