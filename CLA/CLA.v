/*
    Problem:
    https://acm.sjtu.edu.cn/OnlineJudge/problem?problem_id=1250
 
    任务：掌握组合逻辑，完成一个加法器。
*/

module Add(
        input       [31:0]          a,
        input       [31:0]          b,
        output reg  [31:0]          sum
    );

    reg [31:0] P;
    reg [31:0] G;
    reg [31:0] c;
    reg [0:0] tmp;//暂用的接线

    always @(*)begin
        //calculate P,G
        P = a ^ b;
        G = a & b;
        
        //calculate carry
        for (integer i = 0;i < 32;i = i + 1) begin
            c[i] = G[i];
            for (integer j = i - 1;j >= 0;j = j - 1) begin
                tmp = G[j];
                for (integer k = j + 1;k <= i;k = k + 1) begin
                    tmp= tmp & P[k];
                end
                c[i] = c[i] + tmp;
            end
        end

        sum = P ^ (c<<1);
    end

endmodule