module clkduty(
    input clkin,
   // input reset,
    input inc,
	 input inc1,
	 input dec1,
    input dec,
    input reset,
    output clk,
    output [7:0]d
);


reg [7:0]count=8'd0;
reg [7:0]duty;
assign clk= (count<duty)? 1:0;

assign d=count; 

always @(negedge clkin or negedge reset) begin
    if(reset==0) begin
        count<=8'd0;
    end

    else if (count== 8'd49) begin
        count<=8'd0;
    end

    else
        count<=count+1'd1;
end


always @(negedge inc,negedge inc1, negedge dec1, negedge dec, negedge reset) begin
    if (reset==1'b0) duty<=8'd0;
	 
    else if (inc==1'b0) begin
        duty <= duty+8'd1;
    end

    else if(dec==1'b0)begin
        duty<=duty-8'd1;
    end
	 
	 else if(dec1==1'b0)begin
        duty<=duty-8'd5;
    end
	 
	 else if(inc1==1'b0)begin
        duty<=duty-8'd5;
    end
	 else
		duty<=duty;
end
endmodule

