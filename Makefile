CROSS = riscv64-elf-

CC = $(CROSS)gcc
LD = $(CROSS)ld
OBJCOPY = $(CROSS)objcopy

CFLAGS = -march=rv64gc -mabi=lp64d \
         -ffreestanding \
         -nostdlib \
         -fno-builtin \
         -Wall \
         -Wextra

LDFLAGS = -T linker.ld

TARGET = kernel.elf

OBJS = boot.o kernel.o

all: $(TARGET)

boot.o: boot.S
	$(CC) $(CFLAGS) -c boot.S -o boot.o

kernel.o: kernel.c
	$(CC) $(CFLAGS) -c kernel.c -o kernel.o

$(TARGET): $(OBJS) linker.ld
	$(CC) $(LDFLAGS) -nostdlib -o $(TARGET) $(OBJS)

run: $(TARGET)
	qemu-system-riscv64 \
		-machine virt \
		-bios none \
		-nographic \
		-kernel $(TARGET)

clean:
	rm -f *.o $(TARGET)