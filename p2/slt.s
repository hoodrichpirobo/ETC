            .globl __start
            .data 0x10000000
            .text 0x00400000

            # Set on Less Than
__start:    li $t0, 10                  # Load 10 into register $t0 
            li $t1, 20                  # Load 20 into register $t1

            slt $t2, $t0, $t1           # If $t0 < $t1, set $t2 to 1, else set $t2 to 0
            # $t2 = $t0 < $t1 ? 1 : 0

            bne $t2, $zero, label       # If $t2 != 0 (i.e., $t0 < $t1), branch to 'label'

            # If the branch is not taken, continue here
            # More code...

label:
            # Code here executes if $t0 < $t1
