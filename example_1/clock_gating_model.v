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
module clock_gating_model(
	input wire i_clk,
	input wire i_clk_en,
	output wire o_clk
);
assign o_clk = i_clk & i_clk_en;
endmodule