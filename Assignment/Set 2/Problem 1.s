
.data 
	Hmessage: .asciiz  "Enter Your number H :"
	Gmessage: .asciiz "\nEnter your number G "
	message1: .ascii "\n you in else \n h = "
.text 
	 main:

		 #Print message to enter value h 
			 li		$v0 , 4
			 la		$a0 , Hmessage
			 syscall
		 #Take user input
			 li		$v0 , 5
			 syscall
		 #Store h in t0 register
			 move	$t0 , $v0
		 #Print message to enter value g
			 li		$v0 , 4
			 la		$a0 , Gmessage
			 syscall
		 #Take user input
			 li		$v0 , 5
			 syscall
		 #Store g in t1 register
		 move		$t1 , $v0
 
		 #eqiuvlant to if ((g <= h) && (g > 0))
		 #if !(g<= h)
		 bgt		$t1 , $t0 , else
		 #if !(g>0)
		 blez		$t1 , else
		 #g = h;
		 move		$t1,$t0
		 #print g value
		 li			$v0 , 1
		 move		$a0 , $t1
		 syscall 
		 #end program
		 li $v0,10
		 syscall 

		 else:
		 #h=g
		 move $t0 , $t1
		 #print massege we are in else
		 li $v0 , 4
		 la $a0 , message1
		 syscall
		 #print value of h 
		 li $v0 , 1
		 move $a0 , $t0
		 syscall 
	 jr $ra