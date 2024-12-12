.data
    array:  .word 10, 31, 5, 7, 11, 3, 8, 40, 12, 4
    message: .asciiz "Count of even numbers is: "

.text
.globl main

main:
    la $t0, array    # load array address tp $t0
    li $t1, 0                    # count = 0
    li $t2, 0               # i = 0

loop:
    bge $t2, 10, end_loop        # If (i==10) break
    lw $t3, 0($t0)          #  t3 = arr[i]
    rem $t4, $t3, 2         # t4=t3%2
    bne $t4, $zero, next    # If t4 !=0 it is odd and skip to next
    addi $t1, $t1, 1        # ++i

next:
    addi $t0, $t0, 4    # move to next element
    addi $t2, $t2, 1           # ++i
    j loop              # repeast

end_loop:
    li $v0, 4         # print string syscall
    la $a0, message       # load address of message
    syscall

    li $v0, 1               # print int syscall
    move $a0, $t1          # move count value to a0
    syscall

    li $v0, 10              
    syscall
