// A frequency divider module

module freqdiv(out, clk, reset);

    // Clock period muliplier
    parameter [31:0] N = 2;

    output reg out = 1'b0;;
    input wire clk, reset;

    // Internal counter
    // Note: This must be of the same type as the parameter N
    //       (unsigned int). If you declare it to be an integer
    //       it is signed twos-complement and therefore logical
    //       comparison with N will always return false!
    reg [31:0] pcount = 32'b0;
    reg [31:0] ncount = 32'b0;
    reg [31:0] count = 32'b0;
        
//    always @ (posedge clk)
//        if (reset)
//            pcount <= 0;
//        else if (pcount == N-1)
//            pcount <= 0;
//        else
//            pcount <= pcount + 1;

//    always @ (negedge clk)
//        if (reset)
//            ncount <= 0;
//        else if (ncount == N-1)
//            ncount <= 0;
//        else
//            ncount <= ncount + 1;

	always @ (clk) 
	 begin
	    ncount <= ncount + 1;
	  if (reset)
	   begin
            ncount <= 0;
            out <= 1'b0;
	   end
	  else if (ncount <= N-1) 
            out <= 1'b1;
          else if (ncount < 2*N-1) 
	    out <= 1'b0;
	  else
            ncount <= 0;
	 end
   
    // Slow positive edge period counter
	 //always @ (posedge clk or negedge clk) begin
//	 always @ (clk) begin
//			count <= pcount + ncount;
//			out <= count < N-1 && !reset;
//	 end

endmodule
