module lab2_2(clk,rst_n,en,dir,gray,cout);
    input clk,rst_n,en,dir;
    output [7:0] gray;
    output cout;
    wire tmpcout;
    counter_1 first(.clk(clk),.rst_n(rst_n),.en(en),.dir(dir),.gray(gray[3:0]),.cout(tmpcout));
    counter_1 second(.clk(clk),.rst_n(rst_n),.en(tmpcout),.dir(dir),.gray(gray[7:4]),.cout(cout));
endmodule
module counter_1(dir,clk,en,cout,gray,rst_n);
    input dir,clk,rst_n,en;
    output cout;
    output [3:0] gray;
    reg [3:0] bnum;
    wire cout;
    reg [3:0] before;
    reg g1,g2,g3;
    reg [3:0] gray;
    assign cout=((en==1'b1 && dir==1'b1 && gray==4'b1000)||(en==1'b1 && dir==1'b0 && gray==4'b0000))?1'b1:1'b0;
    always@(negedge clk or negedge rst_n)
        begin
        bnum={before[3],
        before[3]^before[2],
        before[3]^before[2]^before[1],
        before[3]^before[2]^before[1]^before[0]};
        if(rst_n==4'b0000) begin
            gray=4'b0000;
            bnum=4'b0000;
        end
        else
        begin
            if(en==1'b0) begin
                gray=before;
                bnum = bnum;
                //cout = 1'b0;
            end
            else
                begin
                if(dir==1'b1)
                    begin
                    if(bnum==4'b1111)
                        begin
                        bnum=4'b0000;
                        gray=4'b0000;
                        //cout=1'b1;
                        end
                    else
                        begin
                        //cout=1'b0;
                        bnum=bnum+1;
                        g3=bnum[3]^bnum[2];
                        g2=bnum[2]^bnum[1];
                        g1=bnum[1]^bnum[0];
                        gray={bnum[3],g3,g2,g1};
                        end
                    end
                else
                    begin
                    if(bnum==4'b0000)
                        begin
                            bnum=4'b1111;
                            gray=4'b1000;
                            //cout=1'b1;
                        end
                    else
                        begin
                            //cout=1'b0;
                            bnum=bnum-1;
                            g3=bnum[3]^bnum[2];
                            g2=bnum[2]^bnum[1];
                            g1=bnum[1]^bnum[0];
                            gray={bnum[3],g3,g2,g1};
                        end
                    end
                end
            end
        before=gray;
        end
endmodule
