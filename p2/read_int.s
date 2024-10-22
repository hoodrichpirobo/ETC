            .globl __start
            .data 0x10000000
            .text 0x00400000

__start:    li $v0, 5             # Syscall for read_int
            syscall               # Make the system call (waits for user input)
            move $t0, $v0         # Store the input integer from $v0 into $t0
