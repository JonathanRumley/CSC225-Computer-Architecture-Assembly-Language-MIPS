# Jonathan Rumley
# CSC 225
# November 30th, 2020
# Extra Credit Project, ECProjectINT.asm

# Write an Assembler program to perform the task of temperature conversion from Celsius to Fahrenheit
# Note that given C as the degree of temperature in Celsius, the corresponding degree F in Fahrenheit equals 1.8*C + 32.0
# For example, 50 degrees Celsius should be 122 degree Fahrenheit

.data
celsiusPrompt: .asciiz "Greetings Earthling, please enter a temperature in Celsius to get the Fahrenheit conversion: "
fahrenheitEnding: .asciiz  "Here is your Fahrenheit temperature: "
# addition32: .float 32.0
# multiply9: .float 9.0
# divide5: .float 5.0

.text
main:
        la $a0, celsiusPrompt	# Load Celsius Prompt
        jal PromptInt		# Prompt Celsius Input

        jal ConvertINTCtoF	# Celsius to Fahrenheit Conversion

        la $a0,fahrenheitEnding # Load Fahrenheit Prompt
        li $v0,4
        syscall

        move $a0,$t0		# Move F temp from $t0 to $a0
        li $v0,1
        syscall

    	jal PrintNewLine 	# Print on new line
	jal Exit		# Exit the program
		
.include "CH5utils.asm"