; constants ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; syscall numbers
SYS_READ = 0
SYS_WRITE = 1
SYS_OPEN = 2
SYS_CLOSE = 3
SYS_MMAP = 9
SYS_MUNMAP = 11
SYS_EXIT = 60

; open options
SYS_O_RDONLY = 0
SYS_O_WRONLY = 1
SYS_O_RDWR = 2

SYS_O_CREAT = 64

SYS_O_APPEND = 1024

; syscall macros ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Helpers to set up the right registers with the given arguments

macro syscall1 code, arg0 {
    mov rax, code
    mov rdi, arg0
    syscall
}

macro syscall2 code, arg0, arg1 {
    mov rax, code
    mov rdi, arg0
    mov rsi, arg1
    syscall
}

macro syscall3 code, arg0, arg1, arg2 {
    mov rax, code
    mov rdi, arg0
    mov rsi, arg1
    mov rdx, arg2
    syscall
}

macro syscall4 code, arg0, arg1, arg2, arg3 {
    mov rax, code
    mov rdi, arg0
    mov rsi, arg1
    mov rdx, arg2
    mov r10, arg3
    syscall
}

macro syscall5 code, arg0, arg1, arg2, arg3, arg4 {
    mov rax, code
    mov rdi, arg0
    mov rsi, arg1
    mov rdx, arg2
    mov r10, arg3
    mov r8, arg4
    syscall
}

macro syscall5 code, arg0, arg1, arg2, arg3, arg4, arg5 {
    mov rax, code
    mov rdi, arg0
    mov rsi, arg1
    mov rdx, arg2
    mov r10, arg3
    mov r8, arg4
    mov r9, arg5
    syscall
}
