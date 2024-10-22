            .globl __start
            .data 0x10000000
            .text 0x00400000

__start:    li $v0, 1           # Syscall for print_int
            li $a0, 5           # Load integer 5 into $a0 (argument)
            syscall             # Make the system call (prints 5 to the console)
