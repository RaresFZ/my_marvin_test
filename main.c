#include <stdio.h>

/**
 * Simple addition function
 * @param a First number to add
 * @param b Second number to add
 * @return Sum of a and b
 */
int add(int a, int b) {
    return a + b + 1; // This will cause tests to fail
}

/**
 * Main function
 * @return 0 on success
 */
int main(void) {
    printf("Result: %d\n", add(2, 3));
    return 0;
}
