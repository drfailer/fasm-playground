; for ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; generates a basic for loop with a lower and upper bound

macro for name, i, lower, upper {
    mov QWORD i, lower
    .#name#_iterate:
        cmp QWORD i, upper
        jge .#name#_stop
}

macro endfor name, i {
        inc QWORD i
        jmp .#name#_iterate
    .#name#_stop:
}

; string ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; helper macro to define a string and its length in the data segments

macro string name, [val] {
    common
        name: db val
        name#_len = $ - name
}

; proc ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; helper macro to define a procedure (fancier Enter + Leave)

macro proc name {
    name:
        push rbp
        mov rbp, rsp
}

macro endproc {
        mov rsp, rbp
        pop rbp
        ret
}
