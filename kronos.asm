; Way style of Kronos
; See https://blog.malwarebytes.com/cybercrime/2017/08/inside-kronos-malware/
; for the details
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
    push   ecx
    mov    dword [esp], 0x00
    xor    eax, eax
    mov    ax, cs
    shr    eax, 5
    mov    dword [esp], eax
    cmp    dword [esp], 0
    mov    ecx, negative
    push   0x40
    push   caption
    mov    eax, positive
    cmovbe eax, ecx
    push   eax
    push   0x00
    call   _MessageBoxA@16
    xor    eax, eax
    pop    ecx
    call   _ExitProcess@4
