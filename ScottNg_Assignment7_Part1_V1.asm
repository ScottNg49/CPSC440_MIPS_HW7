#Scott Ng
#CPSC 440-04
#Assignment 7_Part1_Code
#Due Date: 03/14/18

.data	

.text
main:
	addi $a1, $zero, 5           #var 1 
	addi $a2, $zero, 6           #var 2
	addi $a3, $zero, 7           #var 3
		
	jal multNumbers              #calling subroutine
		
	li $v0, 1                    #print integer
	addi $a0, $v1, 0             #loading value for print into $a0
	syscall                      #executes $v0, 1
	
	li $v0, 10                           #exit statement
	syscall

multNumbers:
	mult $a1, $a2                #multiplies var 1 by var 2
	mflo $v1                     #moves product into $v1
	mult $v1, $a3                #multiples product by var 3
	mflo $v1                     #moves product into $v1, integer return value

	jr $ra
