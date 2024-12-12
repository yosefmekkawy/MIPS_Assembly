#include <stdio.h>

int main() {
    int arr[10] = {10, 31, 5, 7, 11, 3, 8, 40, 12, 4};
    int min = arr[0];

    for (int i = 1; i < 10; i++) {
        if (arr[i] < min) {
            min = arr[i];
        }
    }

    printf("Min element is: %d\n", min);

    return 0;
}
