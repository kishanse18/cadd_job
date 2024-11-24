module hi(
    input [7:0] A,
    input [7:0] B,
    input Cin,
    output [7:0] S,
    output Cout
);
    wire [3:0] sum0, sum1;
    wire carry0, carry1, adjust0, adjust1;
    assign {carry0, sum0} = A[3:0] + B[3:0] + Cin;
    assign adjust0 = (sum0 > 4'd9) ? 1'b1 : 1'b0;
    assign S[3:0] = adjust0 ? (sum0 + 4'd6) : sum0;
    assign carry1 = carry0 | adjust0;
    assign {carry1, sum1} = A[7:4] + B[7:4] + carry1;
    assign adjust1 = (sum1 > 4'd9) ? 1'b1 : 1'b0;
    assign S[7:4] = adjust1 ? (sum1 + 4'd6) : sum1;
    assign Cout = carry1 | adjust1;
endmodule
