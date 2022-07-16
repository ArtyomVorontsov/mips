#include <stdio.h>

int main() {
    float term = 1;
    float x; 
    float sum = 1;
    scanf("%f", &x);
    
    for(float n = 1;n < 32;n++){
       term = term*x/n;
       sum += term;
    }
    
    printf("%.9f", sum);
    return 0;
}
