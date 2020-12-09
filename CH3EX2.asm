# Jonathan Rumley
# CSC 225
# September 2020
# Chapter 3 Exercise #2, CH3EX2.asm
# Create program to input a name followed with a greeting

.data
	prompt1: .asciiz "Greetings earthling, please enter what one must identify you by: "
	output: .asciiz "\nHello, "
	name: 	.space 41
	nameSize: .word 40 
.text
main:
	# Print the prompt to user
	li $v0, 4
	la $a0, prompt1
	syscall
	
	# Take the input from user
	li $v0, 8
	la $a0, name
	lw $a1, nameSize
	syscall
	
	# Print the output with user entered name
	li $v0, 4
	la $a0, output
	syscall
	
	# 
	li $v0, 4
	la $a0, name
	syscall
	
	# End
	li $v0, 10
	syscall
