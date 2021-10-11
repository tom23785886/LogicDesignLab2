module lab2_1(clk,rst_n,en,dir,in,data,out);
    input clk,rst_n,en,dir,in;
    input [3:0] data;
    output [3:0] out;
    reg [3:0] out;
    always@(posedge clk)
        begin
            casex({rst_n,en,in,dir})
                4'b0xxx: out={4{1'b0}};
                4'b10xx: out=out;
                4'b1101: out=(out==4'b1111)?4'b0000:out+1'b1;
                4'b1100: out=(out==4'b0000)?4'b1111:out-1'b1;
                4'b111x: out=data;
            endcase
        end
endmodule