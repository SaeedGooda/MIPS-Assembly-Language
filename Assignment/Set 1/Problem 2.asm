# Author => Abdelrahman Ashraf Mohamed
# version => 1
#Date: 31/12/2020
#prints the number of lowercase and uppercase (Task2_Set1)

.data
	message: .asciiz "Enter the String: "   # a message to print it to take the input from the user
	lower: .asciiz "LOWERCASE: "
	upper: .asciiz "\nUPPERCASE: "
	myArray: .space 80 
.text
   ######################################
   # to take the characters from the user
        #cout<<"Enter character: "
          li $v0 , 4
          la $a0 , message
          syscall
          #########################
          # cin>> ch
          li $v0 , 8
          la $a0 , myArray
          li $a1 , 20
          syscall
          li $t0 , 0   # counter i 
          la $t1 , myArray # pointer to array
          li $t5 , 0 # counter for lowerCase
          li $t6 , 0 # counter for upperCase
          loop:
             beq $t0 , $a1 , done
             lb $t2 , ($t1)   # t2 = arr[i]
             bge $t2 , 97 , countLower 
             bge $t2 , 65 , countUpper
             addi $t0 , $t0 , 1
             addi $t1 , $t1 , 1
             j loop
             countUpper:
                 addi $t6 , $t6 , 1  # upperCase++
                 addi $t0 , $t0 , 1
                 addi $t1 , $t1 , 1
                 j loop 
            countLower:
                  addi $t5 , $t5 , 1 # lowerCase++ 
                  addi $t0 , $t0 , 1
            	  addi $t1 , $t1 , 1
		  j loop 
		  
	  done:
	     li $v0 , 4
	     la $a0 , lower
	     syscall
	     li $v0 , 1
	     move $a0 , $t5
	     syscall
	     
	     
	     li $v0 , 4
	     la $a0 , upper
	     syscall
	     li $v0 , 1
	     move $a0 , $t6
	     syscall
	     
	     li $v0,10
	     syscall
             

   
    
    
    
