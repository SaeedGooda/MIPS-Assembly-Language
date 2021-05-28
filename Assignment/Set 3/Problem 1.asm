.data
	g: .asciiz "Enter the value of g: "
	h: .asciiz "Enter the value of h: "
	newLine : .asciiz "\n"
.text

.globl main
main: 
	# ask the user to enter the value of g
	la $a0, g
    	li $v0, 4
    	syscall
    	
	# take g value as input
    	li $v0, 5
    	syscall
    	add $s0 , $v0 , $0
    	
    	# ask the user to enter the value of h
	la $a0, h
    	li $v0, 4
    	syscall
	
	# take g value as input
    	li $v0, 5
    	syscall
    	add $s1 , $v0 , $0
    	
    	add $t1 , $0 , 1
    	
	beq $s0 , $s1 , s      # check if $s0 == $s1  (g == h)
	sgt $t0 , $s0 , $s1    # check if $s0 > $s1 (g > h)  make $t0 = 1 else $t0 = 0
	beq $t0 , $t1 , s      # check if t0 == t1(1)
	subi $s0 , $s0 , 1
	j end
	
	s:
		addi $s0 , $s0 , 1
	end:
	li $v0 , 1
	add $a0 , $s0 , $zero
	syscall
	
	li $v0 , 4
	la $a0 , newLine
	syscall
	
	li $v0 , 1
	add $a0 , $s1 , $zero
	syscall 
.end main 
