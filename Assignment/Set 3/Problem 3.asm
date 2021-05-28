#for(i = 0; i < a; i++)
#	for(j = i; j >= 0; j++)
#		C[i] *= j;
.data 
	myArray: .space 12
	newline: .asciiz "\n"
.text 
.globl main
main:
	#some intiale values to test
	addi $s0 , $zero , 5
	addi $s1 , $zero , 10
	addi $s2 , $zero , 15
	
	#store values in the array
	addi $t0 , $zero , 0
	sw $s0 ,myArray($t0)
	
	addi $t0,$zero,4
	sw $s1 ,myArray($t0)
	
	addi $t0,$t0,4
	sw $s2 ,myArray($t0)
	

	
	addi $t0 , $zero , 0 # initialize i = 0
	
	# if(i < a)
	ILoop: 
		bge $t0, 12 , print     # check if i > 12 goto L label 
		add $t6 , $zero , $t0	# intialize j = i
	# if(j >= 0)
	JLoop:  
		bgt $zero , $t6 , increment
		lw $s3 , myArray($t0)
		mul $s3 , $s3 , $t6	# c[i] *= j
		sw $s3,myArray($t0)     # Store the new value in array
		subi $t6,$t6,4 		# j--
		j JLoop
	
	increment:
		addi $t0,$t0,4 		# i++
		j ILoop
	
	# Print the array
	print:
		addi $t0 , $zero , 0  	# initialize i=0
		addi $t1 , $zero , 12 	# size = 12 bytes every element take 4 byte
		loop:
			beq  $t0 , $t1 , exit    	# if i > 12 exit 
			lw $t2 , myArray($t0)
			addi $t0 , $t0 , 4
			li $v0 , 1
			move $a0 , $t2
			syscall 
			#print a new line
			li $v0,4
			la $a0 , newline
			syscall 
			j loop
	
	# exit the program
	exit:
	li $v0,10
	syscall 
.end main	
	
	