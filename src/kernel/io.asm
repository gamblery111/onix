[bits 32]

section .text ; 代码段

global inb ; 将 inb 导出
inb:
    push ebp
    mov ebp, esp ;保存栈帧

    xor eax, eax 
    mov edx, [ebp + 8] ; port
    in al, dx; 将端口号 dx 的 8bit 输入到 ax

    jmp $+2 ;一点点延迟
    jmp $+2 ;一点点延迟
    jmp $+2 ;一点点延迟

    leave   ;回复栈帧
    ret

global outb 
outb:
    push ebp
    mov ebp, esp ;保存栈帧

    mov edx, [ebp + 8] ; port
    mov eax, [ebp + 12] ; value
    out dx, al ;将 al 中的 8bit 输出到 dx

    jmp $+2 ;一点点延迟
    jmp $+2 ;一点点延迟
    jmp $+2 ;一点点延迟

    leave   ;回复栈帧
    ret

global inw
inw:
    push ebp
    mov ebp, esp ;保存栈帧

    xor eax, eax 
    mov edx, [ebp + 8] ; port
    in ax, dx; 将端口号 dx 的 8bit 输入到 ax

    jmp $+2 ;一点点延迟
    jmp $+2 ;一点点延迟
    jmp $+2 ;一点点延迟

    leave   ;回复栈帧
    ret

global outw 
outw:
    push ebp
    mov ebp, esp ;保存栈帧

    xor eax, eax 
    mov edx, [ebp + 8] ; port
    mov eax, [ebp + 12] ; value
    out dx, ax ;将 al 中的 8bit 输出到 dx

    jmp $+2 ;一点点延迟
    jmp $+2 ;一点点延迟
    jmp $+2 ;一点点延迟

    leave   ;回复栈帧
    ret