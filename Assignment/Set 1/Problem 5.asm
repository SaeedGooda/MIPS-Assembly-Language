# Author => Abdelrahman Ashraf Mohamed
# version => 1
#Date: 3/1/2021
#prints the number of lowercase and uppercase (Task5_Set1)

.data 
	#numbers to test
	num1:  .word 0x40000000 #first number 
	num2:  .word 0x40000000 #Second number 
	SignificandMask:.word 0x007FFFFF
	ExponanetMask:  .word 0x7F800000
	ibit: .word 0x00800000 #leading 1"missing one from mentissa"
	overflowMaskbit:   .word 0x01000000 #will be in bit 24
.text 
main:
	#load test numbers
	lw $s0 , num1
	lw $s1, num2
	jal   FPmul
	add $a0, $v0, $0
	li $v0,1
	move $a0,$a0
	syscall 
	li $v0,10
	syscall 

FPmul: 
	#work on extract manissa
	#1 load value of mask that allow us to get it (0-22) from 32 bit
	lw $t0 , SignificandMask
	#2 extract manissa form each number by and instruction in t2,t3
	and $t2,$s0,$t0 #mentissa of num1
	and $t3,$s1,$t0 #mentissa of num2
	#3 add leading one 
	lw $t0,ibit 	   # load  leading 1
	or $t2,$t2,$t0 # add the  leading 1 to mantissa of num1
	or $t3,$t3,$t0 # add the  leading 1 to mantissa of num2
	
	#work on extract mantissa
	lw $t0,ExponanetMask # load exponent mask
	#2 extract exponet form each number by and instruction in t4,t5
	and $t4,$s0,$t0 # extract exponent from $s0 num1
	srl $t4,$t4,23  # shift exponent right of num1
	
	and $t5,$s1,$t0 # extract exponent from $s1 num2
	srl $t5,$t5,23 # shift exponent right of num2
	
	#Compare Exponent
Compare: 
	beq  $t4,$t5,mulMantissas #if 2 of them equal then add mentissas 
	bgeu $t4,$t5,addExeponent

	#shifting	
 
addExeponent:  # to add exeponents and subtract 127
	add $t0,$t4,$t5 #  add  exponents
	subi $t1 , $t0 , 127

	
	#Adding mantissa in t6
mulMantissas:
 	mul $t6,$t2,$t3
 	
	#check for overflows
Normalization:
	lw $t0,overflowMaskbit
	and $t0,$t6,$t0
	beq $t0,$0,Done	#check bit 24
	srl $t6,$t6,1
	addi $t4,$t4,1
Done:
	lw $t0,SignificandMask # load mask
	and $t6,$t6,$t0 # mask mantissa
	sll $t4,$t4,23 # shift exponent into place
	lw $t0,ExponanetMask # load mask
	and $t4,$t4,$t0 # mask exponent
	or $v0,$t6,$t4 # place mantissa and exponent into $v0
	jr $ra # return to caller
