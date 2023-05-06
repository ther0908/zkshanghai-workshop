# 第3课 课后作业

## 第1题 二次非剩余的证明
 
完备性：如果 $QR(m,x)=0$，当 $b=0$时，verifier向Prover发送 $y=s^{2}x$。因为$QR(m,x)=0$，所以$QR(m,s^{2}x)=0$，Prover返回0；当 $b=1$时，verifier向Prover发送 $y=s^{2}$。存在s使得 $s^{2}=s^{2}(mod\quad m)$，因此Prover返回1。综上，系统具有完备性。  
可靠性：如果 $QR(m,x)=1$，当Prover遵守协议时，Verifier总是以 $1/2$ 的概率拒绝；若Prover不遵守协议时，由于 $s^{2}x$ 和 $s^{2}$ 在Prover眼中并无区别，Verifier总是以 $1/2-negl$ 的概率拒绝。  

## 第2题 二次剩余的证明
完备性：当 $b=0$ 时，Prover向Verifier发送 $u=t$，Verifier计算 $u^{2}x=t^{2}x=y$，因此Verifier接受；当 $b=1$ 时，Prover向Verifier发送 $u=st$，Verifier计算 $u^{2}=(st)^{2}=t^{2}x=y$，因此Verifier接受。  
可靠性：如果 $QR(m,x)=0$ 时或者 $QR(m,x)=1$ 但是Prover不知道有效的s时，
