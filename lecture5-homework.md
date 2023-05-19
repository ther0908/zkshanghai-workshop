# 第5课 课后作业

## 第1题：  $KZG$ 多项式承诺方案在 $Setup$ 阶段涉及到计算对秘密评估点 $\tau$ 的幂的承诺，这被称为“可信设置”，通常在被称为“Powers of Tau”的仪式中利用多方计算生成。 假如说有一天，你在一张纸条上找到了 $\tau$ 的值。 你怎么能用它来制作一个假的 $KZG$ 证明呢？  
答：首先观察一个合法的证据 $\pi=commit(ck;q(x))=[q(\tau)]_{1}$，其中商多项式 $q(x)=\frac{f(x)-y}{x-z}$ 。  
那么如果知道了 $\tau$ 的值，可以声称一个任意的 $\overline{y}=f(z)$，并通过 $\overline{y}$计算得到 $\overline{q(\tau)}=\frac{f(\tau)-\overline{y}}{\tau-z}$，从而伪造一个证据 $\overline{\pi}=[\overline{q(\tau)}]_1$。Verifier执行 $verify(vk, C, z, \overline{y}, \overline{\pi})$时可以通过。

