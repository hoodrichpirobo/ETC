            .globl __start
            .data 0x10000000
            .text 0x00400000

            # Branch if Less Than or Equal
__start:    ble $t0, $t1, label             # If $t0 <= $t1, jump to 'label'
            # If $t0 > $t1, continue to the next instruction
label:
            # Code at the label