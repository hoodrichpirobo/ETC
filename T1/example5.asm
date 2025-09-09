# He hecho que al traversar los elementos, si uno de ellos es <0,
# se escribe un 0, sino se traversa el elemento tal cual

          .data 0x10001000
V1:       .word 3, -9, 2, 7

          .data 0x10002000
V2:       .space 16

          .data 0x10004000
DIM:      .word 4

          .globl __start
          .text 0x00400000
__start:  la $s0, V1          # Puntero a V1[0]
          la $s1, V2          # Puntero a V2[0]
          la $s2, DIM         # Puntero a dimensión del vector
          lw $t1, 0($s2)      # Lee dimensión del vector
bucle:    lw $t0, 0($s0)      # Lee V1[i]
          bltz $t0, es_neg    # Si $t0 < 0 -> salta al bloque es_neg
          sw $t0, 0($s1)      # Escribe en V2[i] tal cual sino
          j fin_iter          

es_neg:   sw $zero, 0($s1)    # Caso < 0: escribir 0 en V2[i]
            
fin_iter: addi $t1, $t1, -1   # Decrementa contador
          addiu $s0, $s0, 4   # Actualiza puntero a V1[i+1]
          addiu $s1, $s1, 4   # Actualiza puntero a V2[i+1]
          bgtz $t1, bucle
