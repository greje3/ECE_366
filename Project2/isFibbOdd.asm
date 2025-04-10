.data
n_val: .word 9      # n = 5 (can change and run it for any number, we put it here for example purposes)
fib_val:   .word 0        # to store the actual Fibonacci number
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
 
    sw $t1, fib_val  # store the Fibonacci number

    
    move $a0, $t1    # $a0 = n (dividend)
    li $a1, 2        # $a1 = 2 (divisor)
    
    # jump to end of program
    j division_loop

fib_base_case:
 
    sw $a0, fib_val      # store the Fibonacci number
    
    move $a0, $a0    # $a0 = n (dividend)
    li $a1, 2        # $a1 = 2 (divisor)
    
    # jump to end of program
    j division_loop

division_loop:

    # while a0 >= a1 (i.e. while n >= 2)
    blt $a0, $a1, division_end

    # subtract 2 from n
    sub $a0, $a0, $a1
    j division_loop

division_end:
    
    move $t1, $a0    # remainder = m % 2

    # if remainder == 0, even store 0
    # if remainder != 0, odd  store 1
    
    bnez $t1, is_odd  # if remainder != 0, it's odd

    # even
    li $t2, 0
    sw $t2, result
    j end

is_odd:
    li $t2, 1
    sw $t2, result

end:
    j end
