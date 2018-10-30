`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2016 09:09:21 AM
// Design Name: 
// Module Name: bench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module bench;

reg tms = 0;
always #5 tms =~tms;

reg [3:0] state=4'b1111;
wire [3:0] state_nxt;

jtag_fsm1 
jtag_fsm1_ins(
	.state(state),
	.tms(tms),
	.state_nxt(state_nxt)
	);

initial
      begin
        repeat (1000) @(posedge tms);
        $finish;
      end

endmodule