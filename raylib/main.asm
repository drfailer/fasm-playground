format ELF64
public _start

include 'raylib.inc'

section '.text' executable

include '../common/syntax.inc'
include '../common/syscall.inc'
include '../common/c.inc'

proc main
    mov rdi, 800
    mov rsi, 600
    mov rdx, window_name
    call InitWindow ; args
    .main_loop:
        call BeginDrawing
        ; clear barckground to black
        xor rdi, rdi ; color black ; TODO: make_color
        call ClearBackground
        ; draw message on screen
        ccall5 DrawText, window_msg, 0, 0, 12, 0xFFFFFFFF
        ccall5 DrawRectangle, 400, 300, 100, 100, 0xFF0000FF
        call EndDrawing
        ; test close window
        call WindowShouldClose
        cmp rax, 0
        jnz .end_main_loop
        ; loop
        jmp .main_loop
    .end_main_loop:
    call CloseWindow
endproc

_start:
    xor rax, rax
    call main
    syscall1 SYS_EXIT, 0

section '.rodata'

string window_name, "Fasm Raylib", 0
string window_msg, "Hello from Raylib", 0
