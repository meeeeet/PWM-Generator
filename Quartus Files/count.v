module count(clk,out);
input clk;
output [3:0]out;

reg [3:0]cnt;
initial begin
	cnt=4'b1111;
end

always @(negedge clk) begin
	cnt=cnt+1;
end

assign out=cnt;
endmodule

