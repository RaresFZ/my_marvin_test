CC = gcc
CFLAGS = -Wall -Wextra -Werror
LDFLAGS = -lcriterion

SRC = main.c
OBJ = $(SRC:.c=.o)
NAME = my_program
TEST_SRC = tests.c main.c
TEST_OBJ = $(TEST_SRC:.c=.o)
TEST_NAME = unit_tests

all: $(NAME)

$(NAME):	$(OBJ)
	$(CC)	-o	$(NAME)	$(OBJ)

tests_run:	$(TEST_OBJ)
	$(CC)	-o	$(TEST_NAME)	$(TEST_OBJ)	$(LDFLAGS)
	./$(TEST_NAME)

clean:
	rm	-f	$(OBJ)	$(TEST_OBJ)

fclean:	clean
	rm	-f	$(NAME)	$(TEST_NAME)

re:	fclean	all

.PHONY:	all	tests_run	clean	fclean	re
