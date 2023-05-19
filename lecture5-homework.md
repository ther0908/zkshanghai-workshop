# 第5课 课后作业

## 第1题：  $KZG$ 多项式承诺方案在 $Setup$ 阶段涉及到计算对秘密评估点 $\tau$ 的幂的承诺，这被称为“可信设置”，通常在被称为“Powers of Tau”的仪式中利用多方计算生成。 假如说有一天，你在一张纸条上找到了 $\tau$ 的值。 你怎么能用它来制作一个假的 $KZG$ 证明呢？  
答：首先观察一个合法的证据 $\pi=commit(ck;q(x))=\left[ q(\tau)\right]_1 $，其中商多项式 $q(x)=\frac{f(x)-y}{x-z}$ 。  
那么如果知道了 $\tau$ 的值，可以声称一个任意的 $\overline{y}=f(z)$，并通过 $\overline{y}$计算得到 $\overline{q(\tau)}=\frac{f(\tau)-\overline{y}}{\tau-z}$，从而伪造一个证据 $\overline{\pi}=[\overline{q(\tau)}]_1$。Verifier执行 $verify(vk, C, z, \overline{y}, \overline{\pi})$时可以通过。

## 第2题： 从 $KZG$ 多项式承诺方案构造一个向量承诺方案。  
答：对于一个向量 $\vec{m}=(m_1,m_2,...,m_q)$使用Lagrange多项式插值构造一个多项式 $I(X)=\sum_{i\in \left[1,q \right]}m_i\cdot \prod_{j\neq i,j\in \left[1,q \right]}\frac{X-j}{i-j}$，然后对多项式 $I(X)$使用 $KZG$生成证明。

## 第3题： 扩展 $KZG$多项式承诺方案，产生多重证明 $\pi$，对于多个点值有 $p(x_i)=y_i$。  
