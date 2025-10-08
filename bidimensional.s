.data
    x: .space 4
    f: .asciz "%d"
    g: .asciz "%d: ((%d, %d), (%d, %d))\n"
    v: .space 1048576
    q: .asciz "((%d, %d), (%d, %d))\n"
    indice: .space 4
    start: .space 4
    stop: .space 4
    desc: .space 4
    aux: .long 4
    zero: .long 0
    cnt: .space 4
    count: .space 4
    dim: .space 4
    stg: .long 0
    dr: .long 0
    cp: .space 4
    end: .asciz "\n"
    dimfin: .space 4
    L: .long 0
    lst: .long 0
    ldr: .long 0
    stgaux: .long 0
    draux: .long 0
    null_0: .long 0
    null_1: .long 0
    dim0: .long 0
    dimdesc: .long 0
    pozdr: .long 0
 
.text
.global main
main:
    pushl $cnt
    pushl $f
    call scanf

    pop %ebx
    pop %ebx

     
    lea v, %edi
    et_loop:

        movl cnt, %ecx
        dec %ecx
        movl %ecx, cnt
        cmp $0, %ecx
        jl et_exit
        pushl $x
        pushl $f
        call scanf

        pop %ebx
        pop %ebx  
          
        movl x, %ebx

        cmp $1, %ebx
        je et_add
        cmp $2, %ebx
        je et_get
        cmp $3, %ebx
        je et_delete
        cmp $4, %ebx
        je et_defrg
         et_add:
            pushl $count
            pushl $f
            call scanf

            pop %ebx
            pop %ebx
            movl count, %ebx
           

             movl $0, stg

            et_numere:
            movl stg, %eax
            movl %eax, stg
            mov %eax, dimfin
            cmp $0, %ebx

            je et_loop 
            
            pushl $desc
            pushl $f
            call scanf
            

            pop %esi
            pop %esi
            pushl $dim
            pushl $f
            call scanf


            pop %eax
            pop %eax 
            movl dim, %eax
            mov $9, %edx
            cmp %eax, %edx
            jg et_numere
            xor %edx, %edx
            movl $8, %ecx
            divl %ecx 
            movl $0, L
            cmp $0, %edx
            je et1
            
            
                inc %eax
                movl %eax, dim
                movl $0, stg
                jmp et_stg
                movl %eax, indice
                xor %edx, %edx
                jmp et3

                et1:
                movl %eax, dim
                movl $0, stg
                jmp et_stg
              
                et_55:
                movl stg, %edx
                movl %edx, start
                movl %edx, aux

                et3:
                cmp dr, %edx
                jg et_afis_add
                
                mov $1024, %eax
                movl L, %ebx
                mul %ebx
                addl aux, %eax
                mov aux, %edx


                movl desc, %esi
                movl %esi, (%edi, %eax, 4) 
                inc %edx
                movl %edx, aux
                jmp et3 
                
               
                 et_afis_add:
                mov %edx, stg
                dec %edx
                movl %edx, stop

                push stop
                push L
                push start
                push L
                push desc
                push $g
           
                call printf
           
                pop %eax
                pop %eax
                pop %eax
                pop %eax
                pop %eax
                pop %eax




                et_err:
                mov count, %ebx
                decl %ebx
                movl %ebx, count
                movl stg, %eax
                movl %eax, start
                jmp et_numere

                jmp et_loop


 


            et_stg:
                movl L, %ebx
                cmp $256, %ebx
                je et_null_add
                movl stg, %edx
                cmp $1023, %edx
                jg et_inc_linie

                movl $1024, %eax
                movl L, %ebx
                mul %ebx
                movl stg, %edx
                addl %edx, %eax
                movl (%edi, %eax, 4), %ebx
                cmp $0, %ebx
                je et_cautare_dr
                jmp incrementarestg




            et_cautare_dr:
                movl %edx, dr
                cmpl $1024, dr
                jge et_inc_linie
                movl $1024, %eax
                movl L, %ebx
                mul %ebx
                movl dr, %edx
                addl %edx, %eax
                movl (%edi, %eax, 4), %ebx
                cmp $0, %ebx
                jne incrementarestg
                sub stg, %edx
                addl $1, %edx
                cmp dim, %edx
                jge et_55
                mov dr, %edx
                inc %edx
                jmp et_cautare_dr


            incrementarestg:
                mov stg, %edx
                inc %edx
                movl %edx, stg
                cmp $1023, %edx
                jg et_inc_linie

                movl $1024, %eax
                movl L, %ebx
                xor %edx, %edx
                mul %ebx
                movl stg, %edx
                addl %edx, %eax
                movl (%edi, %eax, 4), %ebx
                cmp $0, %ebx
                je et_stg
                jmp incrementarestg
 
 
            et_inc_linie:
                movl L,%edx
                inc %edx
                movl %edx,L
                movl $0, stg
                movl $0, dr
                jmp et_stg

  


            et_null_add:
 
                push $0
                push $0
                push $0
                push $0

                push desc  
                push $g
                        
                call printf
                        
                pop %eax
                pop %eax
                pop %eax

                pop %eax
                pop %eax



                movl count, %ebx
                dec %ebx
                movl %ebx, count
                jmp et_numere



        et_get:
            pushl $x
            pushl $f
            call scanf

            pop %ebx
            pop %ebx
            movl $0, stg
            movl $0, L
  
        et_cautarestg_get:
            movl L, %ebx
            cmp $256, %ebx
            je et_null_get
            movl stg, %edx
            cmp $1023, %edx
            jg et_inc_l
            movl $1024, %eax
            movl L, %ebx
            mul %ebx
            mov stg, %edx
            add %edx, %eax
            movl (%edi, %eax, 4), %ebx
            cmp x, %ebx
            je et_cautaredr_get
            inc %edx

            movl %edx, stg
            jmp et_cautarestg_get

        et_cautaredr_get:
            movl %edx, dr
            movl $1024, %eax
            movl L, %ebx
            mul %ebx
            mov dr, %edx
            add %edx, %eax
            movl (%edi, %eax, 4), %ebx
            cmp x, %ebx
            jne et_afis_get
            inc %edx
            mov %edx, dr
            jmp et_cautaredr_get

        et_inc_l:
            movl L,%edx
            inc %edx 
            movl %edx,L
            movl $0, stg
            movl $0, dr
            jmp et_cautarestg_get




        et_afis_get:
            dec %edx
            movl %edx, dr
            push dr
            push L
            push stg
            push L
            push $q

            call printf

            pop %eax
            pop %eax
            pop %eax
            pop %eax
            pop %eax


            xor %ebx, %ebx
            jmp et_loop






        et_null_get:
            push $0
            push $0
            push $0
            push $0
            push $q
           
            call printf
           
            pop %eax
            pop %eax
            pop %eax
            pop %eax

            jmp et_loop


        et_delete:
            pushl $desc
            push $f

            call scanf

            pop %ebx
            pop %ebx
            movl $0, stg
            movl $0, L
            jmp et_cautarestg_delete


        et_cautarestg_delete:
            movl stg, %edx
            cmp $261888, %edx
            jg et_loop
            movl (%edi, %edx, 4), %ebx
            cmp $0,%ebx
            je et_case0
            cmp desc, %ebx
            jne et_cautaredr_delete
            movl $0, (%edi, %edx, 4)
        et_case0:
            inc %edx

            movl %edx, stg
            jmp et_cautarestg_delete


        et_cautaredr_delete:
            movl %ebx, x
            movl %edx, dr
            cmp $261888, %edx
            jg et_afis_delete
            movl (%edi, %edx, 4), %ebx
            cmp x, %ebx
            jne et_afis_delete
            inc %edx
            jmp et_cautaredr_delete




        et_afis_delete:
  

            dec %edx
            
            movl %edx, dr
            movl dr, %eax
            movl %eax, draux
            movl $1024, %ebx
            xor %edx, %edx
            div %ebx
            movl %eax, L
            movl %edx, dr
            movl stg, %eax
            movl %eax, stgaux
            div %ebx
            movl %edx, stg
 
            push dr
            push L
            push stg
            push L
            push x
            push $g

            call printf

            pop %eax
            pop %eax
            pop %eax
            pop %eax
            pop %eax
            pop %eax

            movl draux, %edx
            movl %edx, dr
            movl stgaux, %edx
            movl %edx, stg
            movl dr,%edx
            inc %edx
            movl %edx, stg
            jmp et_cautarestg_delete
 
        et_defrg:
            movl $-1, stg
        et_mutari:

            movl stg, %edx
            inc %edx
            cmp $262144, %edx
            jge et_gata
            movl %edx, stg


            movl (%edi, %edx, 4), %ebx
            cmp $0, %ebx
            jne et_mutari




        et_mov:
            inc %edx
            cmp $262144, %edx
            jge et_gata

            movl %edx, dr
            movl (%edi, %edx, 4), %ebx
            cmp $0, %ebx
            je et_mov
            movl stg, %eax
            movl %ebx, (%edi, %eax, 4)
            movl $0, (%edi, %edx, 4)
            jmp et_mutari
            



        et_gata:

            movl $0, stg
            et_afis_defrg:
            movl stg, %edx
            movl (%edi, %edx, 4), %ebx
            movl %ebx, desc
            cmp $0, %ebx
            je et_loop
            jmp et_dr

        et_dr:
            movl %edx, dr
            cmp (%edi, %edx, 4), %ebx
            jne et_afisaredefrg
            inc %edx
            jmp et_dr



        et_afisaredefrg:
            dec %edx
            
            movl %edx, dr
            movl dr, %eax
            mov %eax, draux
            movl $1024, %ebx
            xor %edx, %edx
            div %ebx
            movl %eax, L
            movl %edx, dr
            movl stg, %eax
            mov %eax, stgaux
            div %ebx
            movl %edx, stg
 
            push dr
            push L
            push stg
            push L
            push desc
            push $g

            call printf

            pop %eax
            pop %eax
            pop %eax
            pop %eax
            pop %eax
            pop %eax



            mov draux,%edx
            inc %edx
            movl %edx, stg
            jmp et_afis_defrg

et_exit:
    pushl $0
    call fflush
    popl %eax
    

    mov $1, %eax
    xor %ebx, %ebx
    int $0x80