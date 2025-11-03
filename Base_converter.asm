.data  
msg1: .asciiz "Please enter an integer: "  
msg_temp: .asciiz "The decimal is: "  
msg4: .asciiz "\nWould you like to convert another integer? (0 or 1): "

.text  
.globl main  
main:  
loop:
    # print msg1 
    li $v0, 4
    la $a0, msg1
    syscall

    # get int value from user 
    li $v0, 5
    syscall

    move $t1, $v0   # move user value to to $t1 

    # print msg_temp ~~~~~~~~~~~~~~~~~
    li $v0, 4
    la $a0, msg_temp
    syscall

    # print decimal value 
    li $v0, 1
    move $a0, $t1 
    syscall

    # print msg4 ~~~~~~~~~~~~~~~~~
    li $v0, 4
    la $a0, msg4
    syscall

    # get menu input to quit or continue and store in $t0 
    li $v0, 5
    syscall 
    move $t0, $v0

    bne $t0, $zero, loop # stay in loop while ($t0 != $t0) 

    li $v0, 10      # Exit system call  
    syscall
