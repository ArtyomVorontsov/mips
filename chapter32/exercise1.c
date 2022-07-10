#include <stdio.h>

int main() {
    float term = 1;
    float x; 
    float sum = 1;
    float n = 1;
    scanf("%f", &x);
    
    for(float i = 1;i < 32;i++){
       term = term*x/i;
       sum += term;
    }
    
    printf("%.9f", sum);
    return 0;
}
