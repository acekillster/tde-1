.data
ano_do_aluno: .word 2000
ano_extra: .word 2005
mensagem: .asciiz "Soma dos anos: "

.text
.globl comecar
comecar:
    lw $t0, ano_do_aluno
    lw $t1, ano_extra
    add $t2, $t0, $t1

    la $a0, mensagem
    li $v0, 4
    syscall

    move $a0, $t2
    li $v0, 1
    syscall

    ir_sair:
    li $v0, 10
    syscall
