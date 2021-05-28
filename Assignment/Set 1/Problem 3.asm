# Author => Abdelrahman Ashraf Mohamed
# version => 1
# Date: 1/1/2021
# nested C loop (task3_set1)

.data
    myArray: .word 5:3   # int arr[3] = {5 , 5 , 5}
.text
    li $t0 , 0  # int i = 0
    li $s0 , 3   # int a = 3 (size of array)
    li $t1 , 0   # int j = 0
    li $s1 , 2   # int b = 2
    li $s2 , 2   # to help me in multiplication arr[2 * i]
    li $t3 , 4   # to access the element of the array in memory
    loop1:
        bge $t0 , $s0 , Break
        loop2:
            bge $t1 , $s1 , Break2
            mul $t4 , $t3 , $s2
            lw $t5 , myArray($t4)   # load the element in this index into $t5
            sub $t5 , $t0 , $t1
            sw $t5 , myArray($t4)
            addi $t3 , $t3 , 4
            addi $t1 , $t1 , 1
            j loop2
        Break2:
            addi $t1 , $t1 , 1
            j loop1
    Break: 
       li  $v0, 10
        syscall
