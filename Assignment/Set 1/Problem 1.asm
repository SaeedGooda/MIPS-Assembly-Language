
# This file contains Set1_Task1  (C program)
# Author => Abdelrahman Ashraf Mohamed
# version => 1
#Date: 31/12/2020 

 
.data
	message: .asciiz "Enter the first number : "   # a message to print it to take the input from the user
	message2: .asciiz "Enter the second number: "   # a message to print it to take the input from the user
	Result: .asciiz "The Result = "   # The message of the result
.text
    addi $s1 , $s0 , 0 # initial value to take the first number from the user
    addi $s2 , $s0 , 0 # initial value to take the second number from the user
    
    #to take the first number
    #loading message 
    li $v0 , 4 
    la $a0 , message
    syscall
    #user input
    li $v0 , 5
    syscall
    add $s1 , $v0 , $s1
    
     #to take the second number
    #loading message message
    li $v0 , 4 
    la $a0 , message2
    syscall
    #user input
    li $v0 , 5
    syscall
    add $s2 , $v0 , $s2
    
    #####################################
    
    #############################
    if:
    	blt $s1 , $s2 , elseIf  # if( $s1 < $s2)  goto elseIf
    	beq $s1 , $2 , else    # if($s1 == $s2)  goto else
    	add $s1 , $s1 , $s2     # $s1 = $s1 + $s2
    	j exit
    elseIf:
         sub $s1 , $s1 , $s2   # $s1 = $s1 - $s2
         j exit
   else:
       mul $s1 , $s1 , $s2
       j exit
  exit:
     #print $s1
     #Display message
     li $v0 , 4 #loading message sum
     la $a0 , Result
     syscall
      	
      # show the total grade
      li $v0 , 1
      addu $a0 , $s0 , $s1
      syscall
    
    
