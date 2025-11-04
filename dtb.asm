.data
arr: .space 400
.text
main: 
# TEMP COMMENT 
    li $s1, 387       # decimal 
    la $s0, arr     # base address of empty array 
    li $t0, 0       # loop counter 
for:
    sll $t1,$t0,2         # $t1=i*4 address of index 
    add $t1,$t1,$s0   # $t1 = arr + i * 4


    li $t9, 2 
    div $s1, $t9  
    mflo $s1
    mfhi $t7 

    sw $t7,0($t1)      # $t7 = arr[i]
    addi $t0,$t0,1     # increment loop counter i
    bne $s1, $zero, for

    # ~~~~~~~~~~~~~~~~~~~~~~~
    la $s0,arr             # store base address of array in $s0
    addi $t0, $t0, -1 
    li $t3, -1 
print:
    beq $t0,$t3,end
    sll $t1,$t0,2       # array traversal to access arr[i]
    add $t1,$t1,$s0
    lw $t7,0($t1)       # $t7=arr[i]
    li $v0,1            # 1 is the syscall number to print integers
    move $a0,$t7         # print $t7
    syscall

    li $a0, 32     # 32 is the ASCII code for space
    li $v0, 11          # syscall number for printing character
    syscall
    addi $t0,$t0,-1 # increment loop counter
    j print
end:

    # exit program 
    li $v0, 10      # Exit system call  
    syscall
