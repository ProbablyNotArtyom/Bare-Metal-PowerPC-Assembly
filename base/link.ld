OUTPUT_FORMAT("elf32-powerpc", "elf32-powerpc", "elf32-powerpc")
OUTPUT_ARCH(powerpc:common)
ENTRY(_entry)

/* QEMU places the first byte of the -bios image file at 0xfff00000 and execution begins at 0xfff00100 */
MEMORY {
  ram (rwx) : ORIGIN = 0x1000000, LENGTH = 16M
  rom (rx) : ORIGIN = 0xfff00000, LENGTH = 1M
  rst (rx) : ORIGIN = 0xfffffffc, LENGTH = 4
}

SECTIONS {
	.text : {
		/* skip to the reset ISR vector */
      	. = 0x100;
		/* make sure that _entry is aligned to the page */
    	*(.text.start)
	} > rom

	.rodata : {
		*(.rodata)
	} > rom

	.text.reset : {
		/* some targets reset from here */
		*(.text.reset)
	} > rst
}
