
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

CPU := 603e
PREFIX = powerpc-none-eabi-
CFLAGS := -Wa,-a32 -Wa,-m603 -Wa,-mregnames -W -g 
LDFLAGS := -T $(PWD)/link.ld -static --discard-none -E -d
FILES := $(shell find . -name '*.S') $(shell find . -name '*.s')
OBJECTS := $(FILES:%.S=%.o)
BASEDIR := $(PWD)
BINARY_NAME = output

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

.PHONY: all
all: clean $(BINARY_NAME)

$(BINARY_NAME): 
	$(PREFIX)gcc $(shell find $(BINDIR) -name '*.S') $(CFLAGS) -o $@
	$(PREFIX)objcopy -I elf32-powerpc -O binary $(BINARY_NAME) $(BINARY_NAME).bin

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

.PHONY: clean
clean:
	rm -f $(BINARY_NAME)* 

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

.PHONY: run run-debug
run: $(BINARY_NAME)
	$(PREFIX)gdb 

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

.PHONY: dump
dump: $(BINARY_NAME)
	$(PREFIX)objdump -D $(BINARY_NAME) | less
