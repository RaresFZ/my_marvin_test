#include <criterion/criterion.h>
#include <criterion/redirect.h>

int add(int a, int b);

Test(add_test, basic_addition) {
    cr_assert_eq(add(2, 3), 5, "Addition should return 5");
    cr_assert_eq(add(0, 0), 0, "Zero addition should return 0");
    cr_assert_eq(add(-1, 1), 0, "Negative and positive should cancel out");
}

Test(add_test, more_tests) {
    cr_assert_eq(add(100, 200), 300, "Large numbers should add correctly");
}