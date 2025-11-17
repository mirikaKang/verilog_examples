//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: david.kang
//
// Create Date:
// Design Name: 
// Module Name: 
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

module tb_clk_generator;
reg clk;


always 
	#5 clk = ~clk;

initial begin
$display("intial value[%d]",$time);
	clk <= 0;
$display("Start! [%d]",$time);
#100
$display("Finish! [%d]",$time);
$finish;
end
	
endmodule