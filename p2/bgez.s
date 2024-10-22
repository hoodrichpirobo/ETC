            .globl __start
            .data 0x10000000
            .text 0x00400000

            # Branch if Greater Than or Equal to Zero
__start:    bgez $t0, label                             # If $t0 >= 0, jump to 'label'
            # If $t0 < 0, continue to the instruction
label:
            # Code at the label
