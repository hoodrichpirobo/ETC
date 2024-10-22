            .globl __start
            .data 0x10000000
            .text 0x00400000

__start:    li $v0, 12            # Syscall for read_char
            syscall               # Make the system call (waits for user input)
            move $t0, $v0         # Store the input character from $v0 into $t0
