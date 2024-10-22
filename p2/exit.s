            .globl __start
            .data 0x10000000
            .text 0x00400000

__start:    li $v0, 10            # Syscall for exit
            syscall               # Make the system call (terminates the program)
