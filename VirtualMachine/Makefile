NAME := corewar
NPWD := $(CURDIR)/$(NAME)

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
	ECHO := echo -e
endif
ifeq ($(UNAME_S),Darwin)
	ECHO := echo
endif

CC := gcc -march=native -mtune=native
CFLAGS := -Wall -Wextra -Werror -Ofast
IFLAGS := -I $(CURDIR)/includes/

SRC := $(abspath $(wildcard src/*.c))
SRC += $(abspath $(wildcard src/*/*.c))
OBJ := $(SRC:.c=.o)

LIBFT := $(CURDIR)/libft/libft.a
LMAKE := make -C libft

WHITE := \033[0m
BGREEN := \033[42m
GREEN := \033[32m
RED := \033[31m
YELLOW := \033[33m
INVERT := \033[7m

SUCCESS = [$(GREEN)✓$(WHITE)]

DEL := rm -rf

all: $(NAME)

$(OBJ): %.o: %.c
	@$(ECHO) -n ' $@: '
	@$(CC) -c $(CFLAGS) $(LIBSINC) $(IFLAGS) $< -o $@
	@$(ECHO) "$(SUCCESS)"

$(LIBFT):
	@$(LMAKE)

$(NAME): $(LIBFT) $(OBJ)
	@$(ECHO) -n ' $(NPWD): '
	@$(CC) $(OBJ) $(LIBS) $(LIBFT) -lncurses -o $(NAME)
	@$(ECHO) "[$(INVERT)$(GREEN)✓$(WHITE)]"

del:
	@$(DEL) $(OBJ)

clean:
	@$(DEL) $(OBJ)
	@$(ECHO) "$(YELLOW)objects deleted$(WHITE)"
	@$(LMAKE) clean

fclean: clean
	@$(LMAKE) fclean
	@$(DEL) $(NAME)
	@$(ECHO) "$(INVERT)$(RED)deleted$(WHITE)$(INVERT): $(NPWD)$(WHITE)"

re: fclean all

.PHONY: all fclean clean re
