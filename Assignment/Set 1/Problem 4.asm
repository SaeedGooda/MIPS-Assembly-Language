# Author => Abdelrahman Ashraf Mohamed
# version => 1
#Date: 31/12/2020
# sumOdd function set1_Task4

.data
	message: .asciiz "Enter Number: "
	theResult: .asciiz "The result = "
.text

li $v0 , 4
la $a0 , message
syscall
li $v0 , 5
syscall

addi $a1 , $v0 , 0
jal sumOdd

li $v0 , 4
la $a0 , theResult
syscall
li $v0 , 1
addi $a0 , $v1 , 0
syscall

li $v0 , 10
syscall


sumOdd:
    li $t0 , 1  # int i = 0
    li $v1 , 0  # result = 0
    li $t3 , 2  # to help me in division
    li $t4 , 1  # to check if the number is even or odd
    
    for:
      bge $t0 , $a1 , returnResult
      add $v1 , $v1 , $t0
      addi $t0 , $t0 , 2 # i+=2
      j for
   returnResult:
  	 jr $ra
     
