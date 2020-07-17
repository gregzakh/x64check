; based on piece of kernelbase.dll code
;
global main
extern _MessageBoxA@16
extern _ExitProcess@4

section .data
caption:
    db 'System bitness', 0
positive:
    db 'x64', 0
negative:
    db 'x86', 0

section .text
main:
    push  ecx
    mov   dword [esp], 0
    xor   eax, eax
    mov   eax, dword [fs:0xC0] ; TEB->WOW32Reserved
    mov   dword [esp], eax
    cmp   dword [esp], 0
    mov   ecx, negative
    push  0x40
    push  caption
    mov   eax, positive
    cmove eax, ecx
    push  eax
    push  0
    call  _MessageBoxA@16
    xor   eax, eax
    pop   ecx
    call  _ExitProcess@4
