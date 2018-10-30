`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2016 08:59:54 AM
// Design Name: 
// Module Name: jtag_fsm1
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


module jtag_fsm1(
	input [3:0] state,
	input tms,
	output [3:0] state_nxt
    );
wire a,b,c,d,a_nxt,b_nxt,c_nxt,d_nxt;
assign {d,c,b,a} = state[3:0]; //a:0,b:1,c:2,d:3
assign a_nxt=(~tms& ~c & a)|(tms &~b)|(tms & ~a)|(tms& d & c);
assign b_nxt=(~tms& b & ~a)|(~tms&~c)|(~tms & ~d & b)|(~tms & ~d & ~a)|(tms & c & ~b)|(tms & d & c & a);
assign c_nxt=(c & ~b)|(c&a)|(tms &~b);
assign d_nxt=(d & ~c)|(d&b)|(~tms&c&~b)|(~d & c & ~b &~a);
assign state_nxt = {d_nxt,c_nxt,b_nxt,a_nxt};

endmodule
