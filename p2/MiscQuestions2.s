            .globl __start
            .text 0x00400000

__start:    
            li $s0, '0'
            li $s1, '9'
            li $s2, 'f'
loop:
            li $v0, 12
            syscall
            beq $v0, $s2, exit
            ble $v0, $s0, loop
            bge $v0, $s1, loop

            move $a0, $v0
            li $v0, 11
            syscall
            b loop
exit:
            li $v0, 10
            syscall
