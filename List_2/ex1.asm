# 1. Escreva um porgrama em Assembly do
# MIPS, usando pelo menos 2 fun��es, capaz
# de somar e subtrair o valor em $t0 do valor
# em $t1. A soma precisa estar em $t2 e a
# subtra��o precisa estar em $t3.


	.data 
prompt1: .asciiz "Digite o valor para $t0: "
prompt2: .asciiz "\nDigite o valor  de $t1: "
resSum:  .asciiz "\nSoma ($t1 + $t0) em $t2 = "
resSub:  .asciiz "\nSubtracao ($t1 - $t0) em $t3 = "
newline: .asciiz "\n"

.text			# come�a a sess�o execut�vel


main:
	li $v0, 4			#print string
        la $a0,  prompt1		# carrega o endere�o da string prompt1 em $a0 (par�metro para syscall)
        syscall 			# executa syscall - imprime prompt1
        
        li $v0, 5			# syscall 5 = read_int (prepara leitura para um inteiro)
	syscall				# l� um inteiro do teclado para $v0
	move $t0, $v0			# move o inteiro lido ($v0) para $t1
	
	# agora faz a mesma coisa para o segundo valor
	li $v0, 4		
        la $a0,  prompt2	
        syscall 		
        
        li $v0, 5		
	syscall	
	move $t1, $v0

        # Chama fun��o que calcula soma
        jal add_func

        # Chama fun��o que calcula subtra��o
        jal sub_func

        # - Imprime valores para verificar
        # Resultado da soma
        li $v0, 4
        la $a0, resSum
        syscall
        move $a0, $t2			# move o valor da soma ($t2) para $a0 (argumento para print_int)
        li $v0, 1
        syscall				# executa a syscall � imprime o inteiro em $a0 (o valor de $t2)
	
	# Resultado da Sub
        li $v0, 4
        la $a0, resSub
        syscall
        move $a0, $t3			# move 
        li $v0, 1
        syscall

        # newline e fim
        li $v0, 4			# syscall 4 = print string
        la $a0, newline
        syscall

        li $v0, 10         		# exit (syscall 10 = t�rmino da fun��o)
        syscall

add_func:
        add $t2, $t1, $t0
        jr $ra				# retorna para o endere�o salvo em $ra (fim da fun��o)

sub_func:
        sub $t3, $t1, $t0
        jr $ra				# retorna para o endere�o salvo em $ra (fim da fun��o)

	
			
