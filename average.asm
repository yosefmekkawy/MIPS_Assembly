.data
    array:  .word 7, 2, 5, 11, 4, 6, 1, 1, 8, 3
    message: .asciiz "Average is: "

.text
.globl main

main:
    la $t0, array                   # load array address to t0
    li $t1, 0            # Initialize sum to 0
    li $t2, 0                  # i = 0

loop:
    bge $t2, 10, end_loop   # if i == 0 break
    lw $t3, 0($t0)              # load cureent at t3
    add $t1, $t1, $t3       # sum+=current
    addi $t0, $t0, 4        # move to next element
    addi $t2, $t2, 1      # ++i
    j loop                     #  repeat

end_loop:
    li $t4, 10              # load num of elements
    div $t1, $t1, $t4       # sum/=10
    mflo $t5                # t5= integer part
    mfhi $t6                # t6 = remainder

    li $v0, 4               # Print string syscall
    la $a0, message         # Load address of message
    syscall

    li $v0, 1                  # print integer part of average syscall
    move $a0, $t5           # Move integer part of average value to $a0
    syscall

    li $v0, 4               # print .
    la $a0, dot             # Load address of .
    syscall

    li $t7, 10              # Set divisor for fraction
    mul $t6, $t6, $t7         # mult remainder by 10 
    div $t6, $t6, $t4           # dividing to get decimal part
    mflo $t6                #  decimal part

    li $v0, 1               # print first decimal
    move $a0, $t6                # move the decimal value to a0
    syscall

    li $v0, 10             
    syscall

.data
    dot: .asciiz "."
