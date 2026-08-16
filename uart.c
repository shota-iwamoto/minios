#include "uart.h"

#define UART_BASE 0x10000000UL

#define UART_THR  0
#define UART_LSR  5

#define UART_LSR_THRE 0x20

static volatile unsigned char *const uart =
    (volatile unsigned char *)UART_BASE;

void uart_init(void)
{
    /*
     * QEMU virt の UART は、
     * 今回は初期化処理をほとんど必要としません。
     */
}

void uart_putc(char c)
{
    while ((uart[UART_LSR] & UART_LSR_THRE) == 0) {
    }

    uart[UART_THR] = (unsigned char)c;
}

void uart_puts(const char *s)
{
    while (*s) {
        uart_putc(*s);
        s++;
    }
}