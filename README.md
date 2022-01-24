# My_Learning_Rote
This is my first repository【我的第一个资料库，仅用来记录我的学习过程，刚开始学有很多不足，错误比较多，无法提供正确的借鉴。欢迎大家的指正！】
**【本题正确答案】**
**BFS**

```Python



'''
两个四位数 数字，由一个变成另外一个
但是 一次只能变一位数字，且每次变完之后的四位数为质数
求一共要变几次
'''
# 将数字转换为数字列表
def trans_int_to_list(num_str):
    num_list = [int(i) for i in str(num_str)]   # [1, 0, 3, 3]
    # print(num_list)
    return num_list

# 将字符串转换为数字
def trans_list_to_int(num_list):
    num_str = 1000 * num_list[0] + 100 * num_list[1] + 10 * num_list[2] + num_list[3]   # 1033
    # print(num_str, type(num_str))
    return num_str

# 质数判断
def prime_judge(num):
    for j in range(2, num):
        if num % j == 0:
            return False
            break
    else:
        return True

a = 1033
b = 8079

def test():
    global a
    trans = []
    trans_index = {}
    if prime_judge(a) == True:
        trans.append(a)
    for i in range(3,-1,-1):
        # 将a 和 b转换为列表
        a_l = trans_int_to_list(a)
        b_l = trans_int_to_list(b)
        print('====================================')
        print('变换前的值：',a)
        new_a_l = a_l
        new_a_l[i] = b_l[i]
        new_a_i = trans_list_to_int(new_a_l)
        print('变换后的值：',new_a_i)
        # 判断是否为质数
        if prime_judge(new_a_i) == True:    # 是质数
            print('{}是质数'.format((new_a_i)))
            print('变换的是第{}个位置的数字，将{}变成{}'.format(i+1, str(a)[i], b_l[i]))
            trans_index[i+1] = [int(str(a)[i]), b_l[i]]
            if new_a_i not in trans:
                trans.append(new_a_i)
            a = new_a_i
        else:   # 不是质数
            print('{}不是质数'.format((new_a_i)))
            print('a这时候的值为：', a)
    print(trans)
    print(trans_index)
test()


```
