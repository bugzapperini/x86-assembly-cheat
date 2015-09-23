; # pushf

; # pushfd

; # pushfq

; # popf

    ; Like pusha and popa, but for flags:

    ; - push/pop FLAGS
    ; - pushd/popd EFLAGS


%include "lib/asm_io.inc"

ENTRY

    clc
    mov eax, esp
    pushf
    sub eax, esp
    ; Needs 2 bytes, stack min 1 dword.
    ASSERT_EQ 4

    stc
    popf
    ASSERT_FLAG jnc

    clc
    pushfd
    stc
    popfd
    ASSERT_FLAG jnc

    EXIT
