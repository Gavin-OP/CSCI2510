#include <stdlib.h>
#include <string.h>
#define ROWS 256    // do not modify the #define 
#define COLS 256    // do not modify the #define 

void matrix_multiply_block(int A[][COLS], int B[][COLS], int C[][COLS]) {
    // Hints: the lines of 'i_sub', 'j_sub', 'k_sub' are just like 'i', 'j', 'k' in matrix_multiply_naive()
    
    int i, j, k, i_sub, j_sub, k_sub;
    // YOUR CODE HERE
    int block_size = ...;    // find a proper block_size
    
    for (i = 0; i < ROWS; i += block_size) {
        for (j = 0; j < COLS; j += block_size) { 
            for (k = 0; k < ROWS; k += block_size) {   
                // YOUR CODE HERE
                for (i_sub = ...) {
                    for (j_sub = ...) {
                        for (k_sub = ...) {
                            ...
                        }
                    }
                }
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

    matrix_multiply_block(A, B, C);
    
    return 0;
}
