#include <stdio.h>
#include <stdlib.h>

int main(){
    int x = 5;int y = 2;
    printf("x+y=%d\n",add(x, y));
    printf("x-y=%d\n",sub(x, y));
    printf("x*y=%d\n",mul(x, y));
    
    float a = 5;float b = 2;
    printf("x/y=%.2f\n", divs(a, b));

    return 0;
}
