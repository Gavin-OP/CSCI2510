#include <stdlib.h>
#include <string.h>
#define ROWS 256    // do not modify the #define 
#define COLS 256    // do not modify the #define 

void matrix_multiply_swap(int A[][COLS], int B[][COLS], int C[][COLS]) {
    // Hints: just swap the lines of 'j' and 'k' in matrix_multiply_naive()

    // YOUR CODE HERE
    for (int i = 0; i < ROWS; i++){
        for (...) { 
            for (...) {
                ...
            }
        }
    }
}

int main(){
    int A[ROWS][COLS];
    int B[ROWS][COLS];
    int C[ROWS][COLS];
    
    srand(2510);
    for (int i = 0; i < ROWS; i++) {
        for (int j = 0; j < COLS; j++) {
            A[i][j] = rand();
            B[i][j] = rand();
            C[i][j] = 0;
        }
    }

    matrix_multiply_swap(A, B, C);
    
    return 0;
}
