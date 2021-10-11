module lab2_3(clk,rst_n,out);
    input clk,rst_n;
    output out;
    reg [5:0] F;
    always@(posedge clk)begin
        if(rst_n==1'b0) F=6'b000001;
        else F={F[4:0],F[5]^F[0]};
    end
    assign out=F[5];
endmodule
