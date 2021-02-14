TARGET=c-main
CFLAGS += -no-pie -g -std=c99

all: $(TARGET)

%.o: %.asm
	nasm -g -F dwarf -f elf64 $<

clean:
	rm -rf $(TARGET) *.o

$(TARGET): asm-module.o c-main.c
	cc $(CFLAGS) asm-module.o c-main.c -o $(TARGET)