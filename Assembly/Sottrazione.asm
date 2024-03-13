
section .data
msg db "sottrazione: " 
ok db "Papagni Gabriele----> "
len equ $ - msg  
lun equ $ - ok

section .bss
sas resb 1

section .text
global _start

_start:
mov	eax, '5'
sub	eax, '0'
mov	ebx, '4'
sub	ebx, '0'

sub	eax, ebx
add	eax, '0'
mov	[sas], eax

mov	ecx, msg
mov	edx, len
mov	ebx,1
mov	eax, 4
int	80h

mov	ecx, sas
mov	edx, 1
mov	ebx, 1
mov	eax, 4
int	80h

mov esi, ok
mov	edx, lun
mov	ebx, 1
mov	eax, 2
int	80h


mov	eax, 1
mov	ebx, 0
int	80h