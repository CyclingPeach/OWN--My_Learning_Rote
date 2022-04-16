# 知识点

## 1、概述

## 2、`make`简介
`make` 是一个命令工具，当运行 `make` 命令时，会在当前目录下寻找名为`GNUmakefile`、`Makefile`、`makefile`的文件。
- Makefile文件说明了**组成程序的各模块间的相互关系**以及**更新模块时必须进行的动作**
- `make` 按照这些说明自动地维护这些模块。

## 3、`Makefile`简介
`Makefile` 文件描述了整个工程的编译、链接等规则。
- 其中包括：
    - 工程中的哪些`源文件`需要编译以及如何编译、
    - 需要创建哪些`库文件`以及如何创建这些库文件、
    - 如何在最后产生我们想要的`可执行文件`。

尽管看起来可能是很复杂的事情，但是为工程编写Makefile的好处是能够使用一行命令来完成`自动化编译`。

一旦提供一个（通常对于一个工程来说会是多个）正确的Makefile。编译整个工程所要做的事就是在shell提示符下输入make命令。整个工程完全自动编译，极大提高了效率。

## 4、`Makefile`规则
```C
target...:prerequisites
    command
    ...
    ...
```
- `target`可以是一个`object file`(目标文件)，也可以是一个`可执行文件`，还可以是一个`label`(标签)
- `prerequisites`依赖文件或target
- `command`要执行的命令

这是一个文件的依赖关系，也就是说，`target` 这一个或多个的目标文件依赖于`prerequisites `中的文件，其生成规则定义在`command`中。也就是说 `prerequisites` 中如 果有一个以上的文件比`target` 文件要新的话，`command`所定义的命令就会被执行。

这就是 makefile的规则，也就是 makefile 中最核心的内容。

## 5、编译过程
- （1）读入所有的 `Makefile` 文件；
- （2）读入被`include`包括的其他 `Makefile` 文件；
- （3）初始化文件中的变量；
- （4）推导隐式规则，并分析所有规则；
- （5）根据依赖关系，决定哪些目标要重新生成；
- （6）执行生成命令。

# 二、练习

#### 1、简单的Makefile
- 文件：`hello.c`、`hello.h`、`Makefile`
- 执行：`make`>>>`hello`
```C
// hello.h
#include <stdio.h>
```
```C
// hello.c
#include "hello.h"

int main(){
    printf("Hello World!\n");
    return 0;
}
```

```Makefile
// Makefile
hello:hello.c hello.h
    gcc hello.c -o hello
```


#### 2、采用变量的形式替换Makefile内容

|符号|作用|
|:-:|:-:|
|`$@`|目标文件|
|`$^`|所有的依赖文件|
|`$<`|第一个依赖文件|
|`$?`|比目标文件还新的依赖文件|

```Makefile
// Makefile

OBJS1 := hello.o
OBJS2 := hello.c hello.h
CC := gcc

hello:$(OBJS1)
    $(CC) $(OBJS1) -o $@
$(OBJS1):$(OBJS2)
    $(CC) -c $< -o $@)
```


#### 3、加减乘除（4个单独的文件）
```C
// sub.h
#include <stdio.h>
```
```C
// add.c
int add(int x, int y){
    return x + y;
}
```
```C
// sub.c
int sub(int x, int y){
    return x - y;
}
```
```C
// mul.c
int mul(int x, int y){
    return x * y;
}
```
```C
// divs.c
float divs(float x, float y){
    return x / y;
}
```

```C
// main.c
#include <stdio.h>
#include <stdlib.h>
#include "sub.h"

int main(){
    int x = 10;
    int y = 2;

    printf("x+y=%d\n",add(x, y));
    printf("x-y=%d\n",sub(x, y));
    printf("x*y=%d\n",mul(x, y));
    
    printf("x/y=%.2f\n",divs(float x, float y));

    return 0;
}
```

```Makefile
// Makefile
main:sub.h add.c sub.c mul.c divs.c main.c
    gcc -c add.c sub.c mul.c divs.c main.c -o main
```