#include <stdlib.h>
#include <stdio.h>

struct EMPLOYEE {
    int age;
    int pay;
    int class;
};

void PStruct(struct EMPLOYEE *emp){
    printf("age %d\n", emp->age );
    printf("pay %d\n", emp->pay);
    printf("class %d\n\n", emp->class);
}

int main() {
    struct EMPLOYEE *emp1; 
    emp1 = (struct EMPLOYEE *)malloc( sizeof( struct EMPLOYEE ) );
    
    emp1->age = 23;
    emp1->pay = 22;
    emp1->class = 30;
    
    struct EMPLOYEE *emp2;
    emp2 = (struct EMPLOYEE *)malloc(sizeof(struct EMPLOYEE));
    
    emp2->age = emp1->age;
    emp2->pay = emp1->pay;
    emp2->class = emp1->class;
    
    PStruct( emp1 );
    PStruct( emp2 );

    return 0;
}

