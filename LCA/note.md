# 超前进位加法器
在RCA基础上优化改进carry关键路径。消除前后位carry间的依赖关系。



RCA中


$$
\left\{ \begin{array}{rcl}
S=a\oplus b\oplus c_{in} \\
c_{out}=ab+c_{in}(a\oplus b)
\end{array}\right.
$$
定义$P:=a\oplus b,G=ab$（类似一个半加器），将公式重写。
$$
\left\{ \begin{array}{rcl}
S_{i}=P_i\oplus c_{i-1}\\
c_{i}=G_i+c_{i-1}P_i\\
c_0=c_{in}\\
c_{out}=c_{n}
\end{array}\right.
$$


```verilog
	//把c当做进位，c[0]=0情况下
	c[0] = G[0];
    c[1] = G[1] + 
            (G[0] & P[1]);
    c[2] = G[2] + 
            (G[1] & P[2]) + 
            (G[0] & P[1] & P[2]);
    c[3] = G[3] + 
            (G[2] & P[3]) +
            (G[1] & P[2] & P[3]) +
            (G[0] & P[1] & P[2] & P[3]);
    c[4] = G[4] + 
            (G[3] & P[4]) +
            (G[2] & P[3] & P[4]) +
            (G[1] & P[2] & P[3] & P[4]) +
            (G[0] & P[1] & P[2] & P[3] & P[4]);
```



简图（1-based）

<img src="F:\repo\Adder\LCA\LCA.jpg" style="zoom:30%;" />



