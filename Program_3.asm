.data
hexLookup: .byte '0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'
prompt: .asciiz "Enter an integer 1-15: "
result: .asciiz "The hexadecimal is: "
.text
.globl main
main:
    li $v0, 4        
    la $a0, prompt
    syscall

    li $v0, 5          
    syscall
    move $t0, $v0      

    li $v0, 4          
    la $a0, result
    syscall

    la $t1, hexLookup  
    add $t2, $t1, $t0  
    lb  $t3, 0($t2)    

    li $v0, 11          
    move $a0, $t3
    syscall

    li $v0, 10
    syscall