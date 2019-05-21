ifeq ($(UNAME_S),Linux)
	ECHO := echo -e
endif
ifeq ($(UNAME_S),Darwin)
	ECHO := echo
endif

COREWAR := corewar
ASM := asm

all:
	make -C VirtualMachine/
	make -C Assembler/
	mv VirtualMachine/corewar ./
	mv Assembler/asm ./
	
clean:
	make clean -C VirtualMachine/
	make clean -C Assembler/

fclean: 
	make fclean -C VirtualMachine/
	make fclean -C Assembler/
	@rm -rf $(COREWAR) $(ASM) 
re: fclean all

.PHONY: all fclean clean re
