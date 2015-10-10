`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: MIT
// Engineer: jpnewman snail mit dot edu
// 
// Clock divide by N module
//
//////////////////////////////////////////////////////////////////////////////////
module ClkDivider (reset, reference_clk, clk_div);

// Parameter and IO Specification
parameter N = 1000;
input reset, reference_clk;
output reg clk_div;

// 32-bit clock counter
reg [31:0] count = 0;

always @ (posedge reference_clk, posedge reset) begin

	if (reset == 1'b1) begin
		count <= 32'd0;
		clk_div <= 1'b0;
	end
	else if (count == N - 1) begin
        count <= 32'b0;
		  clk_div <= ~clk_div;
		  end
   else
        count <= count + 1;
		  //clk_div <= clk_div;
end

endmodule
