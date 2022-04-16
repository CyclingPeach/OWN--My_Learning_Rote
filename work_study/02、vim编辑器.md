## 1、概述(Profile?)

## 2、Vim使用

**Three Modes**
- Command Mode
- Insert Mode
- Last line Mode

#### （1）Command Mode
用户一启动Vim，便会进入Command Mode。此状态下敲击键盘动作会被vim识别为命令，而非输入字符
- 常用命令
    - `i`切换到Insert Mode
    - `x`删除当前光标所在处的字符
    - `:`切换到Last line Mode，以在最后一行输入命令
#### （2）Insert Mode
在Insert Mode，可以使用以下按键：
- `ESC`退出Insert Mode，切换到Command Mode
- `insert`切换光标为输入/替换模式，光标由`|`变为`_`
- `HOME/END`光标移动到行首/行尾（`行`）
- `Page Up/Page Down`上下翻页
- 字符按键以及Shift组合，输入字符
- `Enter`、`Back Space`、`Del`

#### （3）Last line Mode
- 在Command Mode下按`:`进入Last line Mode
- 在Last line Mode下按`ESC`进入Command Mode
- 基本命令
    - `q`
    - `w`
    - `wq`
    - `wq!`强制保存并退出
