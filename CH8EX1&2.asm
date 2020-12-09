# Jonathan Rumley
# CSC 225
# November 22nd, 2020
# Chapter  Exercise #, CH8EX1&2.asm
#
# 1. Why do you subtract from the stack pointer when putting an item on the stack?
# 	- You would subtract from the stack pointer when putting an item on the stack to allocate more memory for future variables from subprograms, so as all subprograms
#	prior to the subprogram being called have already saved space on the $sp for their variables therefore subtracting from the $sp would allocate memory for future
#	subprogram variables. For exmaple, substracting from the stack to save space on the stack when pushing data like the $ra to the stack.
#
# 2. Write a subprogram called square that will return the square of a single integer argument. 
# (For now, you can assume that the result can be represented as a 32 bit number.) 
# Write a second function called sum_of_squares that will accept three integer arguments and return the sum of the square of each value. 
# For example, 22 + 32 + 42 would be 4 + 9 + 16 = 29. 
# The sum_of_squares subprogram should use the square subprogram.
#
.data
number: .asciiz "Square A Number - Please enter a number to calculate the sqaure power: "
squareNum: .asciiz "Here is your number sqaured: "
threeNumber: .asciiz "Please enter three numbers to calculate their sum-of-squares: \n"
number1: .asciiz "\nSum of Squares - Enter three numbers to add their squares together \nPlease enter your first number: "
number2: .asciiz "Please enter your second number: "
number3: .asciiz "Please enter your third number: "
sumSquares: .asciiz "\nHere is your Sum of Squares result: "

.text
main:
	la $a0, number 		# Load prompt into $a0 for PromptInt
	jal PromptInt 		# Prompt integer from $a0
	move $s0, $v0		
	move $t0, $v0		
	jal Square		# Jump & Link to Square procedure

	la $a0, squareNum	# Load prompt into $a0 for squareNum
	jal PrintString		# Print prompt from $a0
	
	li $v0, 1		# Load squareNum integer from Square procedure resutls
	move $a0, $s1		# Move sqaureNum from saved reg to $a0 for SumSquare
	syscall
	
	jal SumSquare		# Jump & Link to SumSquare procedure
	
Square:
	blez $t0, Return	# Branch less than or equal to then jump to return address
	add $s1, $s1, $s0
	addi $t0, $t0, -1
	j Square
	
Return:
	jr $ra
	
SumSquare:
	la $a0, number1		# Load prompt into $a0 
	jal PrintString
	jal ReadInt
				# Store number 1 in $s0 and $t0 in preparation for square function
	move $s0, $v0
	move $t0, $v0
	li $s1, 0
	jal Square
	move $s2, $s1 		# Move squared number 1 to store in $s2
				# Read entered number 2
	la $a0, number2		# Load prompt for second number
	jal PrintString		# Print prompt for second number
	jal ReadInt		# Read integer number2
				
	move $s0, $v0
	move $t0, $v0
	li $s1, 0
	jal Square
	move $s3, $s1 		# Move squared number 2 to store in $s3
 
	la $a0, number3		# Load prompt for third number
	jal PrintString		# Print prompt for third number
	jal ReadInt		# Read integer number3 
					
	move $s0, $v0		
	move $t0, $v0			
	li $s1, 0		
	jal Square		# Jump & Link to Square procedure
	move $s4, $s1 		# Move squared number3 to store in $s4

	add $s2, $s2, $s3	# Add the 3 squared numbers
	add $s2, $s2, $s4
	
	la $a0, sumSquares	# Load prompt sumSquares into $a0
	jal PrintString		# Print prompt sumSqaures
	
	li $v0, 1		# Print result of sum of sqaures calculation
	move $a0, $s2		# Move result from the saved register
	syscall
	
	
	jal Exit		# Exit program
	
.include "CH5utils.asm"


