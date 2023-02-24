`timescale 1ns/1ns
module tb_clk;
wire clk,clk2;
reg inc1,inc0,dec1,dec0;
reg clkin,reset;
wire [7:0]d;
wire [0:6]d0,d1,d2,d3;
clkduty uut(clkin,inc0,inc1,dec0,dec1,reset,clk,clk2,d,d0,d1,d2,d3);

initial begin
    clkin=0;
    reset=1;
    inc1=1; inc0=1;
    dec1=1; dec0=1;
    #1 reset=0;
    #1 reset=1; 
    forever begin
        #10 clkin=~clkin;
    end
end

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0,tb_clk);

    #5 inc1=0;
    #1 inc1=1;

    #10 inc1=0;
    #1 inc1=1;

    // #10 inc1=0;
    // #1 inc1=1;

    // #10 inc0=0;
    // #1 inc0=1;

    // #10 inc0=0;
    // #1 inc0=1;

    // #10 inc0=0;
    // #1 inc0=1;

#10 inc0=0;
    #1 inc0=1;

#10 inc0=0;
    #1 inc0=1;

// #10 inc0=0;
//     #1 inc0=1;

    // #3000 inc=0;
    // #1 inc=1;
    // #1 inc=0;
    // #1 inc=1;
    



    #10000 $finish;
end

initial begin
    #9000 reset=0;
    #1 reset=1;
end


endmodule