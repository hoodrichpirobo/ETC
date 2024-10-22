            .globl __start
            .data 0x10000000
            .text 0x00400000

            # Branch if Not Equal to Zero
__start:    bnez $t0, label                 # If $t0 != 0, jump to 'label'
            # Equivalent to: bne $t0, $zero, label
label:
            # Code at the label
