# 0、说明
## 命令执行
- 直接输入命令就是在默认PATH目录下搜索命令
- 也可以用命令的绝对路径执行
- 也可以是相对路径

```bash
tzy@MBK:~$ echo $PATH
```
`/home/tzy/.nvm/versions/node/v16.14.2/bin:/home/tzy/Software/miniconda3/condabin:/home/tzy/Software/mongodb/bin:/home/tzy/.local/bin:/home/tzy/Software/mongodb/bin:/home/tzy/nodejs/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/etc/nodejs//bin:/usr/local/etc/nodejs//bin`


# 1、基本命令
## （1） 关机和重启
|序号|命令|作用|备注|
|:-:|:-|:-:|-|
|1|`shutdown -h now`|立刻关机|
|2|`shutdown -h 5`|5分钟后关机|
|3|`poweroff`|立刻关机|
|4|`shutdown -r now`|立刻重启|
|5|`shutdown -r 5`|5分钟后重启|
|6|`reboot`|立刻重启|
## （2） 帮助命令
|序号|命令|作用|举例|
|:-:|:-|:-:|-|
|1|`--help`|显示命令帮助信息|`pwd --help`|
|2|`man`|打开命令的说明书|`man pwd`|
`man`命令的安装命令：
```bash
sudo apt-get install manpages-posix manpages-posix-dev
```
## （3）`pwd`命令
|序号|命令|作用|
|:-:|:-|:-:|
|1|`pwd`|`查看当前目录`|
##  （4）`ps`查看进程
`ps` = `Process Status`缩写
|序号|命令|作用||
|:-:|:-|:-:|:-:|
|1|`ps`|列出系统中当前运行的那些进程（执行`ps`命令的那个时刻的那些进程）|`Process Status`|
|2|`ps -ef`|查看所有正在运行的进程|
|3|`top`|动态的进程显示信息|
|4|`ps -axjf`|列出类似进程树的程序显示|
**`ps`与`grep`的组合用法**
- 查找特定进程
`ps -ef | grep ssh`:
## （5）`kill`结束进程
- `kill pid`或`kill -9 pid`（强制杀死进程）
- `kill -l`列出所有`kill`的可用信号

## （6）`ifconfig`查看网卡信息
- `ifconfig`或`ifconfig | more`
- 安装命令
`sudo apt-get install net-tools`


## （7）`ping`查看与某台机器的连接情况

- **安装命令**
```bash
sudo apt-get install iputils-ping
```

# 2、目录操作命令
## （1）切换目录
|序号|命令|作用|
|:-:|:-|:-|
|1|`cd /`|切换到根目录|
|2|`cd /usr`|切换到根目录下的`usr`目录|
|**3**|**`cd ../`或`cd ..`**|切换到上一级目录|
|4|`cd ~`|切换到`home`目录|
|**5**|**`cd -`**|切换到上次访问的目录|
## （2）查看目录
|序号|命令|作用|
|:-:|:-|:-|
||`ls`|显示（列出）当前目录下的所有目录和文件（不包括隐藏文件）|
||`ls -a`|显示（列出）当前目录下的所有目录和文件（包括隐藏文件）|
|-|-|-|
||`ls -l`|显示当前目录下的所有目录和文件 的**详细信息**（不包括隐藏文件）|
||`ll`|显示当前目录下的所有目录和文件 的**详细信息**（包括隐藏文件）|

## （3）创建目录
|序号|命令|作用|说明|
|:-:|:-|:-|:-:|
|1|`mkdir aaa`||
|2|`mkdir aaa/bbb`|在`aaa`目录下创建`bbb`目录|前提是`aaa`目录存在，否则无法创建|
|3|**`mkdir -p ccc/ddd`**|在`ccc`目录创建`ddd`目录|若`ccc`目录不存在则自动创建|

## （4）删除文件
|序号|命令|作用|说明|
|:-:|:-|:-|:-:|
||`rm 文件`|删除文件||
||`rm -f 文件`|删除文件（不询问）||
||``|||
||`rm -r 目录`|递归删除目录||
||`rm -rf 目录`|递归删除目录（不询问）||
||``|||
||`rm -rf *`|删除当前目录下的所有文件和目录（不询问）||

## （5）目录操作
|序号|命令|作用|说明|
|:-:|:-|:-|:-:|
||`mv aaa bbb`|重命名||
||`mv aaa/bbb .`|将aaa内的bbb目录移动至`当前目录`||
||``|||
||`cp -r -p aa bb`|`保持文件属性`把aa目录复制到bb目录下||
||`cp -r bbb ccc`|将bbb目录复制到ccc目录下||

## （6）`find`搜索目录
- `find /tmp -name 'a*`查找/tmp目录下所有以a开头的`文件和目录`



# 3、文件操作命令
- 新建文件
touch 文件名
- 查看文件

|命令|作用|
|:-:|:-:|
|`cat`|看最后一屏|
|`more`|百分比显示，内容比较多的文件只显示一部分，按`空格`后再继续显示|
|`less`|翻页查看|
|`tail`|指定行数或动态查看|

- 查看文件/文件夹权限
    - `ls -l`查看当前文件夹下所有的文件和文件夹的权限
    - `ls -ld`查看当前文件夹的权限

- 修改文件权限
    - `rwx`
        - `r`代表可读
        - `w`可写
        - `x`代表该文件是一个可执行文件
    - 举例
        - `aaa.txt`的文件权限是`-rw-------`
            - 一共`10位`
            - 第一位：`-`表示文件；`d`表示文件夹
            - 第一段（3位）：代表`拥有者的权限`
            - 第二段（3位）：代表`拥有者的所在的组，组员的权限`
            - 第三段（3位）：代表`其他用户的权限`
    - 修改权限(`chmod`或`8421法`)
        - 添加权限（给aaa.txt添加可执行权限）
            - chmod +x aaa.txt
        - 删除权限（给aaa.txt删除可执行权限）
            - chmod -x aaa.txt

    - 压缩文件
        - Windows下的文件压缩拓展名：`zip/rar`
        - Linux下
            - 打包文件：`aa.tar`
            - 压缩文件：`aa.gz`
            - 打包并压缩：`aa.tat.gz`
        - 命令：`tar -zcvf 打包压缩后的文件名 文件/文件夹 `
            - `z`调用gzip压缩命令进行压缩，指定压缩解压程序，不写的话系统会自动设定[“相关参考”](https://www.v2ex.com/t/370111)
            - `c`打包文件
            - `v`显示运行过程
            - `f`指定文件名
        - 举例
            - 打包该目录下所有的文件并指定文件名为`xxx.tar`
            - `tar -zcvf all.tar aa.txt bb.txt cc.txt`
            - 或者`tar -zcvf all.tar *`
    
    - 解压文件
        - 命令：`tar -zxvf 压缩文件`
        - `x`代表解压
        - 举例
            - 将all.tar解压到当前目录下
                - `tar -zxvf all.tar`
            - 将/usr/tmp下的all.tar解压到根目录
                - `tar -xvf all.tar -C /usr`




# 4、查找命令
- `grep`**文本搜索工具**
    - `ps -ef | grep ssh`查找指定ssh服务进程
    - `ps -ef | grep sshd | grep -v grep` 查找指定服务进程，排除`grep`自身
    - `ps -ef | grep sshd -c`查找指定进程，并计算个数
- `find`：在目录结构中查找搜索指定文件，并对文件执行指定操作
    - `find`：默认搜索`当前目录`及其`子目录`，并不过滤任何结果
    - `find . -name "*.log" -ls`在当前目录查找以`.log`结尾的文件，并显示`详细信息`
    - `find /root/ -perm 600`查找/root/目录下权限为600的文件
    - `find . -type f -name "*.log"`查找当前目录以.log结尾的普通文件
    - `find . -type d | sort`查找当前目录下所有文件夹/目录并排序
    - `find . -size +100M`查找当前目录下大与100M的文件
- `locate`
    - 快速的搜寻某个路径。
    - 默认每天更新一次，所以无法查询最新变动过的指令。
        - 解决方法:使用`update`方法手动更新数据库
    - 举例
        - `locate /etc/sh`搜索etc目录下以sh开头的文件
        - `locate pwd`查找和pwd相关的文件
- whereis
    - 定位`可执行文件`、`源代码文件`、`帮助文件`在文件系统中的位置。
    - 这些文件的属性应属于`原始代码、二进制文件、或是帮助文件`
- which
    - 在`PATH`变量指定的路径中，搜索某个系统命令的位置并返回`第一个`搜索结果
    - 举例
        - `which pwd`查找pwd命名所在路径
        - `which java`查找path中java的路径

# 5、`su`和`sudo`
`su`
    - 用户之间的切换。但是切换前的用户还保持登录状态。

|序号|命令|作用||
|:-:|:-|:-|-|
|1|`su test`|切换到test用户|路径还是root用户|
|2|`su -test`|切换到test用户|路径变成了/home/test|
|3|`su`|切换到root用户|路径还是原来的路径|
|4|`su -`|切换到root用户|路径变成了/root|
|5|`exit`|退出并返回之前的用户||

`sudo`
- sudo配置文件命令
    - `vi /etc/sudoers/visudo`




# 6、实验结果
```bash
tzy@MBK:~/实验一$ pwd
/home/tzy/实验一
tzy@MBK:~/实验一$ ifconfig
lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (本地环回)
        RX packets 17586049  bytes 4331914232 (4.3 GB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 17586049  bytes 4331914232 (4.3 GB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

wlp0s20f3: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 172.114.240.175  netmask 255.255.240.0  broadcast 172.114.255.255
        inet6 fe80::c23:1c3e:857:2722  prefixlen 64  scopeid 0x20<link>
        ether a0:51:0b:33:60:3a  txqueuelen 1000  (以太网)
        RX packets 2726907  bytes 3170397067 (3.1 GB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 1434396  bytes 207626956 (207.6 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

tzy@MBK:~/实验一$ mkdir test1 test2
tzy@MBK:~/实验一$ ls
test1  test2
tzy@MBK:~/实验一$ mv test1 temp1
tzy@MBK:~/实验一$ ls
temp1  test2
tzy@MBK:~/实验一$ mv temp1 test2
tzy@MBK:~/实验一$ ls
test2
tzy@MBK:~/实验一$ cd test2;ls
temp1
tzy@MBK:~/实验一/test2$ cp -r temp1 ../
tzy@MBK:~/实验一/test2$ cd ..;ls
temp1  test2
tzy@MBK:~/实验一$ ls
temp1  test2
tzy@MBK:~/实验一$ ls -a
.  ..  temp1  test2
tzy@MBK:~/实验一$ ls -l
总用量 8
drwxrwxr-x 2 tzy tzy 4096 4月  13 15:08 temp1
drwxrwxr-x 3 tzy tzy 4096 4月  13 15:08 test2
tzy@MBK:~/实验一$ rm -rf test2
tzy@MBK:~/实验一$ ls
temp1
tzy@MBK:~/实验一$ touch testFile.txt
tzy@MBK:~/实验一$ ls
temp1  testFile.txt
tzy@MBK:~/实验一$ vim testFile.txt
tzy@MBK:~/实验一$ cat testFile.txt
It's a test file
tzy@MBK:~/实验一$ more testFile.txt
It's a test file
tzy@MBK:~/实验一$ less testFile.txt
tzy@MBK:~/实验一$ tail testFile.txt
It's a test file
tzy@MBK:~/实验一$ less testFile.txt
tzy@MBK:~/实验一$ ls
temp1  testFile.txt
tzy@MBK:~/实验一$ tar -zcvf test.tar *
temp1/
testFile.txt
tzy@MBK:~/实验一$ ls
temp1  testFile.txt  test.tar
tzy@MBK:~/实验一$ grep -rn test
testFile.txt:1:It's a test file
tzy@MBK:~/实验一$ grep . -name "test*"
grep: 无效的最大计数
tzy@MBK:~/实验一$ find . -name "test*"
./test.tar
./testFile.txt
tzy@MBK:~/实验一$ find /etc -name profile | grep PS1
find: ‘/etc/ssl/private’: 权限不够
find: ‘/etc/polkit-1/localauthority’: 权限不够
find: ‘/etc/cups/ssl’: 权限不够
tzy@MBK:~/实验一$ sudo find /etc -name profile | grep PS1
[sudo] tzy 的密码： 
tzy@MBK:~/实验一$ sudo find /etc -name profile | grep PS1
tzy@MBK:~/实验一$ sudo find /etc -name profile | xargs grep PS1
/etc/profile:if [ "${PS1-}" ]; then
/etc/profile:    # The file bash.bashrc already sets the default PS1.
/etc/profile:    # PS1='\h:\w\$ '
/etc/profile:      PS1='# '
/etc/profile:      PS1='$ '
grep: /etc/dconf/profile: 是一个目录
tzy@MBK:~/实验一$ sudo find /etc -name profile | grep PS1
tzy@MBK:~/实验一$ ls
temp1  testFile.txt  test.tar
tzy@MBK:~/实验一$ tar -zcvf 实验一.tar.gz *
temp1/
testFile.txt
test.tar
tzy@MBK:~/实验一$ ls
实验一.tar.gz  temp1  testFile.txt  test.tar
tzy@MBK:~/实验一$ 
```