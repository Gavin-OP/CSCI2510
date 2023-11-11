#include <stdlib.h>
#include <string.h>
#define ROWS 65536

void loop(int A[][4]){
    int sum = 0;
    int j, i;
    double mean;

    // 1) forward loop
    for (j = 0; j < ROWS; j++)
        sum += A[j][0];
    mean = sum / 10.0;

    // 2) backward loop
    for (i = ROWS - 1; i >= 0; i--)
        A[i][0] = A[i][0] / mean;
}

int main(){
    int A[ROWS][4];
    loop(A);
}

