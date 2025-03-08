# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra -Werror
SRC = main.c
OBJ = $(SRC:.c=.o)
EXEC = my_program

# Default target to compile the program
all: $(EXEC)

# Rule to compile the program
$(EXEC): $(OBJ)
	$(CC) $(OBJ) -o $(EXEC)

# Rule to create object files
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Rule for cleaning up object files
clean:
	rm -f $(OBJ)

# Rule for fully cleaning (removes executable and object files)
fclean: clean
	rm -f $(EXEC)

# Rule to compile and run the program for testing
test_run: $(EXEC)
	@echo "Running test cases..."

	# Test Case 1: 5 + 3
	./$(EXEC) 5 + 3 > result.txt
	@echo "Expected Output: Result: 5 + 3 = 8"
	@echo "Actual Output:"
	cat result.txt
	@echo "Testing 5 + 3..."
	@if ! grep -q "Result: 5 + 3 = 8" result.txt; then \
		echo "Test Failed!"; \
		exit 1; \
	else \
		echo "Test Passed!"; \
	fi

	# Test Case 2: 10 / 2
	./$(EXEC) 10 / 2 > result.txt
	@echo "Expected Output: Result: 10 / 2 = 5"
	@echo "Actual Output:"
	cat result.txt
	@echo "Testing 10 / 2..."
	@if ! grep -q "Result: 10 / 2 = 5" result.txt; then \
		echo "Test Failed!"; \
		exit 1; \
	else \
		echo "Test Passed!"; \
	fi

	# Test Case 3: Division by Zero
	./$(EXEC) 10 / 0 > result.txt
	@echo "Expected Output: Error: Division by zero!"
	@echo "Actual Output:"
	cat result.txt
	@echo "Testing Division by Zero..."
	@if ! grep -q "Error: Division by zero!" result.txt; then \
		echo "Test Failed!"; \
		exit 1; \
	else \
		echo "Test Passed!"; \
	fi

	# Test Case 4: Invalid Operator
	./$(EXEC) 10 ^ 2 > result.txt
	@echo "Expected Output: Unknown operator: ^"
	@echo "Actual Output:"
	cat result.txt
	@echo "Testing Invalid Operator..."
	@if ! grep -q "Unknown operator: ^" result.txt; then \
		echo "Test Failed!"; \
		exit 1; \
	else \
		echo "Test Passed!"; \
	fi

	@echo "All tests completed."

.PHONY: all clean fclean test_run
