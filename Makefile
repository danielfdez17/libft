# Colors
GREEN = \033[0;32m
YELLOW = \033[0;33m
RED = \033[0;31m
RESET = \033[0m

# Library name
NAME = libft.a

# Source files
LIBFT_DIR = ./src/libft/
LIBFT_SRCS = $(shell ls $(LIBFT_DIR) | grep -E ".+\.c")

OBJ_DIR = ./src/obj/

SRCS = $(addprefix $(LIBFT_DIR), $(LIBFT_SRCS))
OBJS = $(addprefix $(OBJ_DIR), $(LIBFT_SRCS:.c=.o))

FT_PRINTF_DIR = ./src/ft_printf/
FT_PRINTF_SRCS = $(shell ls $(FT_PRINTF_DIR) | grep -E ".+\.c")
SRCS += $(addprefix $(FT_PRINTF_DIR), $(FT_PRINTF_SRCS))
OBJS += $(addprefix $(OBJ_DIR), $(FT_PRINTF_SRCS:.c=.o))

GNL_DIR = ./src/gnl/
GNL_SRCS = $(shell ls $(GNL_DIR) | grep -E ".+\.c")
SRCS += $(addprefix $(GNL_DIR), $(GNL_SRCS))
OBJS += $(addprefix $(OBJ_DIR), $(GNL_SRCS:.c=.o))

# Include files
# INCS = $(wildcard *.h)
INCS = libft.h

# Object files
OBJS = $(SRCS:.c=.o)

# Bonus object files
BONUS_OBJS = $(BONUS_SRCS:.c=.o)

# Compiler and flags
CC = cc
CFLAGS = -Wall -Wextra -Werror -g3 -fsanitize=address

# Removal
RM = rm -f

# Archiver
AR = ar -rcs

# Links a .c (and .h if needed) to its .o file
%.o: %.c
	@$(CC) $(CFLAGS) -c $< -o $@ -I INCS

# Compiles the whole program/library
all: $(NAME)

$(NAME): $(OBJS) $(INCS)
	@$(AR) $(NAME) $(OBJS)
	@echo "$(GREEN)[OK] $(NAME)$(RESET)"

# Compiles the bonus exercises
bonus: all $(BONUS_OBJS) $(INCS)
	@$(AR) $(NAME) $(BONUS_OBJS)
	@echo "$(GREEN)[OK] $(NAME) bonus$(RESET)"

# Removes the object files
clean:
	@$(RM) $(OBJS) $(BONUS_OBJS)
	@echo "$(GREEN)[OK] $(RED)Removing object files $(RESET)"

# Removes both object and executable files
fclean: clean
	@$(RM) $(NAME)
	@echo "$(GREEN)[OK] $(RED)Removing executable $(RESET)"

# Rebuilds the program/library
re: fclean all
	@echo "$(GREEN)[OK] $(YELLOW)Rebuilding $(NAME)$(RESET)"

# Rebuilds the bonus program/library
rebonus: fclean bonus
	@echo "$(GREEN)[OK] $(YELLOW)Rebuilding $(NAME) bonus$(RESET)"

.PHONY: all clean fclean re rebonus bonus
