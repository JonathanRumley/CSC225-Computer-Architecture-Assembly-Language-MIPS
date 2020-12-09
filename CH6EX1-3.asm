# Jonathan Rumley
# CSC 225
# October 21st, 2020
# Chapter 6 Exercise #1-3, CH6EX1-3.asm
#
.data
	a: .word 0
	b: .word 10
   	   .space 24
	c: .word 20

.text
# 1. The addressess of the data at labels a, b, and c are....
	
	# a - 0x10010000
	# b - 0x10010004
	# c - 0x10010020

# 2. For each of the labels above, the data could be accessed by label access, register indirect access, and by register offset access....how?
# 	label access - lw into temporary registers, specifically, 
		
		lw $t5, a
		lw $t6, b
		lw $t7, c
		
# 	register indirect access - Load address of data segment into register then add delta to register for desired memory lcoation
		
		lui $t0, 0x1001
		lw $t5, 0($t0)
		addi $t0, $t0, 4
		lw $t6, 0($t0)
		addi $t0, $t0, 28
		lw $t7, 0($t0)
		
# 	register offset access - Load addresss of data segement into register then use offfset to access data (don't keep adding to register)
		
		lui $t0, 0x1001
		lw $t5, 0($t0)
		lw $t6, 4($t0)
		lw $t7, 32($t0)

# 3. Write instruction that will load the value 30 into the data at label c

		addi $t7, $zero, 30
		jal Exit

.include "Ch5utils.asm"

