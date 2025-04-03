.data
n:      .word 10   # Example value for n
result: .word 0    # Store Fibonacci(n)

.text
.globl main
main:
    # Load n from memory
    la   $t0, n      # Load address of n
    lw   $a0, 0($t0) # Load value of n into $a0

    # Check if n is zero
    beq  $a0, $zero, base_case 

    # Call Fibonacci function
    jal  fibonacci

    # Store result in memory
    la   $t1, result  # Load address of result
    sw   $v0, 0($t1)  # Store computed Fibonacci(n)

    # Exit program
    li   $v0, 10
    syscall

# Fibonacci function
# Input: $a0 = n
# Output: $v0 = Fibonacci(n)
fibonacci:
    addi $sp, $sp, -8  # Allocate stack space
    sw   $ra, 4($sp)   # Save return address
    sw   $a0, 0($sp)   # Save n

    # Base case: if n <= 1, return n
    ble  $a0, 1, base_case

    # Recursive case: Fibonacci(n) = Fibonacci(n-1) + Fibonacci(n-2)
    addi $a0, $a0, -1
    jal  fibonacci  # Compute Fibonacci(n-1)
    move $t1, $v0   # Store result in $t1

    lw   $a0, 0($sp)  # Restore n
    addi $a0, $a0, -2
    jal  fibonacci  # Compute Fibonacci(n-2)

    add  $v0, $t1, $v0  # Fibonacci(n) = Fibonacci(n-1) + Fibonacci(n-2)

    # Restore stack and return
    lw   $ra, 4($sp)   # Restore return address
    addi $sp, $sp, 8   # Deallocate stack space
    jr   $ra

base_case:
    move $v0, $a0  # Return n for base case
    lw   $ra, 4($sp)   # Restore return address
    addi $sp, $sp, 8   # Deallocate stack space
    jr   $ra
