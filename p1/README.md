# Lab Practice 1: Registers and Main Memory (Computer Organization)

## Topics Covered:
- Memory Addressing in MIPS
- Load and Store Instructions
- Pseudo-Instructions and their Translations
- Immediate Values and Bitwise Operations
- Machine Instruction Encoding
- MIPS System Calls

---

## Memory Addressing

### `.space` Directive:
- Reserves a certain number of bytes in memory.
  - Example: `.space 4` reserves 4 bytes for a variable.

### `.data` Segment:
- Used to declare variables in memory.
  - Example: `.data 0x10000000` starts the data segment at memory address `0x10000000`.

### `.text` Segment:
- Used for the program’s instructions.
  - Example: `.text 0x00400000` starts the instruction segment at memory address `0x00400000`.

### Load and Store Instructions:
- **`lw` (load word)**: Loads a 32-bit word from memory.
- **`sw` (store word)**: Stores a 32-bit word into memory.
- **`lh` (load halfword)**: Loads 16 bits from memory.
- **`sh` (store halfword)**: Stores 16 bits into memory.
- **`lb` (load byte)**: Loads 8 bits from memory.
- **`sb` (store byte)**: Stores 8 bits into memory.

#### Example:
```assembly
    la $t0, X    # Load the address of X into $t0
    lw $t1, 0($t0)   # Load the value stored in X into $t1
    sw $t1, 0($t0)   # Store the value back into X
```

---

## Pseudo-Instructions and Their Translations

### `li` (load immediate):
- Loads an immediate value into a register. 

Example:
```assembly
    li $t1, 50  # Load decimal 50 into $t1
```

- Pseudo-instructions like `li` may be translated into different real instructions, depending on the size of the value. For instance, large values might require `lui` and `ori` to load.

### `move`:
- Pseudo-instruction that is typically translated into an `addu` (unsigned addition) instruction.
  - Example: `move $t0, $t1` becomes `addu $t0, $t1, $zero`.

---

## Immediate Values and Bitwise Operations

### Bitwise Operations:
- **`andi`**: Bitwise AND with an immediate value.
  - Example: `andi $t1, $t1, 0x0000` clears the lower half of `$t1`.

### Differences Between Operations:
- **`ori`**: Used to load immediate values into the lower half of a register.
- **`xori`**: Performs a bitwise XOR with an immediate value.

### Example of `lui` (load upper immediate):
```assembly
    lui $t0, 0x1000    # Load 0x1000 into the upper 16 bits of $t0
```

### Storing Values to Memory:
Example:
```assembly
    sw $t1, 0($t0)    # Store the word in $t1 into memory address $t0
```

---

## Address Alignment Errors
- **Unaligned Memory Access**: In MIPS, loading or storing words at non-word-aligned addresses (not divisible by 4) will cause runtime errors.
  - Example: `lw $t1, 2($t0)` causes an error if `$t0` is not properly aligned.

---

## Example Code and Comments:

```assembly
    .globl __start
    .data 0x10000000
X:  .space 4       # Reserve 4 bytes for X at 0x10000000
    .text 0x00400000

__start:
    lui $t0, 0x1000    # Load upper half of address into $t0
    andi $t1, $t1, 0x0000  # Clear $t1 by ANDing it with 0
    sw $t1, 0($t0)     # Store the result into memory at X
```

---

## Key Instructions:

1. **`lui`**: Load Upper Immediate - places an immediate value in the upper 16 bits of a register.
2. **`andi`**: AND Immediate - performs bitwise AND between a register and an immediate value.
3. **`sw`**: Store Word - stores a 32-bit word from a register into memory.
4. **`lui` + `ori`**: Combination to handle larger immediate values using upper and lower halves.

---

## Common Errors:
- **Unaligned Memory Access**: Trying to store or load a word from a non-multiple of 4 address.
- **Incorrect Immediate Sizes**: Loading large immediate values requires a combination of `lui` and `ori` or similar instructions.

---

## System Calls in MIPS:
- **`syscall`**: Used for system-level operations like printing to the console.
  - Example:
  ```assembly
  li $v0, 1        # Code for print_int
  move $a0, $s2    # Move the perimeter result to $a0
  syscall          # Make system call to print
  ```

---

## Practical Example Summary:

- **Alignment in Memory**: Words must be stored at addresses that are multiples of 4.
- **Bitwise AND with `0x0000`**: Clears registers or parts of registers.
- **Swapping High and Low Bits**: The use of `lui` and `ori` together effectively loads large immediate values.

