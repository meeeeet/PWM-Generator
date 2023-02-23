module clkduty(
    input clkin,
   // input reset,
    input inc,
    input dec,
    input reset,
    output clk,
    output [7:0]d
);


reg [7:0]count;
reg [7:0]duty;
assign clk= (count<duty)? 1:0;

assign d=duty; 

always @(negedge clkin or negedge reset) begin
    if(reset==0) begin
        count=8'd0;
        duty=8'd0;
    end

    else if (count== 8'd49) begin
        count=8'd0;
    end

    else
        count=count+1'd1;
end


always @(negedge inc or negedge dec) begin

    if (inc==0) begin
        duty=duty+8'd5;
    end

    if(dec==0)begin
        duty=duty-8'd5;
    end
end

endmodule
