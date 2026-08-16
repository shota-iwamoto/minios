# minios

                 QEMU
                  │
                  ▼
          ┌───────────────┐
          │ RISC-V CPU    │
          └───────┬───────┘
                  │
                  ▼
              boot.S
                  │
                  │ call
                  ▼
          ┌───────────────┐
          │ kernel_main() │
          └───────┬───────┘
                  │
                  ▼
             uart_puts()
                  │
                  ▼
             uart_putc()
                  │
                  ▼
          0x10000000
                  │
                  ▼
             UART device
                  │
                  ▼
             Terminal