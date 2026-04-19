format ELF64
public _start

include 'raylib.inc'

section '.text' executable

include '../common/syntax.inc'
include '../common/syscall.inc'

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
        mov rdi, window_msg
        mov rsi, 0
        mov rdx, 0
        mov r10, 12
        mov r8, 0xFFFFFFFF
        call DrawText
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
