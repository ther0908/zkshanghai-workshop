# 第2课 课后作业

## 第1题 将十进制数字转化为二进制表示

- 参数：`nBits`
- 输入信号：`in`
- 输出信号：`b[nBits]`

解决方案见[Numbits.circom](/Lecture2_Code/NumBits.circom)

## 第2题 判零

- 参数：无
- 输入信号：`in`
- 输出信号：`out`

解决方案见[isZero.circom](/Lecture2_Code/isZero.circom)

## 第3题 判断是否相等

- 参数：无
- 输入信号：`in[2]`
- 输出信号：`out`

解决方案见[isEqual.circom](/Lecture2_Code/isEqual.circom)


## 第4题 选择器

- 参数：`nChoices`
- 输入信号：`in[nChoices], index`
- 输出信号：`out`

解决方案见[Selector.circom](/Lecture2_Code/Selector.circom)

## 第5题 判负

- 参数：无
- 输入信号：`in`
- 输出信号：`out`

解决方案见[IsNegative.circom](/Lecture2_Code/IsNegative.circom)
- 扩展问题：为什么我们不能使用LessThan  
答：如果使用LessThan，当`in[0] > in[1]时`，计算`del_val.in <== in[0] - in[1] + (1<<252)`时会发生溢出，最高位可能会变成0。

## 第6题 少于

- 参数：无
- 输入信号：`in[2]`
- 输出信号：`out`

扩展问题2：解决方案见[LessThan.circom](/Lecture2_Code/LessThan.circom)，包含LessThan、LessEqThan、GreaterThan、GreaterEqThan。
