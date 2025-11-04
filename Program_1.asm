.data  
# Data segment for variables and constants  
msg1: .asciiz "Enter a time of day (0-23): "  
msg2: .asciiz "It is morning.\n"
msg3: .asciiz "It is noon.\n"
msg4: .asciiz "It is afternoon.\n"
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

    move $t1, $v0   # move user value to to $t1 

    seq $t2, $t1, 12
    beq $t2, $zero, Unequal
    
    # print if time is noon
    li $v0, 4
    la $a0, msg3
    syscall

    j Endif 

Unequal: # branch if $t1 != 12
    slti $t2, $t1, 12
    beq $t2, $zero, Greater

    # print if time is morning
    li $v0, 4
    la $a0, msg2
    syscall

    j Endif

Greater: # branch if $t1 > 12

    # print if time is afternoon
    li $v0, 4
    la $a0, msg4
    syscall

Endif: 

    # exit program 
    li $v0, 10      # Exit system call  
    syscall