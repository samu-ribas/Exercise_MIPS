# 2. Escreva um programa em assembly do
# MIPS que passe 2 n�meros como par�metro
# para uma fun��ao e receba a multiplica��o
# dos 2 n�meros como resultado. Guarde o
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
	 la $a0, prompt1	# carrega endere�o de prompt1 em %a0 como argumento pra syscall
	 syscall
 