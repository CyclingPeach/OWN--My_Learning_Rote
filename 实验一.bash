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