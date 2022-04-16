# 一、知识点
## 1、概述


## 2、简介


## 3、编译过程【重要】
- 使用方法：
`gcc [选项] 文件名`

|序号|过程|选项|选项作用|命令|
|:-:|:-:|:-:|:-:|:-:|
|(1)|**`Pre-processsing`**|`-E`|插入头文件，替换宏|`gcc -E test.c -o test.i`|
|(2)|**`Compiling`**|`-S`|编译成汇编|`gcc -S test.i -o test.s`|
|(3)|**`Assembing`**|`-c`|编译成目标文件|`gcc -c test.o -o test.o`|
|(4)|**`Linking`**||链接到库中，变成可执行文件|`gcc test.o -o test`|
以上步骤可一次生成
- `gcc test.c -o test`

## 4、gcc常用选项【重要】

![图 4](../images/6b1b14885a4d40f2404b52244e406474a1e532ccd2714bcb2f09380f6dd891d3.png)  

## 5、gcc生成动态库和静态库【重要】
![图 6](../images/02e85899b57381d5e03a50d60bac473bbfa450449b80f57a65c15487dc099a18.png)  


# 二、练习

#### 1、g++编译c++程序练习
`HelloWorld.cpp`
```C++
using namespace std;
#include <iostream>
int main(){
    cout << "Hello World!\n";
    return 0;
}
```
【说明】
- `g++`是将`gcc`默认语言设为`C++`的一个特殊版本。
- 链接时，它使用`C++`标准库，而不使用`C`标准库。
- 使用`gcc`编译`C++`程序也是可以的，但是需要在编译语句中加上`-lstdc++`
    - `gcc HelloWorld.cpp -lstdc++`

【编译】
- `g++ HelloWorld.cpp`>>>`a.out`
- 终端输入`./a.out`
- 终端输出`Hello World!`

#### 2、使用gcc编译多个文件
- 加减功能
    - 以有文件：`sub.h`、`sub.c`、`main.c`
    - 编译命令：`gcc sub.c main.c -o sub`>>>`sub`
    - 运行程序：`./sub`
```C
// sub.h
#ifndef SUB_H
#define SUB_H

int add(int, int);
int sub(int, int);
#endif
```
```C
// sub.c
int add(int x, int y){
	return x+y;
}

int sub(int x, int y){
	return x-y;
}
```
```C
// main.c
#include<stdio.h>
#include<stdlib.h>
#include "sub.h"

int main(){
	int a=5;
	int b=2;
	printf("a+b = %d\n",add(a,b));
	printf("a-b = %d\n",sub(a,b));
	return 0;
}
```



- 将`sub.c`编译成库文件，编译`main.c`时链接该库文件
    - 
    - 修改main.c（如下）
    - `gcc -c sub.c -o sub.o`>>>`sub.o`
    - `ar -rc libsub.a sub.o`>>>`libsub.a`库文件(静态库)
    - `gcc main.c -o sub -L .-l sub`>>>`sub`

```C
// main.c
#include<stdio.h>
#include<stdlib.h>
#include "sub.h"

// 加入以下两句，调用sub库里的函数
int add(int x, int y);
int sub(int x, int y);

int main(){
	int a=5;
	int b=2;
	printf("a+b = %d\n",add(a,b));
	printf("a-b = %d\n",sub(a,b));
	return 0;
}
```
