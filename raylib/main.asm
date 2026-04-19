format ELF64
public _start

include 'raylib.inc'

section '.text' executable

include '../common/syntax.inc'
include '../common/syscall.inc'
include '../common/c.inc'

proc main
    sub rsp, 48 ; Font

    ccall3 InitWindow, 800, 600, window_name

    ; load the font
    lea rax, [rbp-48]
    mov rdi, rax
    mov rsi, font_path
    mov rdx, font_size
    xor rcx, rcx ; code points NULL
    mov r8, 250  ; up to 250 characters
    xor rax, rax
    call LoadFontEx

    .main_loop:
        call BeginDrawing
        ccall1 ClearBackground, 0x88888888
        ; ccall5 DrawText, window_msg, 0, 0, 12, 0xFFFFFFFF
        ; DrawTextEx begin
            ; the font is copied and passed on the stack
            sub rsp, 48
            mov rax, [rbp-8]
            mov qword [rbp-48-8], rax
            mov rax, [rbp-16]
            mov qword [rbp-48-16], rax
            mov rax, [rbp-24]
            mov qword [rbp-48-24], rax
            mov rax, [rbp-32]
            mov qword [rbp-48-32], rax
            mov rax, [rbp-40]
            mov qword [rbp-48-40], rax
            mov rax, [rbp-48]
            mov qword [rbp-48-48], rax
            mov rdi, window_msg ; text
            pxor xmm0, xmm0 ; position
            ; font size
            mov eax, font_size
            cvtsi2ss xmm1, eax
            ; font spacing
            mov eax, 1
            cvtsi2ss xmm2, eax
            mov rsi, 0xFFFFFFFF ; color
            xor rax, rax
            call DrawTextEx
            add rsp, 48
        ; DrawTextEx end
        ccall5 DrawRectangle, 400, 300, 100, 100, 0xFF0000FF
        call EndDrawing
        ; test close window
        call WindowShouldClose
        cmp rax, 0
        jz .main_loop
    .end_main_loop:

    ; we do not copy the data here because we don't use it anymore
    lea rdi, [rbp-48]
    call UnloadFont

    call CloseWindow
endproc

_start:
    xor rax, rax
    call main
    syscall1 SYS_EXIT, 0

section '.rodata'

string window_name, "Fasm Raylib", 0
string window_msg, "Hello from Raylib", 0

string font_path, "/usr/share/fonts/TTF/JetBrainsMono-Regular.ttf", 0
font_size = 20
