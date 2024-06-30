//----------------------------------------------------------------------------
// LegUp High-Level Synthesis Tool Version 5.0 (http://legup.org)
// Copyright (c) 2009-23 University of Toronto. All Rights Reserved.
// For research and academic purposes only. Commercial use is prohibited.
// Please report bugs at: http://legup.org/bugs
// Please email questions to: legup@eecg.toronto.edu
// Date: Tue Jun 25 10:21:56 2024
// ----------------------------------------------------------------------------
`define MEMORY_CONTROLLER_ADDR_SIZE 32
`define MEMORY_CONTROLLER_DATA_SIZE 64
// Number of RAM elements: 3
`define MEMORY_CONTROLLER_TAG_SIZE 9
`timescale 1 ns / 1 ns
module toy
(
	clk,
	clk2x,
	clk1x_follower,
	reset,
	memory_controller_waitrequest,
	start,
	finish,
	arg_a,
	arg_b,
	arg_c,
	main_0_a_write_enable_a,
	main_0_a_in_a,
	main_0_a_byteena_a,
	main_0_a_enable_a,
	main_0_a_address_a,
	main_0_a_out_a,
	main_0_a_write_enable_b,
	main_0_a_in_b,
	main_0_a_byteena_b,
	main_0_a_enable_b,
	main_0_a_address_b,
	main_0_a_out_b,
	main_0_b_write_enable_a,
	main_0_b_in_a,
	main_0_b_byteena_a,
	main_0_b_enable_a,
	main_0_b_address_a,
	main_0_b_out_a,
	main_0_b_write_enable_b,
	main_0_b_in_b,
	main_0_b_byteena_b,
	main_0_b_enable_b,
	main_0_b_address_b,
	main_0_b_out_b,
	main_0_c_write_enable_a,
	main_0_c_in_a,
	main_0_c_byteena_a,
	main_0_c_enable_a,
	main_0_c_address_a,
	main_0_c_out_a,
	main_0_c_write_enable_b,
	main_0_c_in_b,
	main_0_c_byteena_b,
	main_0_c_enable_b,
	main_0_c_address_b,
	main_0_c_out_b
);

parameter [2:0] LEGUP_0 = 3'd0;
parameter [2:0] LEGUP_F_toy_BB__1_1 = 3'd1;
parameter [2:0] LEGUP_F_toy_BB__1_2 = 3'd2;
parameter [2:0] LEGUP_F_toy_BB__1_3 = 3'd3;
parameter [2:0] LEGUP_F_toy_BB__6_4 = 3'd4;

input  clk;
input  clk2x;
input  clk1x_follower;
input  reset;
input  memory_controller_waitrequest;
input  start;
output reg  finish;
input [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] arg_a;
input [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] arg_b;
input [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] arg_c;
output  main_0_a_write_enable_a;
output [31:0] main_0_a_in_a;
output  main_0_a_byteena_a;
output reg  main_0_a_enable_a;
output reg [9:0] main_0_a_address_a;
input [31:0] main_0_a_out_a;
output  main_0_a_write_enable_b;
output [31:0] main_0_a_in_b;
output  main_0_a_byteena_b;
output  main_0_a_enable_b;
output [9:0] main_0_a_address_b;
input [31:0] main_0_a_out_b;
output  main_0_b_write_enable_a;
output [31:0] main_0_b_in_a;
output  main_0_b_byteena_a;
output reg  main_0_b_enable_a;
output reg [9:0] main_0_b_address_a;
input [31:0] main_0_b_out_a;
output  main_0_b_write_enable_b;
output [31:0] main_0_b_in_b;
output  main_0_b_byteena_b;
output  main_0_b_enable_b;
output [9:0] main_0_b_address_b;
input [31:0] main_0_b_out_b;
output reg  main_0_c_write_enable_a;
output reg [31:0] main_0_c_in_a;
output  main_0_c_byteena_a;
output reg  main_0_c_enable_a;
output reg [9:0] main_0_c_address_a;
input [31:0] main_0_c_out_a;
output  main_0_c_write_enable_b;
output [31:0] main_0_c_in_b;
output  main_0_c_byteena_b;
output  main_0_c_enable_b;
output [9:0] main_0_c_address_b;
input [31:0] main_0_c_out_b;
reg [2:0] cur_state;
reg [2:0] next_state;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] arg_a_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] arg_b_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] arg_c_reg;
reg  fsm_stall;
reg [9:0] toy_1_i01;
reg [9:0] toy_1_i01_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] toy_1_scevgep3;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] toy_1_scevgep2;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] toy_1_scevgep;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] toy_1_scevgep_reg;
reg [31:0] toy_1_2;
reg [31:0] toy_1_3;
reg [31:0] toy_1_4;
reg [10:0] toy_1_5;
reg [10:0] toy_1_5_reg;
reg  toy_1_exitcond;
reg  toy_1_exitcond_reg;

// Local Rams

// End Local Rams

always @(posedge clk) begin
if (reset == 1'b1)
	cur_state <= LEGUP_0;
else if (!fsm_stall)
	cur_state <= next_state;
end

always @(*)
begin
next_state = cur_state;
case(cur_state)  // synthesis parallel_case  
LEGUP_0:
	if ((fsm_stall == 1'd0) && (start == 1'd1))
		next_state = LEGUP_F_toy_BB__1_1;
LEGUP_F_toy_BB__1_1:
		next_state = LEGUP_F_toy_BB__1_2;
LEGUP_F_toy_BB__1_2:
		next_state = LEGUP_F_toy_BB__1_3;
LEGUP_F_toy_BB__1_3:
	if ((fsm_stall == 1'd0) && (toy_1_exitcond_reg == 1'd1))
		next_state = LEGUP_F_toy_BB__6_4;
	else if ((fsm_stall == 1'd0) && (toy_1_exitcond_reg == 1'd0))
		next_state = LEGUP_F_toy_BB__1_1;
LEGUP_F_toy_BB__6_4:
		next_state = LEGUP_0;
default:
	next_state = cur_state;
endcase

end
always @(posedge clk) begin
	if (start) begin
		arg_a_reg <= arg_a;
	end
end
always @(posedge clk) begin
	if (start) begin
		arg_b_reg <= arg_b;
	end
end
always @(posedge clk) begin
	if (start) begin
		arg_c_reg <= arg_c;
	end
end
always @(*) begin
	fsm_stall = 1'd0;
	if (reset) begin
		fsm_stall = 1'd0;
	end
	if (memory_controller_waitrequest) begin
		fsm_stall = 1'd1;
	end
end
always @(*) begin
	/* toy: %1*/
	/*   %i.01 = phi i32 [ 0, %0 ], [ %5, %1 ], !MSB !3, !LSB !2, !extendFrom !3*/
	if ((((cur_state == LEGUP_0) & (fsm_stall == 1'd0)) & (start == 1'd1))) begin
		toy_1_i01 = 32'd0;
	end
	/* toy: %1*/
	/*   %i.01 = phi i32 [ 0, %0 ], [ %5, %1 ], !MSB !3, !LSB !2, !extendFrom !3*/
	else /* if ((((cur_state == LEGUP_F_toy_BB__1_3) & (fsm_stall == 1'd0)) & (toy_1_exitcond_reg == 1'd0))) */ begin
		toy_1_i01 = toy_1_5_reg;
	end
end
always @(posedge clk) begin
	/* toy: %1*/
	/*   %i.01 = phi i32 [ 0, %0 ], [ %5, %1 ], !MSB !3, !LSB !2, !extendFrom !3*/
	if ((((cur_state == LEGUP_0) & (fsm_stall == 1'd0)) & (start == 1'd1))) begin
		toy_1_i01_reg <= toy_1_i01;
	end
	/* toy: %1*/
	/*   %i.01 = phi i32 [ 0, %0 ], [ %5, %1 ], !MSB !3, !LSB !2, !extendFrom !3*/
	if ((((cur_state == LEGUP_F_toy_BB__1_3) & (fsm_stall == 1'd0)) & (toy_1_exitcond_reg == 1'd0))) begin
		toy_1_i01_reg <= toy_1_i01;
	end
end
always @(*) begin
	/* toy: %1*/
	/*   %scevgep3 = getelementptr i32* %a, i32 %i.01, !MSB !1, !LSB !2, !extendFrom !1*/
		toy_1_scevgep3 = (arg_a_reg + (4 * {22'd0,toy_1_i01_reg}));
end
always @(*) begin
	/* toy: %1*/
	/*   %scevgep2 = getelementptr i32* %b, i32 %i.01, !MSB !1, !LSB !2, !extendFrom !1*/
		toy_1_scevgep2 = (arg_b_reg + (4 * {22'd0,toy_1_i01_reg}));
end
always @(*) begin
	/* toy: %1*/
	/*   %scevgep = getelementptr i32* %c, i32 %i.01, !MSB !1, !LSB !2, !extendFrom !1*/
		toy_1_scevgep = (arg_c_reg + (4 * {22'd0,toy_1_i01_reg}));
end
always @(posedge clk) begin
	/* toy: %1*/
	/*   %scevgep = getelementptr i32* %c, i32 %i.01, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_toy_BB__1_1)) begin
		toy_1_scevgep_reg <= toy_1_scevgep;
	end
end
always @(*) begin
	/* toy: %1*/
	/*   %2 = load i32* %scevgep3, align 4, !MSB !4, !LSB !2, !extendFrom !4*/
		toy_1_2 = main_0_a_out_a;
end
always @(*) begin
	/* toy: %1*/
	/*   %3 = load i32* %scevgep2, align 4, !MSB !4, !LSB !2, !extendFrom !4*/
		toy_1_3 = main_0_b_out_a;
end
always @(*) begin
	/* toy: %1*/
	/*   %4 = add nsw i32 %2, %3, !MSB !4, !LSB !2, !extendFrom !4*/
		toy_1_4 = (toy_1_2 + toy_1_3);
end
always @(*) begin
	/* toy: %1*/
	/*   %5 = add nsw i32 %i.01, 1, !MSB !5, !LSB !2, !extendFrom !5*/
		toy_1_5 = ({1'd0,toy_1_i01_reg} + 32'd1);
end
always @(posedge clk) begin
	/* toy: %1*/
	/*   %5 = add nsw i32 %i.01, 1, !MSB !5, !LSB !2, !extendFrom !5*/
	if ((cur_state == LEGUP_F_toy_BB__1_1)) begin
		toy_1_5_reg <= toy_1_5;
	end
end
always @(*) begin
	/* toy: %1*/
	/*   %exitcond = icmp eq i32 %5, 1000, !MSB !2, !LSB !2, !extendFrom !2*/
		toy_1_exitcond = (toy_1_5 == 32'd1000);
end
always @(posedge clk) begin
	/* toy: %1*/
	/*   %exitcond = icmp eq i32 %5, 1000, !MSB !2, !LSB !2, !extendFrom !2*/
	if ((cur_state == LEGUP_F_toy_BB__1_1)) begin
		toy_1_exitcond_reg <= toy_1_exitcond;
	end
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		finish <= 1'd0;
	end
	/* toy: %6*/
	/*   ret void, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_toy_BB__6_4)) begin
		finish <= (fsm_stall == 1'd0);
	end
end
assign main_0_a_write_enable_a = 1'd0;
assign main_0_a_in_a = 0;
assign main_0_a_byteena_a = 1'd1;
always @(*) begin
	main_0_a_enable_a = 1'd0;
	/* toy: %1*/
	/*   %2 = load i32* %scevgep3, align 4, !MSB !4, !LSB !2, !extendFrom !4*/
	if ((cur_state == LEGUP_F_toy_BB__1_1)) begin
		main_0_a_enable_a = 1'd1;
	end
end
always @(*) begin
	main_0_a_address_a = 10'd0;
	/* toy: %1*/
	/*   %2 = load i32* %scevgep3, align 4, !MSB !4, !LSB !2, !extendFrom !4*/
	if ((cur_state == LEGUP_F_toy_BB__1_1)) begin
		main_0_a_address_a = (toy_1_scevgep3 >>> 3'd2);
	end
end
assign main_0_a_write_enable_b = 1'd0;
assign main_0_a_in_b = 0;
assign main_0_a_byteena_b = 1'd1;
assign main_0_a_enable_b = 1'd0;
assign main_0_a_address_b = 10'd0;
assign main_0_b_write_enable_a = 1'd0;
assign main_0_b_in_a = 0;
assign main_0_b_byteena_a = 1'd1;
always @(*) begin
	main_0_b_enable_a = 1'd0;
	/* toy: %1*/
	/*   %3 = load i32* %scevgep2, align 4, !MSB !4, !LSB !2, !extendFrom !4*/
	if ((cur_state == LEGUP_F_toy_BB__1_1)) begin
		main_0_b_enable_a = 1'd1;
	end
end
always @(*) begin
	main_0_b_address_a = 10'd0;
	/* toy: %1*/
	/*   %3 = load i32* %scevgep2, align 4, !MSB !4, !LSB !2, !extendFrom !4*/
	if ((cur_state == LEGUP_F_toy_BB__1_1)) begin
		main_0_b_address_a = (toy_1_scevgep2 >>> 3'd2);
	end
end
assign main_0_b_write_enable_b = 1'd0;
assign main_0_b_in_b = 0;
assign main_0_b_byteena_b = 1'd1;
assign main_0_b_enable_b = 1'd0;
assign main_0_b_address_b = 10'd0;
always @(*) begin
	main_0_c_write_enable_a = 1'd0;
	/* toy: %1*/
	/*   store i32 %4, i32* %scevgep, align 4, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_toy_BB__1_2)) begin
		main_0_c_write_enable_a = 1'd1;
	end
end
always @(*) begin
	main_0_c_in_a = 0;
	/* toy: %1*/
	/*   store i32 %4, i32* %scevgep, align 4, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_toy_BB__1_2)) begin
		main_0_c_in_a = toy_1_4;
	end
end
assign main_0_c_byteena_a = 1'd1;
always @(*) begin
	main_0_c_enable_a = 1'd0;
	/* toy: %1*/
	/*   store i32 %4, i32* %scevgep, align 4, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_toy_BB__1_2)) begin
		main_0_c_enable_a = 1'd1;
	end
end
always @(*) begin
	main_0_c_address_a = 10'd0;
	/* toy: %1*/
	/*   store i32 %4, i32* %scevgep, align 4, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_toy_BB__1_2)) begin
		main_0_c_address_a = (toy_1_scevgep_reg >>> 3'd2);
	end
end
assign main_0_c_write_enable_b = 1'd0;
assign main_0_c_in_b = 0;
assign main_0_c_byteena_b = 1'd1;
assign main_0_c_enable_b = 1'd0;
assign main_0_c_address_b = 10'd0;

endmodule
`timescale 1 ns / 1 ns
module main
(
	clk,
	clk2x,
	clk1x_follower,
	reset,
	memory_controller_waitrequest,
	start,
	finish,
	return_val,
	toy_start,
	toy_finish,
	toy_arg_a,
	toy_arg_b,
	toy_arg_c,
	main_0_a_write_enable_a,
	main_0_a_in_a,
	main_0_a_byteena_a,
	main_0_a_enable_a,
	main_0_a_address_a,
	main_0_a_out_a,
	main_0_a_write_enable_b,
	main_0_a_in_b,
	main_0_a_byteena_b,
	main_0_a_enable_b,
	main_0_a_address_b,
	main_0_a_out_b,
	main_0_b_write_enable_a,
	main_0_b_in_a,
	main_0_b_byteena_a,
	main_0_b_enable_a,
	main_0_b_address_a,
	main_0_b_out_a,
	main_0_b_write_enable_b,
	main_0_b_in_b,
	main_0_b_byteena_b,
	main_0_b_enable_b,
	main_0_b_address_b,
	main_0_b_out_b,
	main_0_c_write_enable_a,
	main_0_c_in_a,
	main_0_c_byteena_a,
	main_0_c_enable_a,
	main_0_c_address_a,
	main_0_c_out_a,
	main_0_c_write_enable_b,
	main_0_c_in_b,
	main_0_c_byteena_b,
	main_0_c_enable_b,
	main_0_c_address_b,
	main_0_c_out_b
);

parameter [3:0] LEGUP_0 = 4'd0;
parameter [3:0] LEGUP_F_main_BB__0_1 = 4'd1;
parameter [3:0] LEGUP_F_main_BB__1_2 = 4'd2;
parameter [3:0] LEGUP_F_main_BB__1_3 = 4'd3;
parameter [3:0] LEGUP_F_main_BB__1_4 = 4'd4;
parameter [3:0] LEGUP_F_main_BB__6_5 = 4'd5;
parameter [3:0] LEGUP_F_main_BB__6_7 = 4'd7;
parameter [3:0] LEGUP_F_main_BB__10_8 = 4'd8;
parameter [3:0] LEGUP_F_main_BB__10_9 = 4'd9;
parameter [3:0] LEGUP_F_main_BB__14_10 = 4'd10;
parameter [3:0] LEGUP_function_call_6 = 4'd6;

input  clk;
input  clk2x;
input  clk1x_follower;
input  reset;
input  memory_controller_waitrequest;
input  start;
output reg  finish;
output reg [31:0] return_val;
output reg  toy_start;
input  toy_finish;
output reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] toy_arg_a;
output reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] toy_arg_b;
output reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] toy_arg_c;
output reg  main_0_a_write_enable_a;
output reg [31:0] main_0_a_in_a;
output  main_0_a_byteena_a;
output reg  main_0_a_enable_a;
output reg [9:0] main_0_a_address_a;
input [31:0] main_0_a_out_a;
output  main_0_a_write_enable_b;
output [31:0] main_0_a_in_b;
output  main_0_a_byteena_b;
output  main_0_a_enable_b;
output [9:0] main_0_a_address_b;
input [31:0] main_0_a_out_b;
output reg  main_0_b_write_enable_a;
output reg [31:0] main_0_b_in_a;
output  main_0_b_byteena_a;
output reg  main_0_b_enable_a;
output reg [9:0] main_0_b_address_a;
input [31:0] main_0_b_out_a;
output  main_0_b_write_enable_b;
output [31:0] main_0_b_in_b;
output  main_0_b_byteena_b;
output  main_0_b_enable_b;
output [9:0] main_0_b_address_b;
input [31:0] main_0_b_out_b;
output  main_0_c_write_enable_a;
output [31:0] main_0_c_in_a;
output  main_0_c_byteena_a;
output reg  main_0_c_enable_a;
output reg [9:0] main_0_c_address_a;
input [31:0] main_0_c_out_a;
output  main_0_c_write_enable_b;
output [31:0] main_0_c_in_b;
output  main_0_c_byteena_b;
output  main_0_c_enable_b;
output [9:0] main_0_c_address_b;
input [31:0] main_0_c_out_b;
reg [3:0] cur_state;
reg [3:0] next_state;
reg  fsm_stall;
reg [9:0] main_1_2;
reg [9:0] main_1_2_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_1_scevgep3;
reg [11:0] main_1_3;
reg [12:0] main_1_4;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_1_scevgep2;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_1_scevgep2_reg;
reg [10:0] main_1_5;
reg [10:0] main_1_5_reg;
reg  main_1_exitcond5;
reg  main_1_exitcond5_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_6_7;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_6_8;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_6_9;
reg [9:0] main_10_i101;
reg [9:0] main_10_i101_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_10_scevgep;
reg [31:0] main_10_11;
reg [10:0] main_10_13;
reg [10:0] main_10_13_reg;
reg  main_10_exitcond2;
reg  main_10_exitcond2_reg;
reg  legup_function_call;
reg  legup_mult_main_1_3_en;
reg [11:0] main_1_3_stage0_reg;

// Local Rams

// End Local Rams

/* Unsynthesizable Statements */
/* synthesis translate_off */
always @(posedge clk)
	if (!fsm_stall) begin
	/* main: %10*/
	/*   %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %11) #2, !MSB !4, !LSB !2, !extendFrom !4*/
	if ((cur_state == LEGUP_F_main_BB__10_9)) begin
		$write("%d\n", $signed(main_10_11));
		// to fix quartus warning
		if (reset == 1'b0 && ^(main_10_11) === 1'bX) finish <= 0;
	end
end
/* synthesis translate_on */
always @(posedge clk) begin
if (reset == 1'b1)
	cur_state <= LEGUP_0;
else if (!fsm_stall)
	cur_state <= next_state;
end

always @(*)
begin
next_state = cur_state;
case(cur_state)  // synthesis parallel_case  
LEGUP_0:
	if ((fsm_stall == 1'd0) && (start == 1'd1))
		next_state = LEGUP_F_main_BB__0_1;
LEGUP_F_main_BB__0_1:
		next_state = LEGUP_F_main_BB__1_2;
LEGUP_F_main_BB__10_8:
		next_state = LEGUP_F_main_BB__10_9;
LEGUP_F_main_BB__10_9:
	if ((fsm_stall == 1'd0) && (main_10_exitcond2_reg == 1'd1))
		next_state = LEGUP_F_main_BB__14_10;
	else if ((fsm_stall == 1'd0) && (main_10_exitcond2_reg == 1'd0))
		next_state = LEGUP_F_main_BB__10_8;
LEGUP_F_main_BB__14_10:
		next_state = LEGUP_0;
LEGUP_F_main_BB__1_2:
		next_state = LEGUP_F_main_BB__1_3;
LEGUP_F_main_BB__1_3:
		next_state = LEGUP_F_main_BB__1_4;
LEGUP_F_main_BB__1_4:
	if ((fsm_stall == 1'd0) && (main_1_exitcond5_reg == 1'd1))
		next_state = LEGUP_F_main_BB__6_5;
	else if ((fsm_stall == 1'd0) && (main_1_exitcond5_reg == 1'd0))
		next_state = LEGUP_F_main_BB__1_2;
LEGUP_F_main_BB__6_5:
		next_state = LEGUP_function_call_6;
LEGUP_F_main_BB__6_7:
		next_state = LEGUP_F_main_BB__10_8;
LEGUP_function_call_6:
	if ((fsm_stall == 1'd0) && (toy_finish == 1'd1))
		next_state = LEGUP_F_main_BB__6_7;
default:
	next_state = cur_state;
endcase

end
always @(*) begin
	fsm_stall = 1'd0;
	if (reset) begin
		fsm_stall = 1'd0;
	end
	if (memory_controller_waitrequest) begin
		fsm_stall = 1'd1;
	end
end
always @(*) begin
	/* main: %1*/
	/*   %2 = phi i32 [ 0, %0 ], [ %5, %1 ], !MSB !3, !LSB !2, !extendFrom !3*/
	if (((cur_state == LEGUP_F_main_BB__0_1) & (fsm_stall == 1'd0))) begin
		main_1_2 = 32'd0;
	end
	/* main: %1*/
	/*   %2 = phi i32 [ 0, %0 ], [ %5, %1 ], !MSB !3, !LSB !2, !extendFrom !3*/
	else /* if ((((cur_state == LEGUP_F_main_BB__1_4) & (fsm_stall == 1'd0)) & (main_1_exitcond5_reg == 1'd0))) */ begin
		main_1_2 = main_1_5_reg;
	end
end
always @(posedge clk) begin
	/* main: %1*/
	/*   %2 = phi i32 [ 0, %0 ], [ %5, %1 ], !MSB !3, !LSB !2, !extendFrom !3*/
	if (((cur_state == LEGUP_F_main_BB__0_1) & (fsm_stall == 1'd0))) begin
		main_1_2_reg <= main_1_2;
	end
	/* main: %1*/
	/*   %2 = phi i32 [ 0, %0 ], [ %5, %1 ], !MSB !3, !LSB !2, !extendFrom !3*/
	if ((((cur_state == LEGUP_F_main_BB__1_4) & (fsm_stall == 1'd0)) & (main_1_exitcond5_reg == 1'd0))) begin
		main_1_2_reg <= main_1_2;
	end
end
always @(*) begin
	/* main: %1*/
	/*   %scevgep3 = getelementptr [1000 x i32]* %a, i32 0, i32 %2, !MSB !1, !LSB !2, !extendFrom !1*/
		main_1_scevgep3 = (1'd0 + (4 * {22'd0,main_1_2_reg}));
end
always @(*) begin
	main_1_3 = main_1_3_stage0_reg;
end
always @(*) begin
	/* main: %1*/
	/*   %4 = add i32 %3, 1000, !MSB !4, !LSB !2, !extendFrom !6*/
		main_1_4 = ($signed({{1{main_1_3[11]}},main_1_3}) + 32'd1000);
end
always @(*) begin
	/* main: %1*/
	/*   %scevgep2 = getelementptr [1000 x i32]* %b, i32 0, i32 %2, !MSB !1, !LSB !2, !extendFrom !1*/
		main_1_scevgep2 = (1'd0 + (4 * {22'd0,main_1_2_reg}));
end
always @(posedge clk) begin
	/* main: %1*/
	/*   %scevgep2 = getelementptr [1000 x i32]* %b, i32 0, i32 %2, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_main_BB__1_2)) begin
		main_1_scevgep2_reg <= main_1_scevgep2;
	end
end
always @(*) begin
	/* main: %1*/
	/*   %5 = add nsw i32 %2, 1, !MSB !7, !LSB !2, !extendFrom !7*/
		main_1_5 = ({1'd0,main_1_2_reg} + 32'd1);
end
always @(posedge clk) begin
	/* main: %1*/
	/*   %5 = add nsw i32 %2, 1, !MSB !7, !LSB !2, !extendFrom !7*/
	if ((cur_state == LEGUP_F_main_BB__1_2)) begin
		main_1_5_reg <= main_1_5;
	end
end
always @(*) begin
	/* main: %1*/
	/*   %exitcond5 = icmp eq i32 %5, 1000, !MSB !2, !LSB !2, !extendFrom !2*/
		main_1_exitcond5 = (main_1_5 == 32'd1000);
end
always @(posedge clk) begin
	/* main: %1*/
	/*   %exitcond5 = icmp eq i32 %5, 1000, !MSB !2, !LSB !2, !extendFrom !2*/
	if ((cur_state == LEGUP_F_main_BB__1_2)) begin
		main_1_exitcond5_reg <= main_1_exitcond5;
	end
end
always @(*) begin
	/* main: %6*/
	/*   %7 = getelementptr inbounds [1000 x i32]* %a, i32 0, i32 0, !MSB !1, !LSB !2, !extendFrom !1*/
if (reset) begin main_6_7 = 0; end
		main_6_7 = 1'd0;
end
always @(*) begin
	/* main: %6*/
	/*   %8 = getelementptr inbounds [1000 x i32]* %b, i32 0, i32 0, !MSB !1, !LSB !2, !extendFrom !1*/
if (reset) begin main_6_8 = 0; end
		main_6_8 = 1'd0;
end
always @(*) begin
	/* main: %6*/
	/*   %9 = getelementptr inbounds [1000 x i32]* %c, i32 0, i32 0, !MSB !1, !LSB !2, !extendFrom !1*/
if (reset) begin main_6_9 = 0; end
		main_6_9 = 1'd0;
end
always @(*) begin
	/* main: %10*/
	/*   %i1.01 = phi i32 [ 0, %6 ], [ %13, %10 ], !MSB !3, !LSB !2, !extendFrom !3*/
	if (((cur_state == LEGUP_F_main_BB__6_7) & (fsm_stall == 1'd0))) begin
		main_10_i101 = 32'd0;
	end
	/* main: %10*/
	/*   %i1.01 = phi i32 [ 0, %6 ], [ %13, %10 ], !MSB !3, !LSB !2, !extendFrom !3*/
	else /* if ((((cur_state == LEGUP_F_main_BB__10_9) & (fsm_stall == 1'd0)) & (main_10_exitcond2_reg == 1'd0))) */ begin
		main_10_i101 = main_10_13_reg;
	end
end
always @(posedge clk) begin
	/* main: %10*/
	/*   %i1.01 = phi i32 [ 0, %6 ], [ %13, %10 ], !MSB !3, !LSB !2, !extendFrom !3*/
	if (((cur_state == LEGUP_F_main_BB__6_7) & (fsm_stall == 1'd0))) begin
		main_10_i101_reg <= main_10_i101;
	end
	/* main: %10*/
	/*   %i1.01 = phi i32 [ 0, %6 ], [ %13, %10 ], !MSB !3, !LSB !2, !extendFrom !3*/
	if ((((cur_state == LEGUP_F_main_BB__10_9) & (fsm_stall == 1'd0)) & (main_10_exitcond2_reg == 1'd0))) begin
		main_10_i101_reg <= main_10_i101;
	end
end
always @(*) begin
	/* main: %10*/
	/*   %scevgep = getelementptr [1000 x i32]* %c, i32 0, i32 %i1.01, !MSB !1, !LSB !2, !extendFrom !1*/
		main_10_scevgep = (1'd0 + (4 * {22'd0,main_10_i101_reg}));
end
always @(*) begin
	/* main: %10*/
	/*   %11 = load i32* %scevgep, align 4, !MSB !4, !LSB !2, !extendFrom !4*/
		main_10_11 = main_0_c_out_a;
end
always @(*) begin
	/* main: %10*/
	/*   %13 = add nsw i32 %i1.01, 1, !MSB !7, !LSB !2, !extendFrom !7*/
		main_10_13 = ({1'd0,main_10_i101_reg} + 32'd1);
end
always @(posedge clk) begin
	/* main: %10*/
	/*   %13 = add nsw i32 %i1.01, 1, !MSB !7, !LSB !2, !extendFrom !7*/
	if ((cur_state == LEGUP_F_main_BB__10_8)) begin
		main_10_13_reg <= main_10_13;
	end
end
always @(*) begin
	/* main: %10*/
	/*   %exitcond2 = icmp eq i32 %13, 1000, !MSB !2, !LSB !2, !extendFrom !2*/
		main_10_exitcond2 = (main_10_13 == 32'd1000);
end
always @(posedge clk) begin
	/* main: %10*/
	/*   %exitcond2 = icmp eq i32 %13, 1000, !MSB !2, !LSB !2, !extendFrom !2*/
	if ((cur_state == LEGUP_F_main_BB__10_8)) begin
		main_10_exitcond2_reg <= main_10_exitcond2;
	end
end
always @(*) begin
	legup_function_call = 1'd0;
	/* main: %6*/
	/*   call fastcc void @toy(i32* %7, i32* %8, i32* %9) #2, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_function_call_6)) begin
		legup_function_call = 1'd1;
	end
end
always @(*) begin
	legup_mult_main_1_3_en = ~((fsm_stall | legup_function_call));
end
always @(posedge clk) begin
	/* main: %1*/
	/*   %3 = mul i32 %2, -1, !MSB !4, !LSB !2, !extendFrom !5*/
	if ((legup_mult_main_1_3_en == 1'd1)) begin
		main_1_3_stage0_reg <= ({2'd0,main_1_2_reg} * $signed(-32'd1));
	end
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		finish <= 1'd0;
	end
	/* main: %14*/
	/*   ret i32 0, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_main_BB__14_10)) begin
		finish <= (fsm_stall == 1'd0);
	end
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		return_val <= 0;
	end
	/* main: %14*/
	/*   ret i32 0, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_main_BB__14_10)) begin
		return_val <= 32'd0;
	end
end
always @(posedge clk) begin
	toy_start <= 1'd0;
	/* main: %6*/
	/*   call fastcc void @toy(i32* %7, i32* %8, i32* %9) #2, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_main_BB__6_5)) begin
		toy_start <= 1'd1;
	end
	if ((cur_state == LEGUP_F_main_BB__6_7)) begin
		toy_start <= 1'd0;
	end
end
always @(posedge clk) begin
	toy_arg_a <= 0;
	/* main: %6*/
	/*   call fastcc void @toy(i32* %7, i32* %8, i32* %9) #2, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_main_BB__6_5)) begin
		toy_arg_a <= main_6_7;
	end
end
always @(posedge clk) begin
	toy_arg_b <= 0;
	/* main: %6*/
	/*   call fastcc void @toy(i32* %7, i32* %8, i32* %9) #2, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_main_BB__6_5)) begin
		toy_arg_b <= main_6_8;
	end
end
always @(posedge clk) begin
	toy_arg_c <= 0;
	/* main: %6*/
	/*   call fastcc void @toy(i32* %7, i32* %8, i32* %9) #2, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_main_BB__6_5)) begin
		toy_arg_c <= main_6_9;
	end
end
always @(*) begin
	main_0_a_write_enable_a = 1'd0;
	/* main: %1*/
	/*   store i32 %2, i32* %scevgep3, align 4, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_main_BB__1_2)) begin
		main_0_a_write_enable_a = 1'd1;
	end
end
always @(*) begin
	main_0_a_in_a = 0;
	/* main: %1*/
	/*   store i32 %2, i32* %scevgep3, align 4, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_main_BB__1_2)) begin
		main_0_a_in_a = {22'd0,main_1_2_reg};
	end
end
assign main_0_a_byteena_a = 1'd1;
always @(*) begin
	main_0_a_enable_a = 1'd0;
	/* main: %1*/
	/*   store i32 %2, i32* %scevgep3, align 4, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_main_BB__1_2)) begin
		main_0_a_enable_a = 1'd1;
	end
end
always @(*) begin
	main_0_a_address_a = 10'd0;
	/* main: %1*/
	/*   store i32 %2, i32* %scevgep3, align 4, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_main_BB__1_2)) begin
		main_0_a_address_a = (main_1_scevgep3 >>> 3'd2);
	end
end
assign main_0_a_write_enable_b = 1'd0;
assign main_0_a_in_b = 0;
assign main_0_a_byteena_b = 1'd1;
assign main_0_a_enable_b = 1'd0;
assign main_0_a_address_b = 10'd0;
always @(*) begin
	main_0_b_write_enable_a = 1'd0;
	/* main: %1*/
	/*   store i32 %4, i32* %scevgep2, align 4, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_main_BB__1_3)) begin
		main_0_b_write_enable_a = 1'd1;
	end
end
always @(*) begin
	main_0_b_in_a = 0;
	/* main: %1*/
	/*   store i32 %4, i32* %scevgep2, align 4, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_main_BB__1_3)) begin
		main_0_b_in_a = {{19{main_1_4[12]}},main_1_4};
	end
end
assign main_0_b_byteena_a = 1'd1;
always @(*) begin
	main_0_b_enable_a = 1'd0;
	/* main: %1*/
	/*   store i32 %4, i32* %scevgep2, align 4, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_main_BB__1_3)) begin
		main_0_b_enable_a = 1'd1;
	end
end
always @(*) begin
	main_0_b_address_a = 10'd0;
	/* main: %1*/
	/*   store i32 %4, i32* %scevgep2, align 4, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_main_BB__1_3)) begin
		main_0_b_address_a = (main_1_scevgep2_reg >>> 3'd2);
	end
end
assign main_0_b_write_enable_b = 1'd0;
assign main_0_b_in_b = 0;
assign main_0_b_byteena_b = 1'd1;
assign main_0_b_enable_b = 1'd0;
assign main_0_b_address_b = 10'd0;
assign main_0_c_write_enable_a = 1'd0;
assign main_0_c_in_a = 0;
assign main_0_c_byteena_a = 1'd1;
always @(*) begin
	main_0_c_enable_a = 1'd0;
	/* main: %10*/
	/*   %11 = load i32* %scevgep, align 4, !MSB !4, !LSB !2, !extendFrom !4*/
	if ((cur_state == LEGUP_F_main_BB__10_8)) begin
		main_0_c_enable_a = 1'd1;
	end
end
always @(*) begin
	main_0_c_address_a = 10'd0;
	/* main: %10*/
	/*   %11 = load i32* %scevgep, align 4, !MSB !4, !LSB !2, !extendFrom !4*/
	if ((cur_state == LEGUP_F_main_BB__10_8)) begin
		main_0_c_address_a = (main_10_scevgep >>> 3'd2);
	end
end
assign main_0_c_write_enable_b = 1'd0;
assign main_0_c_in_b = 0;
assign main_0_c_byteena_b = 1'd1;
assign main_0_c_enable_b = 1'd0;
assign main_0_c_address_b = 10'd0;

endmodule
module hex_digits(x, hex_LEDs);
    input [3:0] x;
    output [6:0] hex_LEDs;
    
    assign hex_LEDs[0] = (~x[3] & ~x[2] & ~x[1] & x[0]) |
                            (~x[3] & x[2] & ~x[1] & ~x[0]) |
                            (x[3] & x[2] & ~x[1] & x[0]) |
                            (x[3] & ~x[2] & x[1] & x[0]);
    assign hex_LEDs[1] = (~x[3] & x[2] & ~x[1] & x[0]) |
                            (x[3] & x[1] & x[0]) |
                            (x[3] & x[2] & ~x[0]) |
                            (x[2] & x[1] & ~x[0]);
    assign hex_LEDs[2] = (x[3] & x[2] & ~x[0]) |
                            (x[3] & x[2] & x[1]) |
                            (~x[3] & ~x[2] & x[1] & ~x[0]);
    assign hex_LEDs[3] = (~x[3] & ~x[2] & ~x[1] & x[0]) | 
                            (~x[3] & x[2] & ~x[1] & ~x[0]) | 
                            (x[2] & x[1] & x[0]) | 
                            (x[3] & ~x[2] & x[1] & ~x[0]);
    assign hex_LEDs[4] = (~x[3] & x[0]) |
                            (~x[3] & x[2] & ~x[1]) |
                            (~x[2] & ~x[1] & x[0]);
    assign hex_LEDs[5] = (~x[3] & ~x[2] & x[0]) | 
                            (~x[3] & ~x[2] & x[1]) | 
                            (~x[3] & x[1] & x[0]) | 
                            (x[3] & x[2] & ~x[1] & x[0]);
    assign hex_LEDs[6] = (~x[3] & ~x[2] & ~x[1]) | 
                            (x[3] & x[2] & ~x[1] & ~x[0]) | 
                            (~x[3] & x[2] & x[1] & x[0]);
    
endmodule
`timescale 1 ns / 1 ns
`timescale 1 ns / 1 ns
module top
(
	clk,
	clk2x,
	clk1x_follower,
	reset,
	memory_controller_waitrequest,
	start,
	finish,
	return_val
);

input  clk;
input  clk2x;
input  clk1x_follower;
input  reset;
input  memory_controller_waitrequest;
input  start;
output reg  finish;
output reg [31:0] return_val;
reg  main_inst_clk;
reg  main_inst_clk2x;
reg  main_inst_clk1x_follower;
reg  main_inst_reset;
reg  main_inst_memory_controller_waitrequest;
reg  main_inst_start;
wire  main_inst_finish;
wire [31:0] main_inst_return_val;
wire  main_inst_toy_start;
reg  main_inst_toy_finish;
wire [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_inst_toy_arg_a;
wire [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_inst_toy_arg_b;
wire [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_inst_toy_arg_c;
wire  main_inst_main_0_a_write_enable_a;
wire [31:0] main_inst_main_0_a_in_a;
wire  main_inst_main_0_a_byteena_a;
wire  main_inst_main_0_a_enable_a;
wire [9:0] main_inst_main_0_a_address_a;
reg [31:0] main_inst_main_0_a_out_a;
wire  main_inst_main_0_a_write_enable_b;
wire [31:0] main_inst_main_0_a_in_b;
wire  main_inst_main_0_a_byteena_b;
wire  main_inst_main_0_a_enable_b;
wire [9:0] main_inst_main_0_a_address_b;
reg [31:0] main_inst_main_0_a_out_b;
wire  main_inst_main_0_b_write_enable_a;
wire [31:0] main_inst_main_0_b_in_a;
wire  main_inst_main_0_b_byteena_a;
wire  main_inst_main_0_b_enable_a;
wire [9:0] main_inst_main_0_b_address_a;
reg [31:0] main_inst_main_0_b_out_a;
wire  main_inst_main_0_b_write_enable_b;
wire [31:0] main_inst_main_0_b_in_b;
wire  main_inst_main_0_b_byteena_b;
wire  main_inst_main_0_b_enable_b;
wire [9:0] main_inst_main_0_b_address_b;
reg [31:0] main_inst_main_0_b_out_b;
wire  main_inst_main_0_c_write_enable_a;
wire [31:0] main_inst_main_0_c_in_a;
wire  main_inst_main_0_c_byteena_a;
wire  main_inst_main_0_c_enable_a;
wire [9:0] main_inst_main_0_c_address_a;
reg [31:0] main_inst_main_0_c_out_a;
wire  main_inst_main_0_c_write_enable_b;
wire [31:0] main_inst_main_0_c_in_b;
wire  main_inst_main_0_c_byteena_b;
wire  main_inst_main_0_c_enable_b;
wire [9:0] main_inst_main_0_c_address_b;
reg [31:0] main_inst_main_0_c_out_b;
reg  main_inst_finish_reg;
reg [31:0] main_inst_return_val_reg;
reg  main_0_a_inst_clk;
reg  main_0_a_inst_clken;
reg [9:0] main_0_a_inst_address_a;
reg  main_0_a_inst_wren_a;
reg [31:0] main_0_a_inst_data_a;
wire  main_0_a_inst_byteena_a;
wire [31:0] main_0_a_inst_q_a;
reg [9:0] main_0_a_inst_address_b;
reg  main_0_a_inst_wren_b;
reg [31:0] main_0_a_inst_data_b;
wire  main_0_a_inst_byteena_b;
wire [31:0] main_0_a_inst_q_b;
reg  main_0_b_inst_clk;
reg  main_0_b_inst_clken;
reg [9:0] main_0_b_inst_address_a;
reg  main_0_b_inst_wren_a;
reg [31:0] main_0_b_inst_data_a;
wire  main_0_b_inst_byteena_a;
wire [31:0] main_0_b_inst_q_a;
reg [9:0] main_0_b_inst_address_b;
reg  main_0_b_inst_wren_b;
reg [31:0] main_0_b_inst_data_b;
wire  main_0_b_inst_byteena_b;
wire [31:0] main_0_b_inst_q_b;
reg  main_0_c_inst_clk;
reg  main_0_c_inst_clken;
reg [9:0] main_0_c_inst_address_a;
reg  main_0_c_inst_wren_a;
reg [31:0] main_0_c_inst_data_a;
wire  main_0_c_inst_byteena_a;
wire [31:0] main_0_c_inst_q_a;
reg [9:0] main_0_c_inst_address_b;
reg  main_0_c_inst_wren_b;
reg [31:0] main_0_c_inst_data_b;
wire  main_0_c_inst_byteena_b;
wire [31:0] main_0_c_inst_q_b;
reg  toy_inst_clk;
reg  toy_inst_clk2x;
reg  toy_inst_clk1x_follower;
reg  toy_inst_reset;
reg  toy_inst_memory_controller_waitrequest;
reg  toy_inst_start;
wire  toy_inst_finish;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] toy_inst_arg_a;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] toy_inst_arg_b;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] toy_inst_arg_c;
wire  toy_inst_main_0_a_write_enable_a;
wire [31:0] toy_inst_main_0_a_in_a;
wire  toy_inst_main_0_a_byteena_a;
wire  toy_inst_main_0_a_enable_a;
wire [9:0] toy_inst_main_0_a_address_a;
reg [31:0] toy_inst_main_0_a_out_a;
wire  toy_inst_main_0_a_write_enable_b;
wire [31:0] toy_inst_main_0_a_in_b;
wire  toy_inst_main_0_a_byteena_b;
wire  toy_inst_main_0_a_enable_b;
wire [9:0] toy_inst_main_0_a_address_b;
reg [31:0] toy_inst_main_0_a_out_b;
wire  toy_inst_main_0_b_write_enable_a;
wire [31:0] toy_inst_main_0_b_in_a;
wire  toy_inst_main_0_b_byteena_a;
wire  toy_inst_main_0_b_enable_a;
wire [9:0] toy_inst_main_0_b_address_a;
reg [31:0] toy_inst_main_0_b_out_a;
wire  toy_inst_main_0_b_write_enable_b;
wire [31:0] toy_inst_main_0_b_in_b;
wire  toy_inst_main_0_b_byteena_b;
wire  toy_inst_main_0_b_enable_b;
wire [9:0] toy_inst_main_0_b_address_b;
reg [31:0] toy_inst_main_0_b_out_b;
wire  toy_inst_main_0_c_write_enable_a;
wire [31:0] toy_inst_main_0_c_in_a;
wire  toy_inst_main_0_c_byteena_a;
wire  toy_inst_main_0_c_enable_a;
wire [9:0] toy_inst_main_0_c_address_a;
reg [31:0] toy_inst_main_0_c_out_a;
wire  toy_inst_main_0_c_write_enable_b;
wire [31:0] toy_inst_main_0_c_in_b;
wire  toy_inst_main_0_c_byteena_b;
wire  toy_inst_main_0_c_enable_b;
wire [9:0] toy_inst_main_0_c_address_b;
reg [31:0] toy_inst_main_0_c_out_b;
reg  toy_inst_finish_reg;


main main_inst (
	.clk (main_inst_clk),
	.clk2x (main_inst_clk2x),
	.clk1x_follower (main_inst_clk1x_follower),
	.reset (main_inst_reset),
	.memory_controller_waitrequest (main_inst_memory_controller_waitrequest),
	.start (main_inst_start),
	.finish (main_inst_finish),
	.return_val (main_inst_return_val),
	.toy_start (main_inst_toy_start),
	.toy_finish (main_inst_toy_finish),
	.toy_arg_a (main_inst_toy_arg_a),
	.toy_arg_b (main_inst_toy_arg_b),
	.toy_arg_c (main_inst_toy_arg_c),
	.main_0_a_write_enable_a (main_inst_main_0_a_write_enable_a),
	.main_0_a_in_a (main_inst_main_0_a_in_a),
	.main_0_a_byteena_a (main_inst_main_0_a_byteena_a),
	.main_0_a_enable_a (main_inst_main_0_a_enable_a),
	.main_0_a_address_a (main_inst_main_0_a_address_a),
	.main_0_a_out_a (main_inst_main_0_a_out_a),
	.main_0_a_write_enable_b (main_inst_main_0_a_write_enable_b),
	.main_0_a_in_b (main_inst_main_0_a_in_b),
	.main_0_a_byteena_b (main_inst_main_0_a_byteena_b),
	.main_0_a_enable_b (main_inst_main_0_a_enable_b),
	.main_0_a_address_b (main_inst_main_0_a_address_b),
	.main_0_a_out_b (main_inst_main_0_a_out_b),
	.main_0_b_write_enable_a (main_inst_main_0_b_write_enable_a),
	.main_0_b_in_a (main_inst_main_0_b_in_a),
	.main_0_b_byteena_a (main_inst_main_0_b_byteena_a),
	.main_0_b_enable_a (main_inst_main_0_b_enable_a),
	.main_0_b_address_a (main_inst_main_0_b_address_a),
	.main_0_b_out_a (main_inst_main_0_b_out_a),
	.main_0_b_write_enable_b (main_inst_main_0_b_write_enable_b),
	.main_0_b_in_b (main_inst_main_0_b_in_b),
	.main_0_b_byteena_b (main_inst_main_0_b_byteena_b),
	.main_0_b_enable_b (main_inst_main_0_b_enable_b),
	.main_0_b_address_b (main_inst_main_0_b_address_b),
	.main_0_b_out_b (main_inst_main_0_b_out_b),
	.main_0_c_write_enable_a (main_inst_main_0_c_write_enable_a),
	.main_0_c_in_a (main_inst_main_0_c_in_a),
	.main_0_c_byteena_a (main_inst_main_0_c_byteena_a),
	.main_0_c_enable_a (main_inst_main_0_c_enable_a),
	.main_0_c_address_a (main_inst_main_0_c_address_a),
	.main_0_c_out_a (main_inst_main_0_c_out_a),
	.main_0_c_write_enable_b (main_inst_main_0_c_write_enable_b),
	.main_0_c_in_b (main_inst_main_0_c_in_b),
	.main_0_c_byteena_b (main_inst_main_0_c_byteena_b),
	.main_0_c_enable_b (main_inst_main_0_c_enable_b),
	.main_0_c_address_b (main_inst_main_0_c_address_b),
	.main_0_c_out_b (main_inst_main_0_c_out_b)
);



ram_dual_port main_0_a_inst (
	.clk (main_0_a_inst_clk),
	.clken (main_0_a_inst_clken),
	.address_a (main_0_a_inst_address_a),
	.wren_a (main_0_a_inst_wren_a),
	.data_a (main_0_a_inst_data_a),
	.byteena_a (main_0_a_inst_byteena_a),
	.q_a (main_0_a_inst_q_a),
	.address_b (main_0_a_inst_address_b),
	.wren_b (main_0_a_inst_wren_b),
	.data_b (main_0_a_inst_data_b),
	.byteena_b (main_0_a_inst_byteena_b),
	.q_b (main_0_a_inst_q_b)
);

defparam
	main_0_a_inst.width_a = 32,
	main_0_a_inst.width_b = 32,
	main_0_a_inst.widthad_a = 10,
	main_0_a_inst.widthad_b = 10,
	main_0_a_inst.width_be_a = 1,
	main_0_a_inst.width_be_b = 1,
	main_0_a_inst.numwords_a = 1000,
	main_0_a_inst.numwords_b = 1000,
	main_0_a_inst.latency = 1;


ram_dual_port main_0_b_inst (
	.clk (main_0_b_inst_clk),
	.clken (main_0_b_inst_clken),
	.address_a (main_0_b_inst_address_a),
	.wren_a (main_0_b_inst_wren_a),
	.data_a (main_0_b_inst_data_a),
	.byteena_a (main_0_b_inst_byteena_a),
	.q_a (main_0_b_inst_q_a),
	.address_b (main_0_b_inst_address_b),
	.wren_b (main_0_b_inst_wren_b),
	.data_b (main_0_b_inst_data_b),
	.byteena_b (main_0_b_inst_byteena_b),
	.q_b (main_0_b_inst_q_b)
);

defparam
	main_0_b_inst.width_a = 32,
	main_0_b_inst.width_b = 32,
	main_0_b_inst.widthad_a = 10,
	main_0_b_inst.widthad_b = 10,
	main_0_b_inst.width_be_a = 1,
	main_0_b_inst.width_be_b = 1,
	main_0_b_inst.numwords_a = 1000,
	main_0_b_inst.numwords_b = 1000,
	main_0_b_inst.latency = 1;


ram_dual_port main_0_c_inst (
	.clk (main_0_c_inst_clk),
	.clken (main_0_c_inst_clken),
	.address_a (main_0_c_inst_address_a),
	.wren_a (main_0_c_inst_wren_a),
	.data_a (main_0_c_inst_data_a),
	.byteena_a (main_0_c_inst_byteena_a),
	.q_a (main_0_c_inst_q_a),
	.address_b (main_0_c_inst_address_b),
	.wren_b (main_0_c_inst_wren_b),
	.data_b (main_0_c_inst_data_b),
	.byteena_b (main_0_c_inst_byteena_b),
	.q_b (main_0_c_inst_q_b)
);

defparam
	main_0_c_inst.width_a = 32,
	main_0_c_inst.width_b = 32,
	main_0_c_inst.widthad_a = 10,
	main_0_c_inst.widthad_b = 10,
	main_0_c_inst.width_be_a = 1,
	main_0_c_inst.width_be_b = 1,
	main_0_c_inst.numwords_a = 1000,
	main_0_c_inst.numwords_b = 1000,
	main_0_c_inst.latency = 1;


toy toy_inst (
	.clk (toy_inst_clk),
	.clk2x (toy_inst_clk2x),
	.clk1x_follower (toy_inst_clk1x_follower),
	.reset (toy_inst_reset),
	.memory_controller_waitrequest (toy_inst_memory_controller_waitrequest),
	.start (toy_inst_start),
	.finish (toy_inst_finish),
	.arg_a (toy_inst_arg_a),
	.arg_b (toy_inst_arg_b),
	.arg_c (toy_inst_arg_c),
	.main_0_a_write_enable_a (toy_inst_main_0_a_write_enable_a),
	.main_0_a_in_a (toy_inst_main_0_a_in_a),
	.main_0_a_byteena_a (toy_inst_main_0_a_byteena_a),
	.main_0_a_enable_a (toy_inst_main_0_a_enable_a),
	.main_0_a_address_a (toy_inst_main_0_a_address_a),
	.main_0_a_out_a (toy_inst_main_0_a_out_a),
	.main_0_a_write_enable_b (toy_inst_main_0_a_write_enable_b),
	.main_0_a_in_b (toy_inst_main_0_a_in_b),
	.main_0_a_byteena_b (toy_inst_main_0_a_byteena_b),
	.main_0_a_enable_b (toy_inst_main_0_a_enable_b),
	.main_0_a_address_b (toy_inst_main_0_a_address_b),
	.main_0_a_out_b (toy_inst_main_0_a_out_b),
	.main_0_b_write_enable_a (toy_inst_main_0_b_write_enable_a),
	.main_0_b_in_a (toy_inst_main_0_b_in_a),
	.main_0_b_byteena_a (toy_inst_main_0_b_byteena_a),
	.main_0_b_enable_a (toy_inst_main_0_b_enable_a),
	.main_0_b_address_a (toy_inst_main_0_b_address_a),
	.main_0_b_out_a (toy_inst_main_0_b_out_a),
	.main_0_b_write_enable_b (toy_inst_main_0_b_write_enable_b),
	.main_0_b_in_b (toy_inst_main_0_b_in_b),
	.main_0_b_byteena_b (toy_inst_main_0_b_byteena_b),
	.main_0_b_enable_b (toy_inst_main_0_b_enable_b),
	.main_0_b_address_b (toy_inst_main_0_b_address_b),
	.main_0_b_out_b (toy_inst_main_0_b_out_b),
	.main_0_c_write_enable_a (toy_inst_main_0_c_write_enable_a),
	.main_0_c_in_a (toy_inst_main_0_c_in_a),
	.main_0_c_byteena_a (toy_inst_main_0_c_byteena_a),
	.main_0_c_enable_a (toy_inst_main_0_c_enable_a),
	.main_0_c_address_a (toy_inst_main_0_c_address_a),
	.main_0_c_out_a (toy_inst_main_0_c_out_a),
	.main_0_c_write_enable_b (toy_inst_main_0_c_write_enable_b),
	.main_0_c_in_b (toy_inst_main_0_c_in_b),
	.main_0_c_byteena_b (toy_inst_main_0_c_byteena_b),
	.main_0_c_enable_b (toy_inst_main_0_c_enable_b),
	.main_0_c_address_b (toy_inst_main_0_c_address_b),
	.main_0_c_out_b (toy_inst_main_0_c_out_b)
);


// Local Rams

// End Local Rams

always @(*) begin
	main_inst_clk = clk;
end
always @(*) begin
	main_inst_clk2x = clk2x;
end
always @(*) begin
	main_inst_clk1x_follower = clk1x_follower;
end
always @(*) begin
	main_inst_reset = reset;
end
always @(*) begin
	main_inst_memory_controller_waitrequest = memory_controller_waitrequest;
end
always @(*) begin
	main_inst_start = start;
end
always @(*) begin
	main_inst_toy_finish = (~(toy_inst_start) & toy_inst_finish_reg);
end
always @(*) begin
	main_inst_main_0_a_out_a = main_0_a_inst_q_a;
end
always @(*) begin
	main_inst_main_0_a_out_b = main_0_a_inst_q_b;
end
always @(*) begin
	main_inst_main_0_b_out_a = main_0_b_inst_q_a;
end
always @(*) begin
	main_inst_main_0_b_out_b = main_0_b_inst_q_b;
end
always @(*) begin
	main_inst_main_0_c_out_a = main_0_c_inst_q_a;
end
always @(*) begin
	main_inst_main_0_c_out_b = main_0_c_inst_q_b;
end
always @(posedge clk) begin
	if ((reset | main_inst_start)) begin
		main_inst_finish_reg <= 1'd0;
	end
	if (main_inst_finish) begin
		main_inst_finish_reg <= 1'd1;
	end
end
always @(posedge clk) begin
	if ((reset | main_inst_start)) begin
		main_inst_return_val_reg <= 0;
	end
	if (main_inst_finish) begin
		main_inst_return_val_reg <= main_inst_return_val;
	end
end
always @(*) begin
	main_0_a_inst_clk = clk;
end
always @(*) begin
	main_0_a_inst_clken = ~(memory_controller_waitrequest);
end
always @(*) begin
	main_0_a_inst_address_a = (main_inst_main_0_a_address_a | toy_inst_main_0_a_address_a);
end
always @(*) begin
	main_0_a_inst_wren_a = (main_inst_main_0_a_write_enable_a | toy_inst_main_0_a_write_enable_a);
end
always @(*) begin
	main_0_a_inst_data_a = (main_inst_main_0_a_in_a | toy_inst_main_0_a_in_a);
end
always @(*) begin
	main_0_a_inst_address_b = (main_inst_main_0_a_address_b | toy_inst_main_0_a_address_b);
end
always @(*) begin
	main_0_a_inst_wren_b = (main_inst_main_0_a_write_enable_b | toy_inst_main_0_a_write_enable_b);
end
always @(*) begin
	main_0_a_inst_data_b = (main_inst_main_0_a_in_b | toy_inst_main_0_a_in_b);
end
always @(*) begin
	main_0_b_inst_clk = clk;
end
always @(*) begin
	main_0_b_inst_clken = ~(memory_controller_waitrequest);
end
always @(*) begin
	main_0_b_inst_address_a = (main_inst_main_0_b_address_a | toy_inst_main_0_b_address_a);
end
always @(*) begin
	main_0_b_inst_wren_a = (main_inst_main_0_b_write_enable_a | toy_inst_main_0_b_write_enable_a);
end
always @(*) begin
	main_0_b_inst_data_a = (main_inst_main_0_b_in_a | toy_inst_main_0_b_in_a);
end
always @(*) begin
	main_0_b_inst_address_b = (main_inst_main_0_b_address_b | toy_inst_main_0_b_address_b);
end
always @(*) begin
	main_0_b_inst_wren_b = (main_inst_main_0_b_write_enable_b | toy_inst_main_0_b_write_enable_b);
end
always @(*) begin
	main_0_b_inst_data_b = (main_inst_main_0_b_in_b | toy_inst_main_0_b_in_b);
end
always @(*) begin
	main_0_c_inst_clk = clk;
end
always @(*) begin
	main_0_c_inst_clken = ~(memory_controller_waitrequest);
end
always @(*) begin
	main_0_c_inst_address_a = (main_inst_main_0_c_address_a | toy_inst_main_0_c_address_a);
end
always @(*) begin
	main_0_c_inst_wren_a = (main_inst_main_0_c_write_enable_a | toy_inst_main_0_c_write_enable_a);
end
always @(*) begin
	main_0_c_inst_data_a = (main_inst_main_0_c_in_a | toy_inst_main_0_c_in_a);
end
always @(*) begin
	main_0_c_inst_address_b = (main_inst_main_0_c_address_b | toy_inst_main_0_c_address_b);
end
always @(*) begin
	main_0_c_inst_wren_b = (main_inst_main_0_c_write_enable_b | toy_inst_main_0_c_write_enable_b);
end
always @(*) begin
	main_0_c_inst_data_b = (main_inst_main_0_c_in_b | toy_inst_main_0_c_in_b);
end
always @(*) begin
	toy_inst_clk = clk;
end
always @(*) begin
	toy_inst_clk2x = clk2x;
end
always @(*) begin
	toy_inst_clk1x_follower = clk1x_follower;
end
always @(*) begin
	toy_inst_reset = reset;
end
always @(*) begin
	toy_inst_memory_controller_waitrequest = memory_controller_waitrequest;
end
always @(*) begin
	toy_inst_start = main_inst_toy_start;
end
always @(*) begin
	toy_inst_arg_a = main_inst_toy_arg_a;
end
always @(*) begin
	toy_inst_arg_b = main_inst_toy_arg_b;
end
always @(*) begin
	toy_inst_arg_c = main_inst_toy_arg_c;
end
always @(*) begin
	toy_inst_main_0_a_out_a = main_0_a_inst_q_a;
end
always @(*) begin
	toy_inst_main_0_a_out_b = main_0_a_inst_q_b;
end
always @(*) begin
	toy_inst_main_0_b_out_a = main_0_b_inst_q_a;
end
always @(*) begin
	toy_inst_main_0_b_out_b = main_0_b_inst_q_b;
end
always @(*) begin
	toy_inst_main_0_c_out_a = main_0_c_inst_q_a;
end
always @(*) begin
	toy_inst_main_0_c_out_b = main_0_c_inst_q_b;
end
always @(posedge clk) begin
	if ((reset | toy_inst_start)) begin
		toy_inst_finish_reg <= 1'd0;
	end
	if (toy_inst_finish) begin
		toy_inst_finish_reg <= 1'd1;
	end
end
always @(posedge clk) begin
	finish <= main_inst_finish;
end
always @(posedge clk) begin
	return_val <= main_inst_return_val;
end

endmodule
