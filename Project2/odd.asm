.data
n: .word 6         # input number n
result: .word 0    # output: 1 if odd, 0 if even

.text
.globl main

main:
    # load n from memory
    lw $t0, n        # $t0 = n

    move $a0, $t0    # $a0 = n (dividend)
    li $a1, 2        # $a1 = 2 (divisor)

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
