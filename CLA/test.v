/*
    ans:
    00000000000000000000000000000011
*/

`include "LCA.v"

module top_module();
    reg     [31:0]      in0;
    reg     [31:0]      in1;
    wire    [31:0]      sum;

    initial begin
        assign in0 = 4'b1110;
        assign in1 = 4'b1101;
    end

    Add a(
        .a          (in0),
        .b          (in1),
        .sum        (sum)
    );

    always @(*) begin
        $display("sum:%b", sum);
    end
endmodule