# Jonathan Rumley
# CSC 225
# October 27th, 2020
# Chapter 7 Exercise #2, CH7EX2&4.asm
#
# Translate the following Python code into assembly:
# number = int(input('Guess a number from 1-10: '))
# if number < 7:
# print('Too low.')
# elif number > 7:
# print('Too high.')
# else:
# print('You guessed it!')
#
.data
guess: .asciiz "Guess a number ranging from 1 to 10: "
tooLow: .asciiz "Hmm, your guess is too low."
tooHigh: .asciiz "Hmm, your guess is too high."
spotOn: .asciiz "You guessed it!!"
invalid: .asciiz "Invalid entry, please enter your guess in between 1 and 10."

.text
main:

	la $a0, guess	# load prompt into $a0
	jal PromptInt	# prompt user for guess
	
	slti $t1, $v0, 1 # set check if number is less than 1
	sgt $t2, $v0, 10 # set check if number is greater than 10
	or $t1, $t1, $t2 # set check or bitwise for 1 or 10
	beqz $t1, if	 # check if number is less than 7
	
	la $a0, invalid  # load prompt into $a0
	jal PrintString  # print invalid
	b end		 # branch to end block
if:
	slti $t1, $v0, 7# set check less than 7
	beqz $t1, elif  # branch to elif if less than 7
	la $a0, tooLow 	# load prompt into $a0
	jal PrintString # print tooLow
	b end 		# branch to end block
elif:
	sgt $t1, $v0, 7 # set check greater than 7
	beqz $t1, else  # branch to correct if not
	la $a0, tooHigh # load prompt into $a0
	jal PrintString # print tooHigh
	b end 		# branch to end block
else:
	la $a0, spotOn 	# load prompt into $a0
	jal PrintString # print spotOn
	b end 		# branch to end block
end:
	jal Exit

.include "CH5utils.asm"
#
# 4. The branch insturction is conditional and the jump insturction is unconditional, branch instructions deal with label direct access,
# and the jump instructions deal with jump addresses. The jump instructions load values right into the $pc register whereas the branch instructions
# seem to lead up to the address of the $pc as the jump depends on the contional code linked with the branch instructions.
