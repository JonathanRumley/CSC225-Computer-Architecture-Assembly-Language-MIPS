# Jonathan Rumley
# CSC 225
# September 2020
# Chapter 3 Exercise #3, CH3EX3.asm
# Pseudocode from Java for city to city program
#
#
# import java.util.Scanner;
#
#  public class ExUnit3_3 
#  {
#	public static void main(String[] args)
#	{
#		String city1;
#		String city2;
#		Scanner input = new Scanner(System.in);
#		System.out.println("Please enter the distance between the two cities in miles: ");
#		double distance = input.nextDouble();
#		System.out.println("Please enter the average speed of the car in miles per hour: ");
#		double averageSpeed = input.nextDouble();
#		double hours = (int)(distance/averageSpeed);
#		double minutes = (int)((distance/averageSpeed)*60)%60;
#		System.out.println("According to the distance entered with the calculated average car speed,\nit would take " + hours + minutes + ", to arrive from city 1 to city 2.");
#	}
#  }
.data
	
	userInput: .asciiz "Please enter the distance between the two cities in miles: "
	userInput2: .asciiz "Please enter the average speed of the car in miles per hour: "
	totalHours: .asciiz "Hours: "
	totalMinutes: .asciiz "\nMinutes: "
.text
main:
# Asking the user to input the distance from city to city in miles
	addi $v0, $zero, 4
	la $a0, userInput
	syscall
	
	addi $v0, $zero, 5
	syscall
	move $t0, $v0
	
# Asking the user to input the average speed of the car traveling from city to city in miles per hour	
	addi $v0, $zero, 4
	la $a0, userInput2
	syscall
	
	addi $v0, $zero, 5
	syscall
	move $t1, $v0	

# Divide userInput(distance in Miles) by userInput2(average car speed in Miles Per Hour) to display hours and minutes	
	div $t0, $t1
	addi $v0, $zero, 4
	la  $a0, totalHours
	syscall
	li $v0, 1
	mflo $a0
	syscall
	
	li $v0, 4
	la $a0, totalMinutes
	syscall
	li $v0, 1
	mfhi $a0
	addi $v0, $zero, 1
	syscall
	
# Exit the program
	addi $v0, $zero, 10
	syscall
