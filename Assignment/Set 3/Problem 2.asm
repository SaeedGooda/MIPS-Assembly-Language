.data
	myArray: .asciiz "Hello"
	strLength: .space 64

.text

.globl main
main:	
	# Get the String (Array of Characters) length
	la $a0 , myArray
	Length:
    		lb $t0 , ($a0)
    		beqz $t0 , store
    		addi $t1 , $t1 , 1
    		addi $a0 , $a0 , 1
    		j Length
	# Store the length
	store:
    		sb $t1 , strLength
    	
    	# reverse the String (Array of Characters)
    	reverse:
    		la $a1 , myArray         # Store the address of the String(First character value address)
    		lb $a2 , strLength       # Store the length of the String
    		add $a1 , $a1 , $a2      # Store the address of the last character of the String
    		add $t0 , $a2 , $zero    # Counter of String Length
    		loop:
        		subi $a1 , $a1 , 1    # Decrement last element from the String that contain null terminator
        		beqz $t0 , exit       # we start from the last to reverse the string so program goto exit when counter equal 0
       			subi $t0 , $t0 , 1    # Decrement the counter by 1

        		lb $a0 , ($a1)   # Load the character at $a0
        		li $v0 , 11      # Print the character
        		syscall
        		j loop
		# Exit the program
		exit:
    			li $v0 , 10
    			syscall
.end main 
