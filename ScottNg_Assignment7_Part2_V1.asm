#Scott Ng
#CPSC 440-04
#Assignment 7_Part2_Code
#Due Date: 03/14/18

.data	
	chooseU: .asciiz "Choose a value for U: "
	chooseV: .asciiz "Choose a value for V: "

.text
main:
	li $v0, 4                    #display string
	la $a0, chooseU              #load address of chooseU
	syscall

	li $v0, 5                    #command to prompt user to enter integer
	syscall

	move $a1, $v0                #moves 'u' into argument 1

	li $v0, 4                    #repeat for 'v'
	la $a0, chooseV
	syscall
	
	li $v0, 5                    #command to prompt user to enter integer
	syscall

	move $a2, $v0
		
	jal func                     #calling subroutine, utilizing 'u' and 'v'
	
	li $v0, 1                    #print integer
	addi $a0, $v1, 0             #loading value for print into $a0
	syscall                      #executes $v0, 1
	
	li $v0, 10                   #exit statement
	syscall

func:
	#5u2 - 12uv + 6v2
	#$a1 = U
	#$a2 = V
	
	mult $a1, $a1                #u^2
	mflo $t0                     #moving product back into $t0 from $LO
	addi $t5, $zero, 5           #using $t5 as a temporary holder for immediate values
	mult $t0, $t5                #5u^2
	mflo $t0                                           

	mult $a2, $a2                #v^2
	mflo $t2
	addi $t5, $zero, 6                  
	mult $t2, $t5                #6v^2
	mflo $t2

	mult $a1, $a2                #u*v	
	mflo $t1
	addi $t5, $zero, 12
	mult $t1, $t5                #12u*v
	mflo $t1

	sub $t3, $t0, $t1            #5u^2 - 12uv
	add $v1, $t3, $t2            #5u^2 - 12uv + 6v^2

	jr $ra
