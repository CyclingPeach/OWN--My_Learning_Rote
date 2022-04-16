// divs.c
#include<stdio.h>

float divs(float x,float y){
	printf("%.2f,%.2f\n",x,y);
	return x/y;
}

int main(){
	int x = 10;
	int y = 4;
	printf("x / y = %.2f\n",divs(x,y));

	return 0;
}
