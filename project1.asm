.data
prompt1: .asciiz "Enter number value: "
prompt2: .asciiz "Enter the length of the sequence: "
prompt3: .asciiz "The sum is: "
.text
.globl main
main:

  #prompt user to enter value
  li $v0, 4
  la $a0, prompt1
  syscall

  #get the user input
  li $v0, 5
  syscall

  #store user input into temporary register 
  move $t1, $v0

  #prompt user for sequence length
  li $v0, 4
  la $a0, prompt2
  syscall

  #get the sequence length
  li $v0, 5
  syscall

  #store the value into another temporary register
  move $t2, $v0

  #prepare for sum loop
  move $t3, $t1   #creates copy of original number that can be manipulated
  move $t4, $t2   #creates a loop counter using the original length
  move $t5, $zero   #accumulator variable thart will hold sum

#summation
result_loop: 
  beq $t4, $zero, exit    #if loop counter = 0, exit loop
  addu $t5, $t5, $t3    #adds the current term to the sum variable
  addi $t3, $t3, 1    #increment the original number by 1
  addi $t4, $t4, -1     #decrements the loop counter 
  j result_loop     #run the loop again

#print the sum and exit 
exit: 
  li $v0, 4
  la $a0, prompt3
  syscall

  li $v0, 1
  move $a0, $t5
  syscall

  #exit instruction
  li $v0,10
  syscall





