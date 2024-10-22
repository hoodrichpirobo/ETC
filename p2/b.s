            .globl __start
            .data 0x10000000
            .text 0x00400000

            # Always true
__start:    li $t0, 5                 # Load the value 5 into $t0
            beq $t0, $zero, skip      # If $t0 == 0, branch to 'skip'
            # Code here will be executed if $t0 != 0
            li $t1, 10                # Load 10 into $t1

            b end                     # Unconditionally branch to 'end', skipping the next instructions

skip:
            li $t1, 20                # This line is skipped unless $t0 == 0

end:
            # Code execution resumes here
