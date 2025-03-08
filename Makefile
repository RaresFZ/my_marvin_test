# Makefile for C project

CC = gcc
CFLAGS = -Wall -g

# Targets for building the executables
SUCCESS_EXEC = test_success
FAIL_EXEC = test_fail

all: $(SUCCESS_EXEC) $(FAIL_EXEC)

$(SUCCESS_EXEC): test_success.c
	$(CC) $(CFLAGS) -o $(SUCCESS_EXEC) test_success.c

$(FAIL_EXEC): test_fail.c
	$(CC) $(CFLAGS) -o $(FAIL_EXEC) test_fail.c

# Clean the build
clean:
	rm -f $(SUCCESS_EXEC) $(FAIL_EXEC)

# Remove everything, including object files if they existed
fclean: clean

# Run tests
tests_run:
	./$(SUCCESS_EXEC) && echo "Success Test Passed" || exit 1
	./$(FAIL_EXEC) && echo "Fail Test Passed" || exit 1
