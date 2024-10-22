            .globl __start
            .text 0x00400000

__start:    
            li $s0, '0'
            li $s1, '9'
            li $s2, 'f'
            neg $s1, $s0
