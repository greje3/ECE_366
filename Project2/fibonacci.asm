.data
n_val: .word 5      # n = 5 (can change and run it for any number, we put it here for example purposes)
result: .word 0

.text
.globl main

main:
    # load n from memory
    lw $a0, n_val


    # check if n <= 1
    blez $a0, fib_base_case

    # initialize a and b
    li $t0, 0      # a = 0
    li $t1, 1      # b = 1

    # loop (n - 1) times
    addi $a0, $a0, -1  # n = n - 1

fib_loop:

    # check if loop counter is zero.
    beqz $a0, fib_end_loop

    # temp = b
    move $t2, $t1

    # b = a + b
    add $t1, $t0, $t1

    # a = temp
    move $t0, $t2

    # decrement loop counter
    addi $a0, $a0, -1
    
    # loop back to fib_loop_inline
    j fib_loop

fib_end_loop:
    # store b (result) in memory
    sw $t1, result
    
    # jump to the end of the program
    j end

fib_base_case:
    # store n in memory
    sw $a0, result
    
    # jump to end of program
    j end

end:
    # exit the program
    li $v0, 10
    syscall
