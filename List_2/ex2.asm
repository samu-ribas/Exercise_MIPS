# 2. Escreva um programa em assembly do
# MIPS que passe 2 números como parâmetro
# para uma funçãao e receba a multiplicação
# dos 2 números como resultado. Guarde o
# resultado em $s1.

.data
	prompt1: .asciiz "\nDigite o primeiro valor: "
	prompt2: .asciiz "\nDigite o segundo valor: "
	prompt3: .asciiz "\nResultado: "
	prompt4: .ascii "\n"
	
.text
	.globl main:

main:	
	 li $v0, 4		# le 4 em $v0 para syscall printar string
	 la $a0, prompt1	# carrega endereço de prompt1 em %a0 como argumento pra syscall
	 syscall
	 
	 li $v0, 5		# le 5 em $v0 para syscall ler um inteiro
	 syscall		
	 move $v0, $t0		# move o inteiro lido de $v0 para $t0
	 
	 
	 li $v0, 4
	 la $a0, prompt2
	 syscall
	 
	 li $v0, 5
	 syscall 
	 move $v0, $t1
	 
funcZero
	bne $t0, $zero, 
