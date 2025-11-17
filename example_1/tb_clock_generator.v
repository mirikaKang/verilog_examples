//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: david.kang
//
// Create Date:
// Design Name: clock_gating_model
// Module Name: clock_gating_model
// Project Name:
// Target Devices:
// Tool Versions:
// Description: 
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ps

module tb_clock_generator;
reg clk;
reg clk_en;
wire o_clk;

always 
	#5 clk =~clk;

initial begin
$display("intialize value [%d]",$time);
	clk <= 0;
	clk_en <=0;
#100
$display("clock On [%d]",$time);
	clk_en <=1;
#100
$display("clock Off [%d]",$time);
	clk_en <=0;
#100
$display("Finish! [%d]",$time);
$finish;
end

clock_gating_model DUT(
	.i_clk ( clk),
	.i_clk_en( clk_en),
	.o_clk ( o_clk)
);

endmodule