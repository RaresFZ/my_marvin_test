CC = gcc
CFLAGS = -Wall -Wextra -Werror

SRC = main.c
OBJ = $(SRC:.c=.o)
EXEC = my_program

all: $(EXEC)

$(EXEC): $(OBJ)
	$(CC) $(OBJ) -o $(EXEC)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(EXEC)

test_run: $(EXEC)
	./$(EXEC)

.PHONY: all clean fclean test_run
