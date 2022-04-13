# Linux基础——Linux常用命令

`.bashrc`主要是配置环境变量
如果不想每次开机都执行一次的命令，大多可以配在这里，启动终端自动生效
- `vi ~/.bashrc`


我电脑默认的PS1值为：
```bash
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt
```