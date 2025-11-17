//////////////////////////////////////////////////////////////////////////////////
// Company: Personal
// Engineer: Matbi / Austin
//
// Create Date:
// Design Name: tb_d_ff
// Module Name: tb_d_ff
// Project Name:
// Target Devices:
// Tool Versions:
// Description: sync / async reset test in d_ff
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ps

module tb_d_ff_module;

reg clk;
reg clk_enable;
reg sync_reset;
reg async_reset;
reg async_reset_n;

reg i_value;

always
	#5 clk = ~clk;

initial begin
	$display("initialize value [%d]", $time);
	$display("No input clock [%d]", $time);
	clk <=0;
	clk_enable <=0;
	sync_reset <=0;
	async_reset <=0;
	async_reset_n <=1;

	i_value <=1;

#50
	$display("Async Reset [%d]", $time);
	sync_reset		<= 1;
	async_reset		<= 1;
	async_reset_n 	<= 0;
#10
	$display("initialize value [%d]", $time);
	sync_reset		<= 0;
	async_reset		<= 0;
	async_reset_n 	<= 1;
#10
	$display("Input clock [%d]", $time);
	clk_enable		<= 1; // input clk
#10
	$display("Sync Reset [%d]", $time);
	sync_reset		<= 1;
#10
	sync_reset		<= 0;
#50
	$display("Finish! [%d]", $time);
$finish;
end

wire  clk_for_dut = clk & clk_enable;

d_ff_module DUT(
	.clk (clk_for_dut),
	.sync_reset(sync_reset),
	.async_reset(async_reset),
	.async_reset_n(async_reset_n),

	.i_value(i_value),
	.o_value_sync_reset(),
	.o_value_async_reset(),
	.o_value_async_reset_n(),
	.o_value_mixed_reset(),
	.o_value_no_reset()
);
endmodule
