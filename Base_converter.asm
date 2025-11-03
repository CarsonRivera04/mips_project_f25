.data  
msg1: .asciiz "Please enter an integer: "  
msg9: .asciiz "The decimal is: "  
msg2: .asciiz "\nThe binary is: "
msg3: .asciiz "\nThe hexadecimal is: " 
var7: .word 69
var8: .word 23 

.text  
.globl main  
main:  
    # print msg1 
    li $v0, 4
    la $a0, msg1
    syscall

    # get int value from user 
    li $v0, 5
    syscall

    move $t0, $v0   # move user value to to $t0 

    # print msg9 ~~~~~~~~~~~~~~~~~
    li $v0, 4
    la $a0, msg9
    syscall

    # print decimal value 
    li $v0, 1
    move $a0, $t0 
    syscall

    # print msg2 ~~~~~~~~~~~~~~~~~~~~~~`
    li $v0, 4
    la $a0, msg2
    syscall

    # print binary value 
    li $v0, 1
    lw $t0, var7
    move $a0, $t0 
    syscall

    # print msg3 ~~~~~~~~~~~~~~~~~~~~~~`
    li $v0, 4
    la $a0, msg3
    syscall

    # print binary value 
    li $v0, 1
    lw $t0, var8
    move $a0, $t0 
    syscall

    li $v0, 10      # Exit system call  
    syscall
