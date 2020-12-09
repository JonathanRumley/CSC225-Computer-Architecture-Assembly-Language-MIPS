# Jonathan Rumley
# CSC 225
# November 30th, 2020
# Chapter 9 Exercise 1, CH9EX1.asm
#
#
.data
array: 		.space 40
enterNums: 	.asciiz "Hello there, please enter ten numbers of your choice:\n"
printArray: 	.asciiz "And here is your array: "
	
.text
main:
	la $t0, array 		# Load Arrays
	la $t1, array 
	la $a0, enterNums 	# Load Prompt
	jal PrintString		# Print Prompt
loop: 
	li $v0, 5		# Load Numbers
	syscall
	move $t3, $v0		# Move Numbers to $t3
	sw $t3, 0($t0)		# Save Contents Into $t3
	add $s1, $s1, 1		# Continuing The Loop
	beq $s1, 10, startArray	# Saving 10 Numbers In Array
	add $t0, $t0, 4		# Save Room For Next Number
	j loop
startArray:
	# Print the message and then move $t1 starting array address to $t0 
	li $v0, 4
	la $a0, printArray	# Print Array
	jal PrintString
	move $t0, $t1
	jal exitLoop
	
exitLoop:
	beq $s2, 10, Exit 	# Loop 10 Times & Exit
	lw $t3, 0($t0)
	move $a0, $t3
	li $v0, 1
	syscall
	add $s2, $s2, 1		# Continuing the Loop
	add $t0, $t0, 4		# Save Room For The Next Number
	j exitLoop
	
.include "CH5utils.asm"
