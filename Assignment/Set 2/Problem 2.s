.data
prompt :.asciiz  "Enter your String: "
Input : .space 40
.text
.globl main
main :
    #Print Message
    li  $v0 , 4
    la  $a0 , prompt
    #get text from user
    syscall 
    li  $v0 , 8
    la  $a0 , Input
    li  $a1,40
    syscall 
    #counter in char array

     li $t0, 0 #i=0

    #considering all input in uppercase 
    loop:
        lb  $t1, Input($t0) #t1 = input [i]
        beq $t1, 0, vowels #t1 == "\0" go to check vowels 
        #Equivalent to input [i] in range a:z not special char
        blt $t1, 'a', inc  #t1 less than asci code of a 61 don't do any thing'
        bgt $t1, 'z', inc  #t2 greater than asci code of z small 7A  don't do any thing
        sub $t1, $t1, 32   #t2 in range then subtract 32 to get upper case of letter
        sb  $t1, Input($t0)

    inc: 
        addi $t0, $t0, 1
        j loop

    #check about existing vowels
    vowels:
    li $t0, 0 #i=0
    li $t4,0 #count=0
    loop2:
        lb $t1, Input($t0)  #t1 = input [i]
        beq $t1, 0, exit #t1 == "\0" go to ending program 
        beq $t1, 'A',increment #if (t1 == A) count ++ , i++
        beq $t1, 'E', increment #if (t1 == E) count ++ , i++
        beq $t1, 'I', increment #if (t1 == I) count ++ , i++
        beq $t1, 'O', increment #if (t1 == O) count ++ , i++
        beq $t1, 'U', increment #if (t1 == U) count ++ , i++
	    addi $t0, $t0, 1 #default i++
         j loop2
    #increment counter , loop counter
    increment:
    addi $t0, $t0, 1
	    addi $t4, $t4, 1
	    j loop2
    #end program
    exit:
    #print the input
        li $v0, 4
        la $a0, Input
        syscall
    #print number of vowels
        li $v0,1
        move $a0,$t4
        syscall 
    #end program
        li $v0, 10
        syscall
        jr $ra