.data
numeros: .word 4,3,9,5,2,1
quantidade: .word 6
espaco: .asciiz " "
mensagem: .asciiz "Números em ordem: "
nova_linha: .asciiz "\n"

.text
.globl main
main:
    la $t0, numeros
    lw $t1, quantidade

    li $t2, 0
inicio_fora:
    li $t3, 0
inicio_dentro:
    lw $t4, 0($t0)
    lw $t5, 4($t0)
    sub $t6, $t4, $t5
    blez $t6, pular
    sw $t5, 0($t0)
    sw $t4, 4($t0)
pular:
    addi $t0, $t0, 4
    addi $t3, $t3, 1
    li $t7, 5
    blt $t3, $t7, inicio_dentro
    la $t0, numeros
    addi $t2, $t2, 1
    li $t7, 5
    blt $t2, $t7, inicio_fora

    la $a0, mensagem
    li $v0, 4
    syscall

    la $t0, numeros
    li $t1, 6
imprimir:
    lw $a0, 0($t0)
    li $v0, 1
    syscall
    la $a0, espaco
    li $v0, 4
    syscall
    addi $t0, $t0, 4
    addi $t1, $t1, -1
    bgtz $t1, imprimir

    la $a0, nova_linha
    li $v0, 4
    syscall

    li $v0, 10
    syscall
