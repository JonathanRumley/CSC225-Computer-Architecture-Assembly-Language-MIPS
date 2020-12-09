# Jonathan Rumley
# CSC 225
# September 2020
# Chapter 3 Exercise #1, CH3EX1.asm
# Create program to add three integers from input then outputting the sum

.text
main:
	# Prompt user for 1st integer
	addi $v0, $zero, 4
	la $a0, Prompta
	syscall
	addi $v0, $zero, 5
	syscall
	move $s0, $v0
	
	# Prompt user for 2nd integer
	addi $v0, $zero, 4
	la $a0, Promptb
	syscall
	addi $v0, $zero, 5
	syscall
	move $s1, $v0
	
	# Prompt user for 3nd integer
	addi $v0, $zero, 4
	la $a0, Promptc
	syscall
	addi $v0, $zero, 5
	syscall
	move $s2, $v0
	
	# Add the three integers
	add $s3,$s1,$s0
	add $s4,$s3,$s2
	
	# Print the result
	addi $v0, $zero, 4
	la $a0, resultSum
	syscall
	addi $v0, $zero, 1
	move $a0, $s4
	syscall
	
	# End
	addi $v0, $zero, 10
	syscall

.data
Prompta: .asciiz "Please enter an integer: "
Promptb: .asciiz "\nThank you, now, please enter another integer to add to the first integer: "
Promptc: .asciiz "\nAnd finally, please enter a third intger to be added to the previous two integers: "
resultSum: .asciiz "\nHere is the sum of the three integers entered: "
