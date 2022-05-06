   .data

array: .space 200
firstmsg: .asciiz "Enter Ten Numbers"


.globl main

.text
main:

la $a0,firstmsg
li $v0,4               #priting msg
syscall



jal Sumofcubes
li $v0,10
syscall
Sumofcubes:
la $t0,array          
li $t1,0
firstloop:               
beq $t1,10,endloop
addi $t1,$t1,1          
li $v0,5
syscall
sw $v0,0($t0)
addi $t0,$t0,4
j firstloop
endloop:

la $t0,array           
li $t1,0
li $s0,0
startg:                
beq $t1,10,endg          
addi $t1,$t1,1            
lw $a0,0($t0)
mul $s1,$a0,$a0            
mul $s1,$s1,$a0           
add $s0,$s0,$s1
addi $t0,$t0,4
j startg
endg:
move $a0,$s0
li $v0,1
syscall
jr $ra
