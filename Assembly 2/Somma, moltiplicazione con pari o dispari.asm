section .data
msg db "somma: " 
len equ $ - msg  
ok db "moltiplicazione: "
lun equ $ - ok

new_line db 0xA
len_nl equ $ - new_line

dis_msg db ". Il numero è dispari.", 0xA
len_dis_msg equ $ - dis_msg

par_msg db ". Il numero è pari.", 0xA
len_par_msg equ $ - par_msg

section .bss
sum resb 1
mol resb 1

section .text
global _start

_start:
mov	eax, '3'
sub eax, '0'
mov	ebx, '4'
sub ebx, '0'

add	eax, ebx
add	eax, '0'
mov	[sum], eax


mov	al, '1'
sub al, '0'
mov	bl, '4'
sub bl, '0'

mul bl;
add al, '0'
mov [mol], al


mov	ecx, msg
mov	edx, len
mov	ebx, 1
mov	eax, 4
int	80h

mov	ecx, sum
mov	edx, 1
mov	ebx, 1
mov	eax, 4
int	80h

mov eax, 4
mov ebx, 1
mov ecx, new_line
mov edx, len_nl
int 80h

mov ecx, ok
mov	edx, lun
mov	ebx, 1
mov	eax, 4
int	80h

mov	ecx, mol
mov	edx, 1
mov	ebx, 1
mov	eax, 4
int	80h

mov eax, [mol]
sub eax, 0	
and eax, 1
jz par
jnz dis

par:
mov eax, 4
mov ebx, 1
mov ecx, par_msg
mov edx, len_par_msg
int 80h
jmp fine
	
dis:
mov eax, 4
mov ebx, 1
mov ecx, dis_msg
mov edx, len_dis_msg
int 80h
jmp fine
	
fine:
mov eax, 1
mov ebx, 0
int 80h