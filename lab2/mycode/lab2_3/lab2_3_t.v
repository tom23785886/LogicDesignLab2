module lab2_3_t;
    reg clk,rst_n;
    wire out;
    lab2_3 LFSR(.out(out),.clk(clk),.rst_n(rst_n));
    always #5 clk=~clk;
    initial begin
        clk=1'b0;
        rst_n=1'b0;
        #10 rst_n=1'b1;
        #200 $finish;
    end
endmodule