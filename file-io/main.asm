format ELF64 executable
entry _start

segment readable executable

include 'syntax.inc'
include 'syscall.inc'

; TODO: write number

; TODO: mmap

; write `msg` 10 times to `filepath`
proc write_msg_to_file
    mov rsi, SYS_O_RDWR
    or rsi, SYS_O_CREAT
    syscall3 SYS_OPEN, filepath, rsi, 644o
    cmp rax, 0
    jge .write_file
    syscall3 SYS_WRITE, 1, open_file_error, open_file_error_len
    syscall1 SYS_EXIT, 1

    .write_file:
    push rax
    for write_loop, r15, 0, 10
        syscall3 SYS_WRITE, [rsp], msg, msg_len
    endfor write_loop, r15

    syscall1 SYS_CLOSE, [rsp]
    cmp rax, 0
    jge .exit
    syscall3 SYS_WRITE, 1, close_file_error, close_file_error_len

    .exit:
endproc

; open and read the content of `filepath` to stdout
proc print_file_content
    syscall3 SYS_WRITE, 1, print_file_msg, print_file_msg_len

    syscall3 SYS_OPEN, filepath, SYS_O_RDONLY, 0
    push rax
    cmp rax, 0
    jg .read_content
    syscall3 SYS_WRITE, 1, open_file_error, open_file_error_len
    syscall1 SYS_EXIT, 1

    .read_content:
    syscall3 SYS_READ, [rsp], print_file_buffer, print_file_buffer_len
    mov r15, rax
    syscall3 SYS_WRITE, 1, print_file_buffer, r15
    cmp rax, 0
    jg .read_content

    syscall1 SYS_CLOSE, [rsp]
    cmp rax, 0
    jge .exit
    syscall3 SYS_WRITE, 1, close_file_error, close_file_error_len

    .exit:
endproc

; write 10 time `msg` into `filepath` and read the content of the file
_start:
    xor rax, rax
    call write_msg_to_file
    call print_file_content
    syscall1 SYS_EXIT, 0

segment readable writeable

print_file_buffer: rb 1024         ; reserve 1024 bytes
; print_file_buffer: db 1024 dup 0 ; duplicate 0 1024 times (1)
print_file_buffer_len = $ - print_file_buffer

i: dd 0

segment readable

string print_file_msg, "file content:", 0xA
string filepath, "test_write.txt", 0
string open_file_error, "error: cannot open file.", 0xA
string close_file_error, "error: failed to close file.", 0xA
string msg, "Hello 64-bit world!", 0xA
