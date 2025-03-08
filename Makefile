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
	./$(EXEC) 5 + 3 > result.txt
	cat result.txt
	grep -q "Result: 5 + 3 = 8" result.txt && echo "Test Passed!" || echo "Test Failed!"

	./$(EXEC) 10 / 2 >> result.txt
	cat result.txt
	grep -q "Result: 10 / 2 = 5" result.txt && echo "Test Passed!" || echo "Test Failed!"

	./$(EXEC) 10 / 0 >> result.txt
	cat result.txt
	grep -q "Error: Division by zero!" result.txt && echo "Test Passed!" || echo "Test Failed!"

.PHONY: all clean fclean test_run
