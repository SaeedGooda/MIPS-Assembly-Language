.data
	message: .ascii "Enter a number: "
.text

.globl main
main:
	# ask the user to enter the number
	li $v0, 4
    	la $a0 , message
    	syscall
	
	# take the number as input
    	li $v0, 5
    	syscall
    	
    	# store the number
    	add $s0 , $v0 , $zero
    	add $t1 , $v0 , $zero
    	
    	li $t0, 1     # $r0 will store the result
    	
    	loop:
    		mul $t0 , $t0 , $s0
    		subi $s0 , $s0 , 1
    		bgtz $s0 , loop   # is $s0 > 0 goto loop label

    	# print the result
    	li $v0, 1
    	add $a0 , $t0 , $zero
    	syscall
	
	# exit the program
    	li $v0, 10
    	syscall
.end main 
