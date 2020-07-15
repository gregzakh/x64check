; +0x260 KUSER_SHARED_DATA.NativeProcessorArchitecture
; type: unsigned short
; mean: the processor architecture of the installed
;       operating system (if equals 9 then x64)
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
    mov    edx, 0x09
    mov    ecx, negative
    cmp    dx, word [0x7FFE026A]
    mov    eax, positive
    push   0x40
    push   caption
    cmovne eax, ecx
    push   eax
    push   0x00
    call   _MessageBoxA@16
    xor    eax, eax
    call   _ExitProcess@4
