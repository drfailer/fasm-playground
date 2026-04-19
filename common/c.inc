; ccalll macros ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; int/ptr args: rdi, rsi, rdx, rcx, r8,  r9
; float args: xmm0, xmm1, xmm2, xmm3, xmm4, xmm5, xmm6, xmm7

macro ccall1 function_name, arg0 {
    xor rax, rax
    mov rdi, arg0
    call function_name
}

macro ccall2 function_name, arg0, arg1 {
    xor rax, rax
    mov rdi, arg0
    mov rsi, arg1
    call function_name
}

macro ccall3 function_name, arg0, arg1, arg2 {
    xor rax, rax
    mov rdi, arg0
    mov rsi, arg1
    mov rdx, arg2
    call function_name
}

macro ccall4 function_name, arg0, arg1, arg2, arg3 {
    xor rax, rax
    mov rdi, arg0
    mov rsi, arg1
    mov rdx, arg2
    mov r10, arg3
    call function_name
}

macro ccall5 function_name, arg0, arg1, arg2, arg3, arg4 {
    xor rax, rax
    mov rdi, arg0
    mov rsi, arg1
    mov rdx, arg2
    mov rcx, arg3
    mov r8, arg4
    call function_name
}

macro ccall6 function_name, arg0, arg1, arg2, arg3, arg4, arg5 {
    xor rax, rax
    mov rdi, arg0
    mov rsi, arg1
    mov rdx, arg2
    mov rcx, arg3
    mov r8, arg4
    mov r9, arg5
    call function_name
}
