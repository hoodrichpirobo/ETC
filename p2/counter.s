          .globl __start          # Define the global start point
          .text 0x00400000        # Define that this is the code section starting at address 0x00400000

__start:
          li $s0, 0               # Initialize $s0 (sum) to 0. This register will accumulate the sum of the integers
          li $s1, 0

loop:
          li $v0, 1
          addu $a0, $s1, 1
          syscall

          li $v0, 11
          li $a0, '>'
          syscall

          li $v0,5                # Load the system call code for 'read_int' (code 5) into $v0
          syscall                 # Make the system call (1). The integer input from the keyboard is stored in $v0.
        
          beqz $v0, finish        # If $v0 == 0, branch to 'finish'

          addu $s0,$s0,$v0        # Add the integer stored in $v0 to the sum in $s0. The result is stored back into $s0.
          addu $s1,$s1,1

          b loop                  # Unconditional branch to 'loop'.

finish:

          li $v0, 11
          li $a0, '='
          syscall

          li $v0, 1
          move $a0, $s0
          syscall

          li $v0, 11
          li $a0, '\n'
          syscall

          li $v0, 11
          li $a0, 'n'
          syscall

          li $v0, 11
          li $a0, '='
          syscall

          li $v0, 1
          move $a0, $s1
          syscall
        
          li $v0,10               # Load the system call for 'exit' (code 10) into $v0.
          syscall                 # Make the system call (4).
