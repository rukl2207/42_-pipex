NAME		=	pipex
NAME_B		=	pipex_bonus

CC			=	gcc
CFLAGS		=	-Wall -Wextra -Werror
RM			=	rm -f

FILES_M		= 	${shell find ./src_mandatory ./src_ft -name "*.c"}
SRC_M		= 	$(FILES_M)
OBJ_M		=	$(patsubst %.c,%.o,$(SRC_M))
HEAD_M		=	./src_mandatory/pipex.h
HEAD_FT		=	./src_ft/libft.h
INC_M		=	-I$(HEAD_M) -I$(HEAD_FT)

FILES_B		= 	${shell find ./src_bonus ./src_ft -name "*.c"}
SRC_B		= 	$(FILES_B)
OBJ_B		=	$(patsubst %.c,%.o,$(SRC_B))
HEAD_B		=	./src_bonus/pipex_bonus.h
INC_B		=	-I$(HEAD_B) -I$(HEAD_FT)

.PHONY:		all clean fclean re bonus rebonus

all:		$(NAME)

$(NAME):	$(OBJ_M) $(HEAD_M)
			@$(CC) $(CFLAGS) $(INC_M) $(OBJ_M) -o $(NAME)
			@echo "\033[32m[$(NAME)] mandatory part compiled."

%.o:		%.c
			@$(CC) $(CFLAGS) -c $< -o $@

bonus:		$(NAME_B)

$(NAME_B):	$(OBJ_B) $(HEAD_B)
			@$(CC) $(CFLAGS) $(INC_B) $(OBJ_B) -o $(NAME_B)
			@echo "\033[32m[$(NAME_B)] bonus part compiled."

clean:
			@$(RM) $(OBJ_M) $(OBJ_B)
			@echo "\033[32m[$(NAME)] removed object files."

fclean:		clean
			@$(RM) $(NAME) $(NAME_B)
			@echo "\033[32m[$(NAME)] removed executable files."


re:			fclean all

rebonus:	fclean bonus
