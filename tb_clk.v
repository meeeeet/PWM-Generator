`timescale 1ns/1ns
module tb_clk;
wire clk;
reg inc,dec;
reg clkin,reset;
wire [7:0]d;
clkduty uut(clkin,inc,dec,reset,clk,d);

initial begin
    clkin=0;
    reset=1;
    inc=1;
    dec=1;
    #1 reset=0;
    #1 reset=1; 
    forever begin
        #10 clkin=~clkin;
    end
end

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0,tb_clk);

    #5 inc=0;
    #1 inc=1;

    #10 inc=0;
    #1 inc=1;

    #10 inc=0;
    #1 inc=1;

    #10 inc=0;
    #1 inc=1;

    #10 inc=0;
    #1 inc=1;

    #3000 inc=0;
    #1 inc=1;
    



    #10000 $finish;
end

initial begin
    #9000 reset=0;
    #1 reset=1;
end


endmodule