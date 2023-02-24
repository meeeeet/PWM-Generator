module clkduty(
    input clkin,
   // input reset,
    input inc0, inc1,
    input dec0, dec1,
    input reset,
    output clk,clk2,
    output [6:0]d,
    output [0:6]d0,d1,d2,d3
);


reg [6:0]count=7'd0;
reg [6:0]duty;
assign clk= (count<duty)? 1:0;
assign d=duty; 

sevensegdis dis(d,d0,d1,d2,d3);
clkdiv2 clock2(clk,clk2,reset);


always @(negedge clkin or negedge reset) begin
    if(reset==0) begin
        count<=7'd0;
    end

    else if (count== 7'd24) begin
        count<=7'd0;
    end

    else
        count<=count+1'd1;
end


always @(negedge inc1 or negedge dec1 or negedge reset) begin
    if (reset==1'b0) duty<=7'd0;
	 
    if (inc1==1'b0) begin
        duty <= duty+7'd5;
    end

    if(dec1==1'b0)begin
        duty<=duty-7'd5;
    end
end

always @(negedge inc0 or negedge dec0) begin	 
    if (inc0==1'b0) begin
        duty <= duty+7'd1;
    end

    if(dec0==1'b0)begin
        duty<=duty-7'd1;
    end
end
endmodule



module clkdiv2(in,clk,reset);
input in,reset;
output reg clk;

always @(negedge in or negedge reset) begin
    if(reset==0) clk=0;
    else
        clk=~clk;
end
endmodule



module sevensegdis(
    in,
    d0,d1,d2,d3
);
input [6:0]in;
output reg [0:6] d0;
output reg [0:6] d1;
output reg [0:6] d2;
output reg [0:6] d3;

always @ (*)
begin
    case(in)

        7'd0: begin
            d0=7'b 0000001;
            d1=7'b 1111111;
            d2=7'b 1111111;
            d3=7'b 1111111;
        end

        7'd10: begin
            d0=7'b 0000001;
            d1=7'b 1001111;
            d2=7'b 1111111;
            d3=7'b 1111111;
        end

        7'd20: begin
            d0=7'b 0000001;
            d1=7'b 0010010;
            d2=7'b 1111111;
            d3=7'b 1111111;
        end

        7'd30: begin
            d0=7'b 0000001;
            d1=7'b 0000110;
            d2=7'b 1111111;
            d3=7'b 1111111;
        end
        7'd40: begin
            d0=7'b 0000001;
            d1=7'b 1001100;
            d2=7'b 1111111;
            d3=7'b 1111111;
        end

        7'd50: begin
            d0=7'b 0000001;
            d1=7'b 0100100;
            d2=7'b 1111111;
            d3=7'b 1111111;
        end
        7'd60: begin
            d0=7'b 0000001;
            d1=7'b 0100000;
            d2=7'b 1111111;
            d3=7'b 1111111;
        end
        7'd70: begin
            d0=7'b 0000001;
            d1=7'b 0001111;
            d2=7'b 1111111;
            d3=7'b 1111111;
        end
        7'd80: begin
            d0=7'b 0000001;
            d1=7'b 0000000;
            d2=7'b 1111111;
            d3=7'b 1111111;
        end
        7'd90: begin
            d0=7'b 0000001;
            d1=7'b 0000100;
            d2=7'b 1111111;
            d3=7'b 1111111;
        end
        7'd100: begin
            d0=7'b 0000001;
            d1=7'b 0000001;
            d2=7'b 0011111;
            d3=7'b 1111111;
        end
        default: begin
            d0=7'b 1111110;
            d1=7'b 1111110;
            d2=7'b 1111110;
            d3=7'b 1111110;
        end
    endcase
end
endmodule
