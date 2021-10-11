//`timescale 1ns/100ps
module lab2_1_t;
    reg clk,rst_n,en,dir,in;
    reg [3:0] data;
    wire [3:0] out;
    reg pass;
    reg lastout;
    reg i,j,k,t;
    
    lab2_1 counter1(.out(out),.clk(clk),.rst_n(rst_n),.en(en),.dir(dir),.in(in),.data(data));
    always #5 clk=~clk;
    initial begin
        clk<=1'b0;
        pass<=1'b1;
        data=4'b1010;
        #10 {rst_n,en,in,dir}=4'b0000;
        #10 if(out!=4'b0000) printerror;
        lastout=out;

        #10 {rst_n,en,in,dir}=4'b0001;
        #10 if(out!=4'b0000) printerror;
        lastout=out;

        #10 {rst_n,en,in,dir}=4'b0010;
        #10 if(out!=4'b0000) printerror;
        lastout=out;

        #10 {rst_n,en,in,dir}=4'b0011;
        #10 if(out!=4'b0000) printerror;
        lastout=out;

        #10 {rst_n,en,in,dir}=4'b0100;
        #10 if(out!=4'b0000) printerror;
        lastout=out;

        #10 {rst_n,en,in,dir}=4'b0101;
        #10 if(out!=4'b0000) printerror;
        lastout=out;

        #10 {rst_n,en,in,dir}=4'b0110;
        #10 if(out!=4'b0000) printerror;
        lastout=out;

        #10 {rst_n,en,in,dir}=4'b0111;
        #10 if(out!=4'b0000) printerror;
        lastout=out;

        #10 {rst_n,en,in,dir}=4'b1000;
        #10 if(out!=lastout) printerror;
        lastout=out;

        #10 {rst_n,en,in,dir}=4'b1001;
        #10 if(out!=lastout) printerror;

        #10 {rst_n,en,in,dir}=4'b1010;
        #10 if(out!=lastout) printerror;

        #10 {rst_n,en,in,dir}=4'b1011;
        #10 if(out!=lastout) printerror;

        #10 {rst_n,en,in,dir}=4'b1100;
        #10 if(out!=lastout-1'b1) printerror;

        #10 {rst_n,en,in,dir}=4'b1101;
        #10 if(out!=lastout+1'b1) printerror;

        #10 {rst_n,en,in,dir}=4'b1110;
            #100 if(out!=data) printerror;

        #10 {rst_n,en,in,dir}=4'b1111;
            #100 if(out!=data) printerror;
        
        if (pass===1'b1)
        $display(">>>> [PASS] Congratulations!");
        else
        $display(">>>> [ERROR] Try it again!");
        #100 $finish;
        end
    task printerror;
        begin
            pass = 1'b0;
            $display($time,"Error: clk=%b,rst_n=%b,en=%b,in=%b,dir=%b,data=%b,out=%b"
            ,clk,rst_n,en,dir,in,data,out);
        end
    endtask
endmodule