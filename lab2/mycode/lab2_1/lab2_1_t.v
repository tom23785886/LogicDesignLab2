module lab2_1_t;
    reg clk,rst_n,en,dir,in;
    reg [3:0] data;
    wire [3:0] out;
    
    lab2_1 counter1(.out(out),.clk(clk),.rst_n(rst_n),.en(en),.dir(dir),.in(in),.data(data));
    always #5 clk=~clk;
    initial begin
    clk=1'b0;
    rst_n=1'b1;
    en=1'b0;
    dir=1'b1;
    in=1'b1;
    data=4'b1000;

    #10 rst_n=1'b0;
    #50 rst_n=1'b1;
    #50 en=1'b1;
    #60 in=1'b0;
    #200 dir=1'b0;
    #500 $finish;
    end
endmodule