		 .globl __start       # Define global entry point for the program
         .text 0x00400000     # Specify the starting address for the program

__start: li $t0,75369         # Load inmediate value 75369 into register $t0 (side 1)
         li $t1,12976         # Load inmediate value 12976 into register $t1 (side 2)
         
         add $s0,$t1,$t0      # Add the values in $t0 and $t1 and store the result in $s0
                              # This step computes (t0 + t1), i.e., 25 + 30 = 55

         add $s0,$s0,$s0      # Double the value in $s0 by adding it to itself
                              # This step computes 2 * (t0 +t1), i.e., 2 * 55 = 110
                              # The perimeter is stored in $s0 (110)
