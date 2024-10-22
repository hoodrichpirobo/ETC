        .globl __start
        .text 0x00400000

__start:
        li $s0,126            # Initialize $s0 to 126 (ending ASCII value).
        li $s1,32             # Set $s1 to 32 (lower limit for the loop).

loop:
        li $v0,1              # Load system call code for 'print_int' (code 1).
        move $a0,$s0          # Move the current value of $s0 (ASCII code) to $a0.
        syscall               # Print the integer value of $s0
        
        li $v0,11             # Load system call code for 'print_char' (code 11).
        li $a0,9              # Load ASCII value for Tab character ('\t') into $a0.
        syscall               # Print the Tab character.
        
        li $v0,11             # Load system call code for 'print_char' (code 11).
        move $a0,$s0          # Move the current value of $s0 (ASCII code) to $a0
        syscall               # Print the character corresponding to $s0
        
        li $v0,11             # Load system call code for 'print_char' (code 11).
        li $a0,10             # Load ASCII value for Line Feed ('\n') into $a0
        syscall               # Print the Line Feed (newline) character.

        addi $s0,$s0,-1       # Increment $s0 by -1 (previous ASCII code).
        bge $s0,$s1,loop      # If $s0 >= 32, branch back to loop to continue.

        li $v0,10             # Load system call code for 'exit' (code 10).
        syscall               # Terminate the program.
