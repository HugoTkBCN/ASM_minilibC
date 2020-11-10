ASFLAGS		= -f elf64

SRC	= 	src/strlen.asm		\
		src/strcmp.asm		\
		src/strncmp.asm		\
		src/strcasecmp.asm	\
		src/strchr.asm		\
		src/strcspn.asm		\
		src/strstr.asm		\
		src/strpbrk.asm		\
		src/rindex.asm		\
		src/memset.asm		\
		src/memcpy.asm		\
		src/memmove.asm

NAME	=	libasm.so

OBJS	=	$(SRC:.asm=.o)

FLAGS =	 -fPIC -shared

all:	$(NAME)

$(NAME): $(OBJS)
	ld -o $(NAME) $(FLAGS) $(OBJS)

%.o: %.asm
	nasm $(ASFLAGS) $< -o $@

clean:
	@rm -rf $(OBJS)

fclean: clean
	@rm -rf $(NAME)

re:	fclean all