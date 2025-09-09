# 1. Escreva um porgrama em Assembly do
# MIPS, usando pelo menos 2 funções, capaz
# de somar e subtrair o valor em $t0 do valor
# em $t1. A soma precisa estar em $t2 e a
# subtração precisa estar em $t3.


	.data
	prompt1: .asciiz "Valor em $t0 = "
	prompt2: .asciiz "\nValor em $t1 = "
	resSum:  .asciiz "\nSoma ($t1 + $t0) em $t2 = "
	resSub:  .asciiz "\nSubtracao ($t1 - $t0) em $t3 = "
	newline: .asciiz "\n"

 .text
 .globl main

main:
        #  Inicializa exemplos
        li $t0, 7          # exemplo: $t0 = 7
        li $t1, 20         # exemplo: $t1 = 20

        # Chama função que calcula soma
        jal add_func

        # Chama função que calcula subtração
        jal sub_func

        # - Imprime valores para verificar
        # imprime $t0
        li $v0, 4
        la $a0, prompt1
        syscall
        move $a0, $t0
        li $v0, 1
        syscall

        # imprime $t1
        li $v0, 4
        la $a0, prompt2
        syscall
        move $a0, $t1
        li $v0, 1
        syscall

        # imprime soma ($t2)
        li $v0, 4
        la $a0, resSum
        syscall
        move $a0, $t2
        li $v0, 1
        syscall

        # imprime subtracao ($t3)
        li $v0, 4
        la $a0, resSub
        syscall
        move $a0, $t3
        li $v0, 1
        syscall

        # newline e fim
        li $v0, 4
        la $a0, newline
        syscall

        li $v0, 10         # exit
        syscall


# add_func: calcula $t2 = $t1 + $t0
# Uso: assume valores em $t0 e $t1 já definidos; retorna com $t2 preenchido

add_func:
        add $t2, $t1, $t0
        jr $ra

# sub_func: calcula $t3 = $t1 - $t0
# Uso: assume valores em $t0 e $t1 já definidos; retorna com $t3 preenchido

sub_func:
        sub $t3, $t1, $t0
        jr $ra

	
			
