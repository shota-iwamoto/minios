.section .text

.globl _start
.type _start, @function

_start:
    la sp, stack_top
    call kernel_main

1:
    j 1b

.section .bss
.align 16

stack:
    .space 4096

stack_top: