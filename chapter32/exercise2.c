// pi = 4( 1 - 1/3 + 1/5 - 1/7 + 1/9 - . . .)
#include <stdio.h>

int main() {
    float acc = 1;
    int two = 2;
    float divisor = 1;
    
    for(int i = 1; i <= 10000; i++ ){
        divisor += 2;
        if(i%two == 0){
            acc += 1.0/divisor;
        }else{
            acc -= 1.0/divisor;
        }
    }
    acc *= 4;
  
    printf("%f\n", acc);
    return 0;
}
