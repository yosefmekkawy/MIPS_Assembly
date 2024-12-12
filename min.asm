.data
    array:  .word 10, 31, 5, 7, 11, 3, 8, 40, 12, 4
    message: .asciiz "Min element is: "

.text
.globl main

main:
    la $t0, array        #  array address into t0
    lw $t1, 0($t0)     #  $t1 = first element (min)
    li $t2, 0              # i= 0

loop:
    bge $t2, 10, end_loop      # If i==0 break
    lw $t3, 0($t0)                  # t3 = current array element
    blt $t3, $t1, update_min   # If current < min (t1) => min=current
    j next                  # ++i

update_min:
    move $t1, $t3           

next:
    addi $t0, $t0, 4   # move to next element
    addi $t2, $t2, 1        # ++i
    j loop      # repeat

end_loop:
    li $v0, 4                       # print string syscall
    la $a0, message         # load  message address
    syscall

    li $v0, 1               # print int syscall
    move $a0, $t1           
    syscall

    li $v0, 10
    syscall
