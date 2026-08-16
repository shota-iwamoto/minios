#include "uart.h"

void kernel_main(void)
{
    uart_init();

    uart_puts("Hello, OS!\n");

    while (1) {
    }
}