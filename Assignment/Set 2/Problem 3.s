#for(i = 0; i < a; i++)
#	for(j = 0; j < i; j++)
#		C[i] += j;
.data 
intArray: .space 20
newline: .asciiz "\n"
.text 
.globl main
main:
#some intiale values to test
	addi $s0,$zero,8
	addi $s1,$zero,2
	addi $s2,$zero,4
	addi $s3,$zero,5
	addi $s4,$zero,10
#store them in memory
	addi $t0,$zero,0
	sw	 $s0 ,intArray($t0) #intArray[0]=8
	
	addi $t0,$zero,4
	sw	 $s1 ,intArray($t0)#intArray[0]=2
	
	addi $t0,$t0,4
	sw	 $s2 ,intArray($t0)#intArray[0]=4
	
	addi $t0,$t0,4
	sw	 $s3 ,intArray($t0)#intArray[0]=5
	
	addi $t0,$t0,4
	sw	 $s4 ,intArray($t0)#intArray[0]=10
#reintialize counter
	addi $t0,$zero,0 #i=0
	#if( i <= a) i'm not allowed to break limit of array go to print new array
	loop1: 
		bge  $t0, 20 , L
		addi $t6,$zero,0	#j=0
	#if j < i
	loop2:  
		bgt	 $t6,$t0,inc
		lw	 $s3 , intArray($t0) #s3 = intArray[i]
		add	 $s3,$s3,$t6	#s3=s3+j
		sw	 $s3,intArray($t0) #intArray[i]=s3
		addi $t6,$t6,4 #j++
		j loop2
	inc:
		addi $t0,$t0,4 # i++
		j loop1
	
#loop for printing
L:
	addi $t0,$zero,0 #i=0
	addi $t1,$zero,20 #size of array =20 byte =  5 element
	while:
		beq  $t0,$t1,exit
		lw	 $t2 , intArray($t0)
		addi $t0,$t0,4
		li	 $v0,1
		move $a0,$t2
		syscall 
	#print a new line
		li	 $v0,4
		la	 $a0,newline
		syscall 
	j while
	
#end program
	exit:
	li $v0,10
	syscall 
	
	
	
	
	
