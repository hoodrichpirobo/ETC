            .globl __start
            .data 0x10000000
            .text 0x00400000

            # Branch if Equal to Zero
__start:    beqz $t0, label             # If $t0 == 0, jump to 'label'
            # Equivalent to: beq $t0, $zero, label
label:
            # Code at the label
