`define gray0 4'b0000
`define gray1 4'b0001
`define gray2 4'b0011
`define gray3 4'b0010
`define gray4 4'b0110
`define gray5 4'b0111
`define gray6 4'b0011
`define gray7 4'b0010
`define gray8 4'b1100
`define gray9 4'b1101
`define gray10 4'b1111
`define gray11 4'b1110
`define gray12 4'b1010
`define gray13 4'b1101

module one_digit_gray(clk,rst_n,en,dir,gray,cout);
    input clk,rst_n,en,dir;
    output [3:0] gray;
    output cout;
    reg nowstate=4'b0000;
    reg nextstate;
    reg tmpgray;
    reg precout;
    reg cout;
    always@(negedge clk)
        begin
            precout=cout;
           if(rst_n==1'b0)
            begin
                tmpgray=4'b0000;
            end
            else
            begin
                if(en==1'b0) cout=precout;
                else if(en==1'b1) cout=(dir==1'b1) 
            end
        end
endmodule
module my_DFF(D,clk,Q);
    input D;
    input clk;
    output Q;
    always@(negedge clk)
        begin
            Q<=D;
        end
endmodule