            .globl __start
            .data 0x10000000
            .text 0x00400000

            # Branch if Less Than Zero
__start:    bltz $t0, label             # If $t0 < 0, jump to 'label'
            # If $t0 >= 0, continue to the next instruction
label:
            # Code at the label
