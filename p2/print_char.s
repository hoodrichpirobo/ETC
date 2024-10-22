            .globl __start
            .data 0x10000000
            .text 0x00400000

__start:    li $v0, 11            # Syscall for print_char
            li $a0, 65            # Load ASCII value for 'A' (65) into $a0
            syscall               # Make the system call (prints 'A' to the console)
