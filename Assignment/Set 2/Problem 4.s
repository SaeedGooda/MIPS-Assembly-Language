.data 
message:.asciiz "Enter number "
even:.asciiz "\nThe number is even"
odd:.asciiz "\nThe number is odd"
.text 
.globl main
main:

#Print message to enter value 
	 li $v0 , 4
	 la $a0 , message
	 syscall
#Take user input
	 li $v0 , 5
	 syscall
 
#Store num in to register
	move $t0 , $v0
#argument of isodd
	add  $a1 ,$zero ,$t0
#call isodd function
	jal isOdd
#store return value of isodd
	add  $a0, $v0, $0

#(t1 ? "odd" : "even")
	bne  $a0,0,ODD

	li	 $v0 , 4
	la	 $a0 , even
	syscall
#end here
	syscall
	li	 $v0 ,10
	syscall 

	ODD:
	li	 $v0 , 4
	la	 $a0 , odd
#end here
	syscall
	li	 $v0 ,10
	syscall 
#-----------------------------------------

	isOdd:

	addi $sp,$sp,4
	sw	 $ra,($sp)
	jal  isEven

	lw	 $ra,($sp)
	jr	 $ra
#------------------------------------------------------------------------------
	isEven:

	addi $t1,$zero,2
	div  $a1,$t1
	mfhi $t0 #Reminder
	add  $v0,$zero,$t0
	jr   $ra