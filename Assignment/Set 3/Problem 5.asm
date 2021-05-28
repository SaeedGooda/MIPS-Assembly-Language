 .data
	input: .space 256
	isPalindrome: .asciiz  "Is a palindrome.\n"
	notPalindrome: .asciiz  "Is not a palindrome.\n"
	message: .asciiz  "Enter a String: " 

.text
main:
	# ask the user to enter the string
        la $a0 , message
        li $v0 ,  4
        syscall

	# take the string as input
        la $a0 , input
        li $a1 , 1024
        li $v0 , 8
        syscall

        la $t1 , input       # Start of the string

        la $t2 , input       # End of the string
        
        # Loop on the string to set t2 to the end of the string
	loop:
        	lb $t3 , ($t2)
        	beqz $t3 , end     # if $t3 = 0 goto end label
        	addi $t2 , $t2, 1
        	j loop
	
	end:
        	subi $t2 , $t2 , 2             # delete the '\0' and '\n'
        
	testPalindrome:
		# we will loop in string from the beginning and the end if they are equal then add 1 from start and sub 1 from end
								      # if not it will print not palindrome
        	bge $t1, $t2, isPalind
		
        	lb  $t3, ($t1)
        	lb  $t4, ($t2)
        	bne $t3, $t4, notPalind
               
        	addi $t1, $t1, 1
        	subi $t2, $t2, 1
        	j testPalindrome
	
	# Print that the string is pailindrome
	isPalind:
       		la $a0 , isPalindrome
       		li $v0 ,  4  
       		syscall
        	j          exit
	
	# Print that the string isn't palindrome
	notPalind:
        	la $a0 , notPalindrome
        	li $v0 ,  4
        	syscall
        	j          exit
        	
	# exit the program
	exit:
        	li $v0 , 10
        	syscall

.endmain
