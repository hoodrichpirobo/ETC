          .globl __start          # Define the global start point
          .text 0x00400000        # Define that this is the code section starting at address 0x00400000

__start:
          li $s0, 0               # Initialize $s0 (sum) to 0. This register will accumulate the sum of the integers

loop:
          li $v0,5                # Load the system call code for 'read_int' (code 5) into $v0
          syscall                 # Make the system call (1). The integer input from the keyboard is stored in $v0.

          addu $s0,$s0,$v0        # Add the integer stored in $v0 to the sum in $s0. The result is stored back into $s0.

          li $v0,1                # Load the system call code for 'print_int' (code 1) into $v0.
          move $a0, $s0           # Move the current sum ($s0) to $a0, which is the argument for the system call.
          syscall                 # Make the system call (2). This prints the sum ($s0) to the console.

          li $v0,11               # Load the system call code for 'print_char' (code 11) into $v0.
          li $a0, '\n'            # Load the newline character '\n' (ASCII value 10) into $a0 as the argument.
          syscall                 # Make the system call (3). This prints a newline character after printing the sum.

          b loop                  # Unconditional branch to 'loop', making the loop infinite (continues reading integers).

          li $v0,10               # Load the system call for 'exit' (code 10) into $v0.
          syscall                 # Make the system call (4). This would terminate the program, but it is never reached because of the infinite loop.
