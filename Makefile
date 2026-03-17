
# * Library name
NAME = libft.a

# * Utils
RESET = \033[0m
RED = \033[0;31m
GREEN = \033[0;32m
YELLOW = \033[0;33m
BLUE = \033[0;34m
CYAN = \033[0;36m
MAGENTA = \033[0;35m
LIBFT = $(BLUE)[$(NAME)]$(RESET)

# * Timer helper
define RUN_AND_LOG
	@start_ms=$$(date +%s%3N); \
	$(1); status=$$?; \
	end_ms=$$(date +%s%3N); \
	elapsed_ms=$$((end_ms - start_ms)); \
	if [ $$status -eq 0 ]; then \
		printf "%b [%sms]\n" "$(2)" "$$elapsed_ms"; \
	fi; \
	exit $$status
endef

# * Compiler and flags
MYCC = cc
WARNING_FLAGS = -Wall -Wextra -Werror
DEBUG_FLAGS = -g3 -fsanitize=address
# MYCFLAGS = -Wall -Wextra -Werror -g3 -fsanitize=address
CPPFLAGS = -I./inc -MMD -MP

BUILD_TYPE ?= release

ifeq ($(BUILD_TYPE),debug)
	OPT_FLAGS = -g3 -ggdb -O0 # Optimize for debugging, not for speed
else
	OPT_FLAGS = -O2 # Optimize for speed, but not at the cost of debuggability
endif

CFLAGS = $(WARNING_FLAGS) $(OPT_FLAGS)

# * Removal
RM = rm -rf

# * Archiver
AR = ar -rcs

NOPRINT += --no-print-directory

# * Source files
SOURCES_DIR = ./src/
LIBFT_SRCS = 		src/libft/ft_abs.c \
					src/libft/ft_atoi.c \
					src/libft/ft_atol.c \
					src/libft/ft_bzero.c \
					src/libft/ft_calloc.c \
					src/libft/ft_isalnum.c \
					src/libft/ft_isalpha.c \
					src/libft/ft_isascii.c \
					src/libft/ft_isdigit.c \
					src/libft/ft_isprint.c \
					src/libft/ft_itoa.c \
					src/libft/ft_lstadd_back.c \
					src/libft/ft_lstadd_front.c \
					src/libft/ft_lstclear.c \
					src/libft/ft_lstdelone.c \
					src/libft/ft_lstiter.c \
					src/libft/ft_lstlast.c \
					src/libft/ft_lstmap.c \
					src/libft/ft_lstnew.c \
					src/libft/ft_lstsize.c \
					src/libft/ft_max.c \
					src/libft/ft_memchr.c \
					src/libft/ft_memcmp.c \
					src/libft/ft_memcpy.c \
					src/libft/ft_memmove.c \
					src/libft/ft_memset.c \
					src/libft/ft_putchar_fd.c \
					src/libft/ft_putendl_fd.c \
					src/libft/ft_putnbr_fd.c \
					src/libft/ft_putstr_fd.c \
					src/libft/ft_split.c \
					src/libft/ft_strchr.c \
					src/libft/ft_strdup.c \
					src/libft/ft_striteri.c \
					src/libft/ft_strjoin.c \
					src/libft/ft_strlcat.c \
					src/libft/ft_strlcpy.c \
					src/libft/ft_strlen.c \
					src/libft/ft_strmapi.c \
					src/libft/ft_strncmp.c \
					src/libft/ft_strnstr.c \
					src/libft/ft_strrchr.c \
					src/libft/ft_strtrim.c \
					src/libft/ft_substr.c \
					src/libft/ft_swap.c \
					src/libft/ft_tolower.c \
					src/libft/ft_toupper.c
FT_PRINTF_SRCS =	src/ft_printf/ft_printf.c \
					src/ft_printf/ft_put_char.c \
					src/ft_printf/ft_put_hex.c \
					src/ft_printf/ft_put_int.c \
					src/ft_printf/ft_put_str.c \
					src/ft_printf/ft_put_uint.c
GNL_SRCS =			src/gnl/get_next_line.c \
					src/gnl/get_next_line_utils.c

SRCS = $(LIBFT_SRCS) \
	$(FT_PRINTF_SRCS) \
	$(GNL_SRCS)

# * Include files
INCLUDES_DIR = ./inc/

# * Object files
OBJS = $(SRCS:.c=.o)
DEPS = $(SRCS:.c=.d)
-include $(DEPS)

# ! Rules
# ? Links a .c to its .o file
$(OBJS): %.o: %.c
	@$(MYCC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

# ? 🔨 Compiles the whole library
all:
	@build_plan="$$($(MAKE) -s -n $(NAME) $(NOPRINT) 2>&1)"; status=$$?; \
	if [ $$status -ne 0 ]; then \
		printf "%s\n" "$$build_plan"; \
		exit $$status; \
	elif [ -n "$$build_plan" ]; then \
		$(MAKE) $(NAME) $(NOPRINT); \
	else \
		printf "%b\n" "$(LIBFT) $(CYAN)Everything is up to date$(RESET)"; \
	fi

$(NAME): $(OBJS)
	$(call RUN_AND_LOG,$(AR) $(NAME) $(OBJS),$(LIBFT) $(GREEN)Built $(RESET))

# ? 🧹 Removes the object files
clean:
	$(call RUN_AND_LOG,$(RM) $(OBJS) $(DEPS),$(LIBFT) $(RED)Object files removed $(RESET))

# ? 🗑️ Removes both object and executable files
fclean:
	$(call RUN_AND_LOG,$(MAKE) clean $(NOPRINT); $(RM) $(NAME),$(LIBFT) $(RED)Removed $(RESET))

# ? 🔁 Rebuilds the library
re:
	$(call RUN_AND_LOG,$(MAKE) fclean $(NOPRINT); $(MAKE) all $(NOPRINT),$(LIBFT) $(YELLOW)Rebuilt $(RESET))

# ? 📏 Checks the code with Norminette
norminette:
	$(call RUN_AND_LOG,clear; norminette $(INCLUDES_DIR) $(SOURCES_DIR) | grep Error || echo "$(LIBFT) $(GREEN)Norminette passed!$(RESET)",$(LIBFT) $(BLUE)Norminette checked!$(RESET))

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

.PHONY: all clean fclean re norminette help

.DEFAULT_GOAL := all
