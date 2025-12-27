# Colors
GREEN = \033[0;32m
YELLOW = \033[0;33m
RED = \033[0;31m
RESET = \033[0m

# Library name
NAME = libft.a

# Source files
# SRCS = $(wildcard *.c)
SRCS = ft_atoi.c\
		ft_bzero.c\
		ft_calloc.c\
		ft_isalnum.c\
		ft_isalpha.c\
		ft_isascii.c\
		ft_isdigit.c\
		ft_isprint.c\
		ft_itoa.c\
		ft_memchr.c\
		ft_memcmp.c\
		ft_memcpy.c\
		ft_memmove.c\
		ft_memset.c\
		ft_putchar_fd.c\
		ft_putendl_fd.c\
		ft_putnbr_fd.c\
		ft_putstr_fd.c\
		ft_split.c\
		ft_strchr.c\
		ft_strdup.c\
		ft_striteri.c\
		ft_strjoin.c\
		ft_strlcat.c\
		ft_strlcpy.c\
		ft_strlen.c\
		ft_strmapi.c\
		ft_strncmp.c\
		ft_strnstr.c\
		ft_strrchr.c\
		ft_strtrim.c\
		ft_substr.c\
		ft_tolower.c\
		ft_toupper.c

# Bonus source files
# BONUS_SRCS = $(wildcard *_bonus.c)
BONUS_SRCS = ft_lstadd_back_bonus.c\
		ft_lstadd_front_bonus.c\
		ft_lstclear_bonus.c\
		ft_lstdelone_bonus.c\
		ft_lstiter_bonus.c\
		ft_lstlast_bonus.c\
		ft_lstmap_bonus.c\
		ft_lstnew_bonus.c\
		ft_lstsize_bonus.c

# Include files
# INCS = $(wildcard *.h)
INCS = libft.h

# Object files
OBJS = $(SRCS:.c=.o)

# Bonus object files
BONUS_OBJS = $(BONUS_SRCS:.c=.o)

# Compiler and flags
CC = cc
CFLAGS = -Wall -Wextra -Werror # -g3 -fsanitize=address

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
