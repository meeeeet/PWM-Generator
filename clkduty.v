module clkduty(
    input clkin, //input frequency-50MHz
    input inc,  //increase duty cycle of 2%
    input inc1,  //increase duty cycle of 10%
    input dec,   //decrease duty cycle of 2%
    input dec1,  //decrease duty cycle of 10%
    input reset,  //reset all settings
    output clk,  //output signal with 1Mhz
	//interfacing with seven segment display
    output [0:6]D0,
    output [0:6]D1,
    output [0:6]D2,
    output [0:6]D3,
	//for verification
    output [7:0]d

);


reg [7:0]count=8'd0;
reg [7:0]duty;
assign clk= (count<duty)? 1:0;
assign d=duty; //for verification


DISPLAY d1(duty,D0,D1,D2,D3); //display


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


/* ------------------------- variation in duty cycle ------------------------ */
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
        duty<=duty+8'd5;
    end
	 else
		duty<=duty;
end
endmodule


/* ------------------- interfacing with seven seg. display ------------------ */
module DISPLAY (
    input [7:0]duty,
    output reg [0:6]d0,
    output reg [0:6]d1,
    output [0:6]d2,
    output [0:6]d3
);

reg [7:0]d_part[2:0];
always @(*) begin
    d_part[2]=((duty*2)%1000)/100;
    d_part[1]=((duty*2)%100)/10;
    d_part[0]=(duty*2)%10;
end

always @(d_part[0]) begin
    case(d_part[0])
        8'd0 : d0 = 7'b0000001;
        8'd1 : d0 = 7'b1001111;
        8'd2 : d0 = 7'b0010010; 
        8'd3 : d0 = 7'b0000110;
        8'd4 : d0 = 7'b1001100; 
        8'd5 : d0 = 7'b0100100; 
        8'd6 : d0 = 7'b0100000; 
        8'd7 : d0 = 7'b0001111; 
        8'd8 : d0 = 7'b0000000;
        8'd9 : d0 = 7'b0000100; 
        default: d0 = 7'b1111111;
    endcase
end

always @(d_part[1]) begin
    case(d_part[1])
        8'd0 : d1 = 7'b0000001;
        8'd1 : d1 = 7'b1001111;
        8'd2 : d1 = 7'b0010010; 
        8'd3 : d1 = 7'b0000110;
        8'd4 : d1 = 7'b1001100; 
        8'd5 : d1 = 7'b0100100; 
        8'd6 : d1 = 7'b0100000; 
        8'd7 : d1 = 7'b0001111; 
        8'd8 : d1 = 7'b0000000;
        8'd9 : d1 = 7'b0000100; 
        default: d1 = 7'b1111111;
    endcase
end

assign d2= (d_part[2]==1)? 7'b1001111 : 7'b1111111;
assign d3=7'b1111111;

endmodule

