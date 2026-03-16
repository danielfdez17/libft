
# * Library name
NAME = libft.a

# * Utils
RESET = \033[0m
RED = \033[0;31m
GREEN = \033[0;32m
YELLOW = \033[0;33m
BLUE = \033[0;34m
LIBFT = $(BLUE)[$(NAME)]$(RESET)

MAKEFLAGS := -j$(shell nproc)

# * Source files
LIBFT_DIR = ./src/libft/
LIBFT_SRCS = 	ft_abs.c \
				ft_atoi.c \
				ft_atol.c \
				ft_bzero.c \
				ft_calloc.c \
				ft_isalnum.c \
				ft_isalpha.c \
				ft_isascii.c \
				ft_isdigit.c \
				ft_isprint.c \
				ft_itoa.c \
				ft_lstadd_back.c \
				ft_lstadd_front.c \
				ft_lstclear.c \
				ft_lstdelone.c \
				ft_lstiter.c \
				ft_lstlast.c \
				ft_lstmap.c \
				ft_lstnew.c \
				ft_lstsize.c \
				ft_max.c \
				ft_memchr.c \
				ft_memcmp.c \
				ft_memcpy.c \
				ft_memmove.c \
				ft_memset.c \
				ft_putchar_fd.c \
				ft_putendl_fd.c \
				ft_putnbr_fd.c \
				ft_putstr_fd.c \
				ft_split.c \
				ft_strchr.c \
				ft_strdup.c \
				ft_striteri.c \
				ft_strjoin.c \
				ft_strlcat.c \
				ft_strlcpy.c \
				ft_strlen.c \
				ft_strmapi.c \
				ft_strncmp.c \
				ft_strnstr.c \
				ft_strrchr.c \
				ft_strtrim.c \
				ft_substr.c \
				ft_swap.c \
				ft_tolower.c \
				ft_toupper.c \


OBJ_DIR = ./src/obj/

SRCS = $(LIBFT_SRCS)

FT_PRINTF_DIR = ./src/ft_printf/
FT_PRINTF_SRCS =	ft_printf.c \
					ft_put_char.c \
					ft_put_hex.c \
					ft_put_int.c \
					ft_put_str.c \
					ft_put_uint.c
SRCS += $(FT_PRINTF_SRCS)

GNL_DIR = ./src/gnl/
GNL_SRCS =	get_next_line.c \
			get_next_line_utils.c
SRCS += $(GNL_SRCS)

# * Include files
HEADERS = -I ./inc/headers
INCLUDES_DIR = ./inc/

# * Object files
OBJS = $(addprefix $(OBJ_DIR), $(SRCS:.c=.o))

# * Compiler and flags
MYCC = cc
MYCFLAGS = -Wall -Wextra -Werror -g3 -fsanitize=address

# * Removal
RM = rm -f

# * Archiver
AR = ar -rcs

# ! Rules
# ? Links a .c to its .o file
$(OBJ_DIR)%.o: $(LIBFT_DIR)%.c
	@$(MYCC) $(MYCFLAGS) $(HEADERS) -c $< -o $@

$(OBJ_DIR)%.o: $(FT_PRINTF_DIR)%.c
	@$(MYCC) $(MYCFLAGS) $(HEADERS) -c $< -o $@

$(OBJ_DIR)%.o: $(GNL_DIR)%.c
	@$(MYCC) $(MYCFLAGS) $(HEADERS) -c $< -o $@

# ? 📁 Creates the objects directory if it doesn't exist
obj:
	@mkdir -p $(OBJ_DIR)

# ? 🔨 Compiles the whole library
all: obj $(NAME)

$(NAME): $(OBJS)
	@$(AR) $(NAME) $(OBJS)
	@echo "$(LIBFT) $(GREEN)Built $(RESET)"

# ? 🧹 Removes the object files
clean:
	@$(RM) $(OBJS)
	@echo "$(LIBFT) $(RED)Object files removed $(RESET)"

# ? 🗑️ Removes both object and executable files
fclean: clean
	@$(RM) $(NAME)
	@echo "$(LIBFT) $(RED)Removed $(RESET)"

# ? 🔁 Rebuilds the library
re: fclean all
	@echo "$(LIBFT) $(YELLOW)Rebuilt $(RESET)"

# ? 📏 Checks the code with Norminette
norminette:
	@clear
	@norminette $(INCLUDES_DIR) $(LIBFT_DIR) $(FT_PRINTF_DIR) $(GNL_DIR) | grep Error || echo "$(LIBFT) $(GREEN)Norminette passed!$(RESET)"

# ? ❓ Displays this help message
help:
	@awk '\
		BEGIN { blue = "\033[0;34m"; green = "\033[0;32m"; reset = "\033[0m"; yellow = "\033[0;33m"; print yellow "Usage: make [target]"; print "Targets:" } \
		/^# \?/ { desc = substr($$0, 5); next } \
		/^$$/ { desc = ""; next } \
		/^[a-zA-Z0-9][a-zA-Z0-9_.-]*:/ { \
			target = $$1; \
			sub(/:.*/, "", target); \
			if (target !~ /^\./) \
				printf "  " blue "%-12s" reset green "%s" reset "\n", target, desc; \
			desc = ""; \
		}' $(firstword $(MAKEFILE_LIST))

.PHONY: obj all clean fclean re norminette help
