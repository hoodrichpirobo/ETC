            .globl main
            .text 0x00400000

main:
            li $a0, 5               # Load 5 into $a0 (first argument)
            li $a1, 3               # Load 3 into $a1 (second argument)
            jal add_numbers         # Call function to add numbers

            # The result will be in $v0
            # $v0 will contain the sum of 5 + 3 = 8

add_numbers:
            add $v0, $a0, $a1       # $v0 = $a0 + $a1
            jr $ra                  # Return to caller (main)
