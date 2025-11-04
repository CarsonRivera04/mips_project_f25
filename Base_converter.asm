.data
hexLookup: .byte '0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'
prompt: .asciiz "Enter an integer 0-65535: "
newline:   .asciiz "\n"
binary: .asciiz "Binary: "
hex:    .asciiz "Hexadecimal: "
x:      .asciiz "0x" 
.text
.globl main
main:
    li $v0, 4        
    la $a0, prompt
    syscall

    li $v0, 5          
    syscall
    move $t0, $v0

    li $v0 4
    la $a0, binary
    syscall

    li $t2, 15

binary_loop:
    srl $t3, $t0, $t2
    andi $t3, $t3, 1
    addi $t3, $t3, 48
    li $v0, 11
    move $a0, $t3
    syscall
    addi $t2, $t2, -1
    bge $t2, $zero, binary_loop

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 4
    la $a0, hex
    syscall

    li $v0, 4
    la $a0, x
    syscall

    la $t4, hexLookup

    li $t2, 12

hex_loop:
    srl $t5, $t0, $t2  
    andi $t5, $t5, 15  
    add $t6, $t4, $t5  
    lb  $a0, 0($t6)
    li $v0, 11
    syscall
    addi $t2, $t2, -4
    bge $t2, $zero, hex_loop

    li $v0, 4
    la $a0, newline
    syscall

end_program:
    li $v0, 10
    syscall
