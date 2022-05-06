   .data

  msg1: .asciiz "number is positive"
  msg2: .asciiz "number is negative"

  msg0: .asciiz "Enter  Number"

.globl main

.text
main:

la $a0,msg0
li $v0,4
syscall

li $v0,5                  #getting values msg
syscall

jal iSPositive
li $v0,10
syscall

iSPositive:
bge $v0,0,positive             
la $a0,msg2
 li $v0,4                  #priting msg
 syscall
li $v0,10
syscall

positive :
la $a0,msg1               #priting msg
li $v0,4
syscall
jr $ra