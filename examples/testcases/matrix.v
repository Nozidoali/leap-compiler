//----------------------------------------------------------------------------
// LegUp High-Level Synthesis Tool Version 5.0 (http://legup.org)
// Copyright (c) 2009-23 University of Toronto. All Rights Reserved.
// For research and academic purposes only. Commercial use is prohibited.
// Please report bugs at: http://legup.org/bugs
// Please email questions to: legup@eecg.toronto.edu
// Date: Fri May 31 06:28:07 2024
// ----------------------------------------------------------------------------
`define MEMORY_CONTROLLER_ADDR_SIZE 32
`define MEMORY_CONTROLLER_DATA_SIZE 64
// Number of RAM elements: 3
`define MEMORY_CONTROLLER_TAG_SIZE 9
`timescale 1 ns / 1 ns
module matrix
(
	clk,
	clk2x,
	clk1x_follower,
	reset,
	memory_controller_waitrequest,
	start,
	finish,
	arg_in_a,
	arg_in_b,
	arg_out_c,
	main_0_in_a_write_enable_a,
	main_0_in_a_in_a,
	main_0_in_a_byteena_a,
	main_0_in_a_enable_a,
	main_0_in_a_address_a,
	main_0_in_a_out_a,
	main_0_in_a_write_enable_b,
	main_0_in_a_in_b,
	main_0_in_a_byteena_b,
	main_0_in_a_enable_b,
	main_0_in_a_address_b,
	main_0_in_a_out_b,
	main_0_in_b_write_enable_a,
	main_0_in_b_in_a,
	main_0_in_b_byteena_a,
	main_0_in_b_enable_a,
	main_0_in_b_address_a,
	main_0_in_b_out_a,
	main_0_in_b_write_enable_b,
	main_0_in_b_in_b,
	main_0_in_b_byteena_b,
	main_0_in_b_enable_b,
	main_0_in_b_address_b,
	main_0_in_b_out_b,
	main_0_out_c_write_enable_a,
	main_0_out_c_in_a,
	main_0_out_c_byteena_a,
	main_0_out_c_enable_a,
	main_0_out_c_address_a,
	main_0_out_c_out_a,
	main_0_out_c_write_enable_b,
	main_0_out_c_in_b,
	main_0_out_c_byteena_b,
	main_0_out_c_enable_b,
	main_0_out_c_address_b,
	main_0_out_c_out_b
);

parameter [3:0] LEGUP_0 = 4'd0;
parameter [3:0] LEGUP_F_matrix_BB__1_1 = 4'd1;
parameter [3:0] LEGUP_F_matrix_BB_preheaderpreheader_2 = 4'd2;
parameter [3:0] LEGUP_F_matrix_BB_preheaderpreheader_3 = 4'd3;
parameter [3:0] LEGUP_F_matrix_BB_preheader_4 = 4'd4;
parameter [3:0] LEGUP_F_matrix_BB_preheader_5 = 4'd5;
parameter [3:0] LEGUP_F_matrix_BB_preheader_6 = 4'd6;
parameter [3:0] LEGUP_F_matrix_BB_preheader_7 = 4'd7;
parameter [3:0] LEGUP_F_matrix_BB__12_8 = 4'd8;
parameter [3:0] LEGUP_F_matrix_BB__12_9 = 4'd9;
parameter [3:0] LEGUP_F_matrix_BB__14_10 = 4'd10;
parameter [3:0] LEGUP_F_matrix_BB__14_11 = 4'd11;
parameter [3:0] LEGUP_F_matrix_BB__16_12 = 4'd12;

input  clk;
input  clk2x;
input  clk1x_follower;
input  reset;
input  memory_controller_waitrequest;
input  start;
output reg  finish;
input [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] arg_in_a;
input [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] arg_in_b;
input [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] arg_out_c;
output  main_0_in_a_write_enable_a;
output [31:0] main_0_in_a_in_a;
output  main_0_in_a_byteena_a;
output reg  main_0_in_a_enable_a;
output reg [9:0] main_0_in_a_address_a;
input [31:0] main_0_in_a_out_a;
output  main_0_in_a_write_enable_b;
output [31:0] main_0_in_a_in_b;
output  main_0_in_a_byteena_b;
output  main_0_in_a_enable_b;
output [9:0] main_0_in_a_address_b;
input [31:0] main_0_in_a_out_b;
output  main_0_in_b_write_enable_a;
output [31:0] main_0_in_b_in_a;
output  main_0_in_b_byteena_a;
output reg  main_0_in_b_enable_a;
output reg [9:0] main_0_in_b_address_a;
input [31:0] main_0_in_b_out_a;
output  main_0_in_b_write_enable_b;
output [31:0] main_0_in_b_in_b;
output  main_0_in_b_byteena_b;
output  main_0_in_b_enable_b;
output [9:0] main_0_in_b_address_b;
input [31:0] main_0_in_b_out_b;
output reg  main_0_out_c_write_enable_a;
output reg [31:0] main_0_out_c_in_a;
output  main_0_out_c_byteena_a;
output reg  main_0_out_c_enable_a;
output reg [9:0] main_0_out_c_address_a;
input [31:0] main_0_out_c_out_a;
output  main_0_out_c_write_enable_b;
output [31:0] main_0_out_c_in_b;
output  main_0_out_c_byteena_b;
output  main_0_out_c_enable_b;
output [9:0] main_0_out_c_address_b;
input [31:0] main_0_out_c_out_b;
reg [3:0] cur_state;
reg [3:0] next_state;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] arg_in_a_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] arg_in_b_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] arg_out_c_reg;
reg  fsm_stall;
reg [5:0] matrix_1_i04;
reg [5:0] matrix_1_i04_reg;
reg [11:0] matrix_1_2;
reg [11:0] matrix_1_2_reg;
reg [31:0] matrix_preheaderpreheader_j03;
reg [31:0] matrix_preheaderpreheader_j03_reg;
reg [31:0] matrix_preheaderpreheader_3;
reg [31:0] matrix_preheaderpreheader_3_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] matrix_preheaderpreheader_scevgep4;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] matrix_preheaderpreheader_scevgep4_reg;
reg [31:0] matrix_preheader_sum_mult02;
reg [31:0] matrix_preheader_sum_mult02_reg;
reg [31:0] matrix_preheader_k01;
reg [31:0] matrix_preheader_k01_reg;
reg [31:0] matrix_preheader_4;
reg [31:0] matrix_preheader_4_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] matrix_preheader_scevgep2;
reg [31:0] matrix_preheader_5;
reg [31:0] matrix_preheader_6;
reg [31:0] matrix_preheader_6_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] matrix_preheader_scevgep;
reg [31:0] matrix_preheader_7;
reg [31:0] matrix_preheader_8;
reg [31:0] matrix_preheader_9;
reg [31:0] matrix_preheader_10;
reg [31:0] matrix_preheader_11;
reg [31:0] matrix_preheader_11_reg;
reg  matrix_preheader_exitcond2;
reg  matrix_preheader_exitcond2_reg;
reg [31:0] matrix_12_lcssa;
reg [31:0] matrix_12_lcssa_reg;
reg [31:0] matrix_12_13;
reg [31:0] matrix_12_13_reg;
reg  matrix_12_exitcond6;
reg [6:0] matrix_14_15;
reg [6:0] matrix_14_15_reg;
reg  matrix_14_exitcond;
reg  legup_mult_1_unsigned_32_32_1_0_clock;
reg  legup_mult_1_unsigned_32_32_1_0_aclr;
reg  legup_mult_1_unsigned_32_32_1_0_sum;
reg  legup_mult_1_unsigned_32_32_1_0_clken;
reg [31:0] legup_mult_1_unsigned_32_32_1_0_dataa;
reg [31:0] legup_mult_1_unsigned_32_32_1_0_datab;
wire [63:0] legup_mult_1_unsigned_32_32_1_0_result;
reg [63:0] legup_mult_matrix_preheader_9_out_actual;
reg [31:0] legup_mult_matrix_preheader_9_out;
reg  legup_mult_matrix_preheader_9_en;

/*   %9 = mul nsw i32 %7, %8, !MSB !5, !LSB !2, !extendFrom !5*/
legup_mult_1 legup_mult_1_unsigned_32_32_1_0 (
	.clock (legup_mult_1_unsigned_32_32_1_0_clock),
	.aclr (legup_mult_1_unsigned_32_32_1_0_aclr),
	.sum (legup_mult_1_unsigned_32_32_1_0_sum),
	.clken (legup_mult_1_unsigned_32_32_1_0_clken),
	.dataa (legup_mult_1_unsigned_32_32_1_0_dataa),
	.datab (legup_mult_1_unsigned_32_32_1_0_datab),
	.result (legup_mult_1_unsigned_32_32_1_0_result)
);

defparam
	legup_mult_1_unsigned_32_32_1_0.widtha = 32,
	legup_mult_1_unsigned_32_32_1_0.widthb = 32,
	legup_mult_1_unsigned_32_32_1_0.widthp = 64,
	legup_mult_1_unsigned_32_32_1_0.representation = "UNSIGNED";

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
		next_state = LEGUP_F_matrix_BB__1_1;
LEGUP_F_matrix_BB__12_8:
		next_state = LEGUP_F_matrix_BB__12_9;
LEGUP_F_matrix_BB__12_9:
	if ((fsm_stall == 1'd0) && (matrix_12_exitcond6 == 1'd1))
		next_state = LEGUP_F_matrix_BB__14_10;
	else if ((fsm_stall == 1'd0) && (matrix_12_exitcond6 == 1'd0))
		next_state = LEGUP_F_matrix_BB_preheaderpreheader_2;
LEGUP_F_matrix_BB__14_10:
		next_state = LEGUP_F_matrix_BB__14_11;
LEGUP_F_matrix_BB__14_11:
	if ((fsm_stall == 1'd0) && (matrix_14_exitcond == 1'd1))
		next_state = LEGUP_F_matrix_BB__16_12;
	else if ((fsm_stall == 1'd0) && (matrix_14_exitcond == 1'd0))
		next_state = LEGUP_F_matrix_BB__1_1;
LEGUP_F_matrix_BB__16_12:
		next_state = LEGUP_0;
LEGUP_F_matrix_BB__1_1:
		next_state = LEGUP_F_matrix_BB_preheaderpreheader_2;
LEGUP_F_matrix_BB_preheader_4:
		next_state = LEGUP_F_matrix_BB_preheader_5;
LEGUP_F_matrix_BB_preheader_5:
		next_state = LEGUP_F_matrix_BB_preheader_6;
LEGUP_F_matrix_BB_preheader_6:
		next_state = LEGUP_F_matrix_BB_preheader_7;
LEGUP_F_matrix_BB_preheader_7:
	if ((fsm_stall == 1'd0) && (matrix_preheader_exitcond2_reg == 1'd1))
		next_state = LEGUP_F_matrix_BB__12_8;
	else if ((fsm_stall == 1'd0) && (matrix_preheader_exitcond2_reg == 1'd0))
		next_state = LEGUP_F_matrix_BB_preheader_4;
LEGUP_F_matrix_BB_preheaderpreheader_2:
		next_state = LEGUP_F_matrix_BB_preheaderpreheader_3;
LEGUP_F_matrix_BB_preheaderpreheader_3:
		next_state = LEGUP_F_matrix_BB_preheader_4;
default:
	next_state = cur_state;
endcase

end
always @(posedge clk) begin
	if (start) begin
		arg_in_a_reg <= arg_in_a;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(arg_in_a) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to arg_in_a_reg"); $finish; end
		/* synthesis translate_on */
	end
end
always @(posedge clk) begin
	if (start) begin
		arg_in_b_reg <= arg_in_b;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(arg_in_b) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to arg_in_b_reg"); $finish; end
		/* synthesis translate_on */
	end
end
always @(posedge clk) begin
	if (start) begin
		arg_out_c_reg <= arg_out_c;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(arg_out_c) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to arg_out_c_reg"); $finish; end
		/* synthesis translate_on */
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
	/* matrix: %1*/
	/*   %i.04 = phi i32 [ 0, %0 ], [ %15, %14 ], !MSB !3, !LSB !2, !extendFrom !3*/
	if ((((cur_state == LEGUP_0) & (fsm_stall == 1'd0)) & (start == 1'd1))) begin
		matrix_1_i04 = 32'd0;
	end
	/* matrix: %1*/
	/*   %i.04 = phi i32 [ 0, %0 ], [ %15, %14 ], !MSB !3, !LSB !2, !extendFrom !3*/
	else /* if ((((cur_state == LEGUP_F_matrix_BB__14_11) & (fsm_stall == 1'd0)) & (matrix_14_exitcond == 1'd0))) */ begin
		matrix_1_i04 = matrix_14_15_reg;
	end
end
always @(posedge clk) begin
	/* matrix: %1*/
	/*   %i.04 = phi i32 [ 0, %0 ], [ %15, %14 ], !MSB !3, !LSB !2, !extendFrom !3*/
	if ((((cur_state == LEGUP_0) & (fsm_stall == 1'd0)) & (start == 1'd1))) begin
		matrix_1_i04_reg <= matrix_1_i04;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(matrix_1_i04) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to matrix_1_i04_reg"); $finish; end
		/* synthesis translate_on */
	end
	/* matrix: %1*/
	/*   %i.04 = phi i32 [ 0, %0 ], [ %15, %14 ], !MSB !3, !LSB !2, !extendFrom !3*/
	if ((((cur_state == LEGUP_F_matrix_BB__14_11) & (fsm_stall == 1'd0)) & (matrix_14_exitcond == 1'd0))) begin
		matrix_1_i04_reg <= matrix_1_i04;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(matrix_1_i04) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to matrix_1_i04_reg"); $finish; end
		/* synthesis translate_on */
	end
end
always @(*) begin
	/* matrix: %1*/
	/*   %2 = mul i32 %i.04, 32, !MSB !4, !LSB !3, !extendFrom !4*/
		matrix_1_2 = ({6'd0,matrix_1_i04_reg} * 32'd32);
end
always @(posedge clk) begin
	/* matrix: %1*/
	/*   %2 = mul i32 %i.04, 32, !MSB !4, !LSB !3, !extendFrom !4*/
	if ((cur_state == LEGUP_F_matrix_BB__1_1)) begin
		matrix_1_2_reg <= matrix_1_2;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(matrix_1_2) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to matrix_1_2_reg"); $finish; end
		/* synthesis translate_on */
	end
end
always @(*) begin
	/* matrix: %.preheader.preheader*/
	/*   %j.03 = phi i32 [ 0, %1 ], [ %13, %12 ], !MSB !5, !LSB !2, !extendFrom !5*/
	if (((cur_state == LEGUP_F_matrix_BB__1_1) & (fsm_stall == 1'd0))) begin
		matrix_preheaderpreheader_j03 = 32'd0;
	end
	/* matrix: %.preheader.preheader*/
	/*   %j.03 = phi i32 [ 0, %1 ], [ %13, %12 ], !MSB !5, !LSB !2, !extendFrom !5*/
	else /* if ((((cur_state == LEGUP_F_matrix_BB__12_9) & (fsm_stall == 1'd0)) & (matrix_12_exitcond6 == 1'd0))) */ begin
		matrix_preheaderpreheader_j03 = matrix_12_13_reg;
	end
end
always @(posedge clk) begin
	/* matrix: %.preheader.preheader*/
	/*   %j.03 = phi i32 [ 0, %1 ], [ %13, %12 ], !MSB !5, !LSB !2, !extendFrom !5*/
	if (((cur_state == LEGUP_F_matrix_BB__1_1) & (fsm_stall == 1'd0))) begin
		matrix_preheaderpreheader_j03_reg <= matrix_preheaderpreheader_j03;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(matrix_preheaderpreheader_j03) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to matrix_preheaderpreheader_j03_reg"); $finish; end
		/* synthesis translate_on */
	end
	/* matrix: %.preheader.preheader*/
	/*   %j.03 = phi i32 [ 0, %1 ], [ %13, %12 ], !MSB !5, !LSB !2, !extendFrom !5*/
	if ((((cur_state == LEGUP_F_matrix_BB__12_9) & (fsm_stall == 1'd0)) & (matrix_12_exitcond6 == 1'd0))) begin
		matrix_preheaderpreheader_j03_reg <= matrix_preheaderpreheader_j03;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(matrix_preheaderpreheader_j03) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to matrix_preheaderpreheader_j03_reg"); $finish; end
		/* synthesis translate_on */
	end
end
always @(*) begin
	/* matrix: %.preheader.preheader*/
	/*   %3 = add i32 %2, %j.03, !MSB !5, !LSB !2, !extendFrom !5*/
		matrix_preheaderpreheader_3 = ({20'd0,matrix_1_2_reg} + matrix_preheaderpreheader_j03_reg);
end
always @(posedge clk) begin
	/* matrix: %.preheader.preheader*/
	/*   %3 = add i32 %2, %j.03, !MSB !5, !LSB !2, !extendFrom !5*/
	if ((cur_state == LEGUP_F_matrix_BB_preheaderpreheader_2)) begin
		matrix_preheaderpreheader_3_reg <= matrix_preheaderpreheader_3;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(matrix_preheaderpreheader_3) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to matrix_preheaderpreheader_3_reg"); $finish; end
		/* synthesis translate_on */
	end
end
always @(*) begin
	/* matrix: %.preheader.preheader*/
	/*   %scevgep4 = getelementptr i32* %out_c, i32 %3, !MSB !1, !LSB !2, !extendFrom !1*/
		matrix_preheaderpreheader_scevgep4 = (arg_out_c_reg + (4 * matrix_preheaderpreheader_3_reg));
end
always @(posedge clk) begin
	/* matrix: %.preheader.preheader*/
	/*   %scevgep4 = getelementptr i32* %out_c, i32 %3, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_matrix_BB_preheaderpreheader_3)) begin
		matrix_preheaderpreheader_scevgep4_reg <= matrix_preheaderpreheader_scevgep4;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(matrix_preheaderpreheader_scevgep4) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to matrix_preheaderpreheader_scevgep4_reg"); $finish; end
		/* synthesis translate_on */
	end
end
always @(*) begin
	/* matrix: %.preheader*/
	/*   %sum_mult.02 = phi i32 [ 0, %.preheader.preheader ], [ %10, %.preheader ], !MSB !5, !LSB !2, !extendFrom !5*/
	if (((cur_state == LEGUP_F_matrix_BB_preheaderpreheader_3) & (fsm_stall == 1'd0))) begin
		matrix_preheader_sum_mult02 = 32'd0;
	end
	/* matrix: %.preheader*/
	/*   %sum_mult.02 = phi i32 [ 0, %.preheader.preheader ], [ %10, %.preheader ], !MSB !5, !LSB !2, !extendFrom !5*/
	else /* if ((((cur_state == LEGUP_F_matrix_BB_preheader_7) & (fsm_stall == 1'd0)) & (matrix_preheader_exitcond2_reg == 1'd0))) */ begin
		matrix_preheader_sum_mult02 = matrix_preheader_10;
	end
end
always @(posedge clk) begin
	/* matrix: %.preheader*/
	/*   %sum_mult.02 = phi i32 [ 0, %.preheader.preheader ], [ %10, %.preheader ], !MSB !5, !LSB !2, !extendFrom !5*/
	if (((cur_state == LEGUP_F_matrix_BB_preheaderpreheader_3) & (fsm_stall == 1'd0))) begin
		matrix_preheader_sum_mult02_reg <= matrix_preheader_sum_mult02;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(matrix_preheader_sum_mult02) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to matrix_preheader_sum_mult02_reg"); $finish; end
		/* synthesis translate_on */
	end
	/* matrix: %.preheader*/
	/*   %sum_mult.02 = phi i32 [ 0, %.preheader.preheader ], [ %10, %.preheader ], !MSB !5, !LSB !2, !extendFrom !5*/
	if ((((cur_state == LEGUP_F_matrix_BB_preheader_7) & (fsm_stall == 1'd0)) & (matrix_preheader_exitcond2_reg == 1'd0))) begin
		matrix_preheader_sum_mult02_reg <= matrix_preheader_sum_mult02;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(matrix_preheader_sum_mult02) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to matrix_preheader_sum_mult02_reg"); $finish; end
		/* synthesis translate_on */
	end
end
always @(*) begin
	/* matrix: %.preheader*/
	/*   %k.01 = phi i32 [ 0, %.preheader.preheader ], [ %11, %.preheader ], !MSB !5, !LSB !2, !extendFrom !5*/
	if (((cur_state == LEGUP_F_matrix_BB_preheaderpreheader_3) & (fsm_stall == 1'd0))) begin
		matrix_preheader_k01 = 32'd0;
	end
	/* matrix: %.preheader*/
	/*   %k.01 = phi i32 [ 0, %.preheader.preheader ], [ %11, %.preheader ], !MSB !5, !LSB !2, !extendFrom !5*/
	else /* if ((((cur_state == LEGUP_F_matrix_BB_preheader_7) & (fsm_stall == 1'd0)) & (matrix_preheader_exitcond2_reg == 1'd0))) */ begin
		matrix_preheader_k01 = matrix_preheader_11_reg;
	end
end
always @(posedge clk) begin
	/* matrix: %.preheader*/
	/*   %k.01 = phi i32 [ 0, %.preheader.preheader ], [ %11, %.preheader ], !MSB !5, !LSB !2, !extendFrom !5*/
	if (((cur_state == LEGUP_F_matrix_BB_preheaderpreheader_3) & (fsm_stall == 1'd0))) begin
		matrix_preheader_k01_reg <= matrix_preheader_k01;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(matrix_preheader_k01) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to matrix_preheader_k01_reg"); $finish; end
		/* synthesis translate_on */
	end
	/* matrix: %.preheader*/
	/*   %k.01 = phi i32 [ 0, %.preheader.preheader ], [ %11, %.preheader ], !MSB !5, !LSB !2, !extendFrom !5*/
	if ((((cur_state == LEGUP_F_matrix_BB_preheader_7) & (fsm_stall == 1'd0)) & (matrix_preheader_exitcond2_reg == 1'd0))) begin
		matrix_preheader_k01_reg <= matrix_preheader_k01;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(matrix_preheader_k01) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to matrix_preheader_k01_reg"); $finish; end
		/* synthesis translate_on */
	end
end
always @(*) begin
	/* matrix: %.preheader*/
	/*   %4 = add i32 %2, %k.01, !MSB !5, !LSB !2, !extendFrom !5*/
		matrix_preheader_4 = ({20'd0,matrix_1_2_reg} + matrix_preheader_k01_reg);
end
always @(posedge clk) begin
	/* matrix: %.preheader*/
	/*   %4 = add i32 %2, %k.01, !MSB !5, !LSB !2, !extendFrom !5*/
	if ((cur_state == LEGUP_F_matrix_BB_preheader_4)) begin
		matrix_preheader_4_reg <= matrix_preheader_4;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(matrix_preheader_4) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to matrix_preheader_4_reg"); $finish; end
		/* synthesis translate_on */
	end
end
always @(*) begin
	/* matrix: %.preheader*/
	/*   %scevgep2 = getelementptr i32* %in_a, i32 %4, !MSB !1, !LSB !2, !extendFrom !1*/
		matrix_preheader_scevgep2 = (arg_in_a_reg + (4 * matrix_preheader_4_reg));
end
always @(*) begin
	/* matrix: %.preheader*/
	/*   %5 = mul i32 %k.01, 32, !MSB !5, !LSB !3, !extendFrom !5*/
		matrix_preheader_5 = (matrix_preheader_k01_reg * 32'd32);
end
always @(*) begin
	/* matrix: %.preheader*/
	/*   %6 = add i32 %j.03, %5, !MSB !5, !LSB !2, !extendFrom !5*/
		matrix_preheader_6 = (matrix_preheaderpreheader_j03_reg + matrix_preheader_5);
end
always @(posedge clk) begin
	/* matrix: %.preheader*/
	/*   %6 = add i32 %j.03, %5, !MSB !5, !LSB !2, !extendFrom !5*/
	if ((cur_state == LEGUP_F_matrix_BB_preheader_4)) begin
		matrix_preheader_6_reg <= matrix_preheader_6;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(matrix_preheader_6) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to matrix_preheader_6_reg"); $finish; end
		/* synthesis translate_on */
	end
end
always @(*) begin
	/* matrix: %.preheader*/
	/*   %scevgep = getelementptr i32* %in_b, i32 %6, !MSB !1, !LSB !2, !extendFrom !1*/
		matrix_preheader_scevgep = (arg_in_b_reg + (4 * matrix_preheader_6_reg));
end
always @(*) begin
	/* matrix: %.preheader*/
	/*   %7 = load i32* %scevgep2, align 4, !MSB !5, !LSB !2, !extendFrom !5*/
		matrix_preheader_7 = main_0_in_a_out_a;
end
always @(*) begin
	/* matrix: %.preheader*/
	/*   %8 = load i32* %scevgep, align 4, !MSB !5, !LSB !2, !extendFrom !5*/
		matrix_preheader_8 = main_0_in_b_out_a;
end
always @(*) begin
	matrix_preheader_9 = legup_mult_matrix_preheader_9_out;
end
always @(*) begin
	/* matrix: %.preheader*/
	/*   %10 = add nsw i32 %sum_mult.02, %9, !MSB !5, !LSB !2, !extendFrom !5*/
		matrix_preheader_10 = (matrix_preheader_sum_mult02_reg + matrix_preheader_9);
end
always @(*) begin
	/* matrix: %.preheader*/
	/*   %11 = add nsw i32 %k.01, 1, !MSB !5, !LSB !2, !extendFrom !5*/
		matrix_preheader_11 = (matrix_preheader_k01_reg + 32'd1);
end
always @(posedge clk) begin
	/* matrix: %.preheader*/
	/*   %11 = add nsw i32 %k.01, 1, !MSB !5, !LSB !2, !extendFrom !5*/
	if ((cur_state == LEGUP_F_matrix_BB_preheader_4)) begin
		matrix_preheader_11_reg <= matrix_preheader_11;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(matrix_preheader_11) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to matrix_preheader_11_reg"); $finish; end
		/* synthesis translate_on */
	end
end
always @(*) begin
	/* matrix: %.preheader*/
	/*   %exitcond2 = icmp eq i32 %11, 32, !MSB !2, !LSB !2, !extendFrom !2*/
		matrix_preheader_exitcond2 = (matrix_preheader_11_reg == 32'd32);
end
always @(posedge clk) begin
	/* matrix: %.preheader*/
	/*   %exitcond2 = icmp eq i32 %11, 32, !MSB !2, !LSB !2, !extendFrom !2*/
	if ((cur_state == LEGUP_F_matrix_BB_preheader_5)) begin
		matrix_preheader_exitcond2_reg <= matrix_preheader_exitcond2;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(matrix_preheader_exitcond2) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to matrix_preheader_exitcond2_reg"); $finish; end
		/* synthesis translate_on */
	end
end
always @(*) begin
	/* matrix: %12*/
	/*   %.lcssa = phi i32 [ %10, %.preheader ], !MSB !5, !LSB !2, !extendFrom !5*/
		matrix_12_lcssa = matrix_preheader_10;
end
always @(posedge clk) begin
	/* matrix: %12*/
	/*   %.lcssa = phi i32 [ %10, %.preheader ], !MSB !5, !LSB !2, !extendFrom !5*/
	if ((((cur_state == LEGUP_F_matrix_BB_preheader_7) & (fsm_stall == 1'd0)) & (matrix_preheader_exitcond2_reg == 1'd1))) begin
		matrix_12_lcssa_reg <= matrix_12_lcssa;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(matrix_12_lcssa) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to matrix_12_lcssa_reg"); $finish; end
		/* synthesis translate_on */
	end
end
always @(*) begin
	/* matrix: %12*/
	/*   %13 = add nsw i32 %j.03, 1, !MSB !5, !LSB !2, !extendFrom !5*/
		matrix_12_13 = (matrix_preheaderpreheader_j03_reg + 32'd1);
end
always @(posedge clk) begin
	/* matrix: %12*/
	/*   %13 = add nsw i32 %j.03, 1, !MSB !5, !LSB !2, !extendFrom !5*/
	if ((cur_state == LEGUP_F_matrix_BB__12_8)) begin
		matrix_12_13_reg <= matrix_12_13;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(matrix_12_13) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to matrix_12_13_reg"); $finish; end
		/* synthesis translate_on */
	end
end
always @(*) begin
	/* matrix: %12*/
	/*   %exitcond6 = icmp eq i32 %13, 32, !MSB !2, !LSB !2, !extendFrom !2*/
		matrix_12_exitcond6 = (matrix_12_13_reg == 32'd32);
end
always @(*) begin
	/* matrix: %14*/
	/*   %15 = add nsw i32 %i.04, 1, !MSB !6, !LSB !2, !extendFrom !6*/
		matrix_14_15 = ({1'd0,matrix_1_i04_reg} + 32'd1);
end
always @(posedge clk) begin
	/* matrix: %14*/
	/*   %15 = add nsw i32 %i.04, 1, !MSB !6, !LSB !2, !extendFrom !6*/
	if ((cur_state == LEGUP_F_matrix_BB__14_10)) begin
		matrix_14_15_reg <= matrix_14_15;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(matrix_14_15) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to matrix_14_15_reg"); $finish; end
		/* synthesis translate_on */
	end
end
always @(*) begin
	/* matrix: %14*/
	/*   %exitcond = icmp eq i32 %15, 32, !MSB !2, !LSB !2, !extendFrom !2*/
		matrix_14_exitcond = (matrix_14_15_reg == 32'd32);
end
always @(*) begin
	legup_mult_1_unsigned_32_32_1_0_clock = clk;
end
always @(*) begin
	legup_mult_1_unsigned_32_32_1_0_aclr = reset;
end
always @(*) begin
	legup_mult_1_unsigned_32_32_1_0_sum = 1'd0;
if (reset) begin legup_mult_1_unsigned_32_32_1_0_sum = 0; end
end
always @(*) begin
	legup_mult_1_unsigned_32_32_1_0_clken = legup_mult_matrix_preheader_9_en;
end
always @(*) begin
	legup_mult_1_unsigned_32_32_1_0_dataa = matrix_preheader_7;
end
always @(*) begin
	legup_mult_1_unsigned_32_32_1_0_datab = matrix_preheader_8;
end
always @(*) begin
	legup_mult_matrix_preheader_9_out_actual = legup_mult_1_unsigned_32_32_1_0_result;
end
always @(*) begin
	legup_mult_matrix_preheader_9_out = legup_mult_matrix_preheader_9_out_actual[31:0];
end
always @(*) begin
	legup_mult_matrix_preheader_9_en = ~(fsm_stall);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		finish <= 1'd0;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(1'd0) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to finish"); $finish; end
		/* synthesis translate_on */
	end
	/* matrix: %16*/
	/*   ret void, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_matrix_BB__16_12)) begin
		finish <= (fsm_stall == 1'd0);
		/* synthesis translate_off */
		if (start == 1'b0 && ^((fsm_stall == 1'd0)) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to finish"); $finish; end
		/* synthesis translate_on */
	end
end
assign main_0_in_a_write_enable_a = 1'd0;
assign main_0_in_a_in_a = 0;
assign main_0_in_a_byteena_a = 1'd1;
always @(*) begin
	main_0_in_a_enable_a = 1'd0;
	/* matrix: %.preheader*/
	/*   %7 = load i32* %scevgep2, align 4, !MSB !5, !LSB !2, !extendFrom !5*/
	if ((cur_state == LEGUP_F_matrix_BB_preheader_5)) begin
		main_0_in_a_enable_a = 1'd1;
	end
end
always @(*) begin
	main_0_in_a_address_a = 10'd0;
	/* matrix: %.preheader*/
	/*   %7 = load i32* %scevgep2, align 4, !MSB !5, !LSB !2, !extendFrom !5*/
	if ((cur_state == LEGUP_F_matrix_BB_preheader_5)) begin
		main_0_in_a_address_a = (matrix_preheader_scevgep2 >>> 3'd2);
	end
end
assign main_0_in_a_write_enable_b = 1'd0;
assign main_0_in_a_in_b = 0;
assign main_0_in_a_byteena_b = 1'd1;
assign main_0_in_a_enable_b = 1'd0;
assign main_0_in_a_address_b = 10'd0;
assign main_0_in_b_write_enable_a = 1'd0;
assign main_0_in_b_in_a = 0;
assign main_0_in_b_byteena_a = 1'd1;
always @(*) begin
	main_0_in_b_enable_a = 1'd0;
	/* matrix: %.preheader*/
	/*   %8 = load i32* %scevgep, align 4, !MSB !5, !LSB !2, !extendFrom !5*/
	if ((cur_state == LEGUP_F_matrix_BB_preheader_5)) begin
		main_0_in_b_enable_a = 1'd1;
	end
end
always @(*) begin
	main_0_in_b_address_a = 10'd0;
	/* matrix: %.preheader*/
	/*   %8 = load i32* %scevgep, align 4, !MSB !5, !LSB !2, !extendFrom !5*/
	if ((cur_state == LEGUP_F_matrix_BB_preheader_5)) begin
		main_0_in_b_address_a = (matrix_preheader_scevgep >>> 3'd2);
	end
end
assign main_0_in_b_write_enable_b = 1'd0;
assign main_0_in_b_in_b = 0;
assign main_0_in_b_byteena_b = 1'd1;
assign main_0_in_b_enable_b = 1'd0;
assign main_0_in_b_address_b = 10'd0;
always @(*) begin
	main_0_out_c_write_enable_a = 1'd0;
	/* matrix: %12*/
	/*   store i32 %.lcssa, i32* %scevgep4, align 4, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_matrix_BB__12_8)) begin
		main_0_out_c_write_enable_a = 1'd1;
	end
end
always @(*) begin
	main_0_out_c_in_a = 0;
	/* matrix: %12*/
	/*   store i32 %.lcssa, i32* %scevgep4, align 4, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_matrix_BB__12_8)) begin
		main_0_out_c_in_a = matrix_12_lcssa_reg;
	end
end
assign main_0_out_c_byteena_a = 1'd1;
always @(*) begin
	main_0_out_c_enable_a = 1'd0;
	/* matrix: %12*/
	/*   store i32 %.lcssa, i32* %scevgep4, align 4, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_matrix_BB__12_8)) begin
		main_0_out_c_enable_a = 1'd1;
	end
end
always @(*) begin
	main_0_out_c_address_a = 10'd0;
	/* matrix: %12*/
	/*   store i32 %.lcssa, i32* %scevgep4, align 4, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_matrix_BB__12_8)) begin
		main_0_out_c_address_a = (matrix_preheaderpreheader_scevgep4_reg >>> 3'd2);
	end
end
assign main_0_out_c_write_enable_b = 1'd0;
assign main_0_out_c_in_b = 0;
assign main_0_out_c_byteena_b = 1'd1;
assign main_0_out_c_enable_b = 1'd0;
assign main_0_out_c_address_b = 10'd0;

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
	matrix_start,
	matrix_finish,
	matrix_arg_in_a,
	matrix_arg_in_b,
	matrix_arg_out_c,
	main_0_in_a_write_enable_a,
	main_0_in_a_in_a,
	main_0_in_a_byteena_a,
	main_0_in_a_enable_a,
	main_0_in_a_address_a,
	main_0_in_a_out_a,
	main_0_in_a_write_enable_b,
	main_0_in_a_in_b,
	main_0_in_a_byteena_b,
	main_0_in_a_enable_b,
	main_0_in_a_address_b,
	main_0_in_a_out_b,
	main_0_in_b_write_enable_a,
	main_0_in_b_in_a,
	main_0_in_b_byteena_a,
	main_0_in_b_enable_a,
	main_0_in_b_address_a,
	main_0_in_b_out_a,
	main_0_in_b_write_enable_b,
	main_0_in_b_in_b,
	main_0_in_b_byteena_b,
	main_0_in_b_enable_b,
	main_0_in_b_address_b,
	main_0_in_b_out_b,
	main_0_out_c_write_enable_a,
	main_0_out_c_in_a,
	main_0_out_c_byteena_a,
	main_0_out_c_enable_a,
	main_0_out_c_address_a,
	main_0_out_c_out_a,
	main_0_out_c_write_enable_b,
	main_0_out_c_in_b,
	main_0_out_c_byteena_b,
	main_0_out_c_enable_b,
	main_0_out_c_address_b,
	main_0_out_c_out_b
);

parameter [3:0] LEGUP_0 = 4'd0;
parameter [3:0] LEGUP_F_main_BB__0_1 = 4'd1;
parameter [3:0] LEGUP_F_main_BB__1_2 = 4'd2;
parameter [3:0] LEGUP_F_main_BB__3_3 = 4'd3;
parameter [3:0] LEGUP_F_main_BB__3_4 = 4'd4;
parameter [3:0] LEGUP_F_main_BB__3_5 = 4'd5;
parameter [3:0] LEGUP_F_main_BB__6_6 = 4'd6;
parameter [3:0] LEGUP_F_main_BB__6_7 = 4'd7;
parameter [3:0] LEGUP_F_main_BB__8_8 = 4'd8;
parameter [3:0] LEGUP_F_main_BB__8_10 = 4'd10;
parameter [3:0] LEGUP_F_main_BB__12_11 = 4'd11;
parameter [3:0] LEGUP_F_main_BB__12_12 = 4'd12;
parameter [3:0] LEGUP_F_main_BB__16_13 = 4'd13;
parameter [3:0] LEGUP_function_call_9 = 4'd9;

input  clk;
input  clk2x;
input  clk1x_follower;
input  reset;
input  memory_controller_waitrequest;
input  start;
output reg  finish;
output reg [31:0] return_val;
output reg  matrix_start;
input  matrix_finish;
output reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] matrix_arg_in_a;
output reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] matrix_arg_in_b;
output reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] matrix_arg_out_c;
output reg  main_0_in_a_write_enable_a;
output reg [31:0] main_0_in_a_in_a;
output  main_0_in_a_byteena_a;
output reg  main_0_in_a_enable_a;
output reg [9:0] main_0_in_a_address_a;
input [31:0] main_0_in_a_out_a;
output  main_0_in_a_write_enable_b;
output [31:0] main_0_in_a_in_b;
output  main_0_in_a_byteena_b;
output  main_0_in_a_enable_b;
output [9:0] main_0_in_a_address_b;
input [31:0] main_0_in_a_out_b;
output reg  main_0_in_b_write_enable_a;
output reg [31:0] main_0_in_b_in_a;
output  main_0_in_b_byteena_a;
output reg  main_0_in_b_enable_a;
output reg [9:0] main_0_in_b_address_a;
input [31:0] main_0_in_b_out_a;
output  main_0_in_b_write_enable_b;
output [31:0] main_0_in_b_in_b;
output  main_0_in_b_byteena_b;
output  main_0_in_b_enable_b;
output [9:0] main_0_in_b_address_b;
input [31:0] main_0_in_b_out_b;
output  main_0_out_c_write_enable_a;
output [31:0] main_0_out_c_in_a;
output  main_0_out_c_byteena_a;
output reg  main_0_out_c_enable_a;
output reg [9:0] main_0_out_c_address_a;
input [31:0] main_0_out_c_out_a;
output  main_0_out_c_write_enable_b;
output [31:0] main_0_out_c_in_b;
output  main_0_out_c_byteena_b;
output  main_0_out_c_enable_b;
output [9:0] main_0_out_c_address_b;
input [31:0] main_0_out_c_out_b;
reg [3:0] cur_state;
reg [3:0] next_state;
reg  fsm_stall;
reg [5:0] main_1_y03;
reg [5:0] main_1_y03_reg;
reg [11:0] main_1_2;
reg [11:0] main_1_2_reg;
reg [31:0] main_3_x02;
reg [31:0] main_3_x02_reg;
reg [31:0] main_3_4;
reg [31:0] main_3_4_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_3_scevgep3;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_3_scevgep2;
reg [31:0] main_3_5;
reg [31:0] main_3_5_reg;
reg  main_3_exitcond5;
reg  main_3_exitcond5_reg;
reg [6:0] main_6_7;
reg [6:0] main_6_7_reg;
reg  main_6_exitcond;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_8_9;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_8_10;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_8_11;
reg [10:0] main_12_i201;
reg [10:0] main_12_i201_reg;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_12_scevgep;
reg [31:0] main_12_13;
reg [11:0] main_12_15;
reg [11:0] main_12_15_reg;
reg  main_12_exitcond2;

// Local Rams

// End Local Rams

/* Unsynthesizable Statements */
/* synthesis translate_off */
always @(posedge clk)
	if (!fsm_stall) begin
	/* main: %12*/
	/*   %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %13) #2, !MSB !5, !LSB !2, !extendFrom !5*/
	if ((cur_state == LEGUP_F_main_BB__12_12)) begin
		$write("%d\n", $signed(main_12_13));
		// to fix quartus warning
		if (reset == 1'b0 && ^(main_12_13) === 1'bX) finish <= 0;
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
LEGUP_F_main_BB__12_11:
		next_state = LEGUP_F_main_BB__12_12;
LEGUP_F_main_BB__12_12:
	if ((fsm_stall == 1'd0) && (main_12_exitcond2 == 1'd1))
		next_state = LEGUP_F_main_BB__16_13;
	else if ((fsm_stall == 1'd0) && (main_12_exitcond2 == 1'd0))
		next_state = LEGUP_F_main_BB__12_11;
LEGUP_F_main_BB__16_13:
		next_state = LEGUP_0;
LEGUP_F_main_BB__1_2:
		next_state = LEGUP_F_main_BB__3_3;
LEGUP_F_main_BB__3_3:
		next_state = LEGUP_F_main_BB__3_4;
LEGUP_F_main_BB__3_4:
		next_state = LEGUP_F_main_BB__3_5;
LEGUP_F_main_BB__3_5:
	if ((fsm_stall == 1'd0) && (main_3_exitcond5_reg == 1'd1))
		next_state = LEGUP_F_main_BB__6_6;
	else if ((fsm_stall == 1'd0) && (main_3_exitcond5_reg == 1'd0))
		next_state = LEGUP_F_main_BB__3_3;
LEGUP_F_main_BB__6_6:
		next_state = LEGUP_F_main_BB__6_7;
LEGUP_F_main_BB__6_7:
	if ((fsm_stall == 1'd0) && (main_6_exitcond == 1'd1))
		next_state = LEGUP_F_main_BB__8_8;
	else if ((fsm_stall == 1'd0) && (main_6_exitcond == 1'd0))
		next_state = LEGUP_F_main_BB__1_2;
LEGUP_F_main_BB__8_10:
		next_state = LEGUP_F_main_BB__12_11;
LEGUP_F_main_BB__8_8:
		next_state = LEGUP_function_call_9;
LEGUP_function_call_9:
	if ((fsm_stall == 1'd0) && (matrix_finish == 1'd1))
		next_state = LEGUP_F_main_BB__8_10;
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
	/*   %y.03 = phi i32 [ 0, %0 ], [ %7, %6 ], !MSB !3, !LSB !2, !extendFrom !3*/
	if (((cur_state == LEGUP_F_main_BB__0_1) & (fsm_stall == 1'd0))) begin
		main_1_y03 = 32'd0;
	end
	/* main: %1*/
	/*   %y.03 = phi i32 [ 0, %0 ], [ %7, %6 ], !MSB !3, !LSB !2, !extendFrom !3*/
	else /* if ((((cur_state == LEGUP_F_main_BB__6_7) & (fsm_stall == 1'd0)) & (main_6_exitcond == 1'd0))) */ begin
		main_1_y03 = main_6_7_reg;
	end
end
always @(posedge clk) begin
	/* main: %1*/
	/*   %y.03 = phi i32 [ 0, %0 ], [ %7, %6 ], !MSB !3, !LSB !2, !extendFrom !3*/
	if (((cur_state == LEGUP_F_main_BB__0_1) & (fsm_stall == 1'd0))) begin
		main_1_y03_reg <= main_1_y03;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(main_1_y03) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_1_y03_reg"); $finish; end
		/* synthesis translate_on */
	end
	/* main: %1*/
	/*   %y.03 = phi i32 [ 0, %0 ], [ %7, %6 ], !MSB !3, !LSB !2, !extendFrom !3*/
	if ((((cur_state == LEGUP_F_main_BB__6_7) & (fsm_stall == 1'd0)) & (main_6_exitcond == 1'd0))) begin
		main_1_y03_reg <= main_1_y03;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(main_1_y03) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_1_y03_reg"); $finish; end
		/* synthesis translate_on */
	end
end
always @(*) begin
	/* main: %1*/
	/*   %2 = mul i32 %y.03, 32, !MSB !4, !LSB !3, !extendFrom !4*/
		main_1_2 = ({6'd0,main_1_y03_reg} * 32'd32);
end
always @(posedge clk) begin
	/* main: %1*/
	/*   %2 = mul i32 %y.03, 32, !MSB !4, !LSB !3, !extendFrom !4*/
	if ((cur_state == LEGUP_F_main_BB__1_2)) begin
		main_1_2_reg <= main_1_2;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(main_1_2) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_1_2_reg"); $finish; end
		/* synthesis translate_on */
	end
end
always @(*) begin
	/* main: %3*/
	/*   %x.02 = phi i32 [ 0, %1 ], [ %5, %3 ], !MSB !5, !LSB !2, !extendFrom !5*/
	if (((cur_state == LEGUP_F_main_BB__1_2) & (fsm_stall == 1'd0))) begin
		main_3_x02 = 32'd0;
	end
	/* main: %3*/
	/*   %x.02 = phi i32 [ 0, %1 ], [ %5, %3 ], !MSB !5, !LSB !2, !extendFrom !5*/
	else /* if ((((cur_state == LEGUP_F_main_BB__3_5) & (fsm_stall == 1'd0)) & (main_3_exitcond5_reg == 1'd0))) */ begin
		main_3_x02 = main_3_5_reg;
	end
end
always @(posedge clk) begin
	/* main: %3*/
	/*   %x.02 = phi i32 [ 0, %1 ], [ %5, %3 ], !MSB !5, !LSB !2, !extendFrom !5*/
	if (((cur_state == LEGUP_F_main_BB__1_2) & (fsm_stall == 1'd0))) begin
		main_3_x02_reg <= main_3_x02;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(main_3_x02) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_3_x02_reg"); $finish; end
		/* synthesis translate_on */
	end
	/* main: %3*/
	/*   %x.02 = phi i32 [ 0, %1 ], [ %5, %3 ], !MSB !5, !LSB !2, !extendFrom !5*/
	if ((((cur_state == LEGUP_F_main_BB__3_5) & (fsm_stall == 1'd0)) & (main_3_exitcond5_reg == 1'd0))) begin
		main_3_x02_reg <= main_3_x02;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(main_3_x02) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_3_x02_reg"); $finish; end
		/* synthesis translate_on */
	end
end
always @(*) begin
	/* main: %3*/
	/*   %4 = add i32 %2, %x.02, !MSB !5, !LSB !2, !extendFrom !5*/
		main_3_4 = ({20'd0,main_1_2_reg} + main_3_x02_reg);
end
always @(posedge clk) begin
	/* main: %3*/
	/*   %4 = add i32 %2, %x.02, !MSB !5, !LSB !2, !extendFrom !5*/
	if ((cur_state == LEGUP_F_main_BB__3_3)) begin
		main_3_4_reg <= main_3_4;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(main_3_4) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_3_4_reg"); $finish; end
		/* synthesis translate_on */
	end
end
always @(*) begin
	/* main: %3*/
	/*   %scevgep3 = getelementptr [1 x [1024 x i32]]* %in_a, i32 0, i32 0, i32 %4, !MSB !1, !LSB !2, !extendFrom !1*/
		main_3_scevgep3 = (1'd0 + (4 * main_3_4_reg));
end
always @(*) begin
	/* main: %3*/
	/*   %scevgep2 = getelementptr [1 x [1024 x i32]]* %in_b, i32 0, i32 0, i32 %4, !MSB !1, !LSB !2, !extendFrom !1*/
		main_3_scevgep2 = (1'd0 + (4 * main_3_4_reg));
end
always @(*) begin
	/* main: %3*/
	/*   %5 = add nsw i32 %x.02, 1, !MSB !5, !LSB !2, !extendFrom !5*/
		main_3_5 = (main_3_x02_reg + 32'd1);
end
always @(posedge clk) begin
	/* main: %3*/
	/*   %5 = add nsw i32 %x.02, 1, !MSB !5, !LSB !2, !extendFrom !5*/
	if ((cur_state == LEGUP_F_main_BB__3_3)) begin
		main_3_5_reg <= main_3_5;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(main_3_5) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_3_5_reg"); $finish; end
		/* synthesis translate_on */
	end
end
always @(*) begin
	/* main: %3*/
	/*   %exitcond5 = icmp eq i32 %5, 32, !MSB !2, !LSB !2, !extendFrom !2*/
		main_3_exitcond5 = (main_3_5_reg == 32'd32);
end
always @(posedge clk) begin
	/* main: %3*/
	/*   %exitcond5 = icmp eq i32 %5, 32, !MSB !2, !LSB !2, !extendFrom !2*/
	if ((cur_state == LEGUP_F_main_BB__3_4)) begin
		main_3_exitcond5_reg <= main_3_exitcond5;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(main_3_exitcond5) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_3_exitcond5_reg"); $finish; end
		/* synthesis translate_on */
	end
end
always @(*) begin
	/* main: %6*/
	/*   %7 = add nsw i32 %y.03, 1, !MSB !6, !LSB !2, !extendFrom !6*/
		main_6_7 = ({1'd0,main_1_y03_reg} + 32'd1);
end
always @(posedge clk) begin
	/* main: %6*/
	/*   %7 = add nsw i32 %y.03, 1, !MSB !6, !LSB !2, !extendFrom !6*/
	if ((cur_state == LEGUP_F_main_BB__6_6)) begin
		main_6_7_reg <= main_6_7;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(main_6_7) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_6_7_reg"); $finish; end
		/* synthesis translate_on */
	end
end
always @(*) begin
	/* main: %6*/
	/*   %exitcond = icmp eq i32 %7, 32, !MSB !2, !LSB !2, !extendFrom !2*/
		main_6_exitcond = (main_6_7_reg == 32'd32);
end
always @(*) begin
	/* main: %8*/
	/*   %9 = getelementptr inbounds [1 x [1024 x i32]]* %in_a, i32 0, i32 0, i32 0, !MSB !1, !LSB !2, !extendFrom !1*/
if (reset) begin main_8_9 = 0; end
		main_8_9 = 1'd0;
end
always @(*) begin
	/* main: %8*/
	/*   %10 = getelementptr inbounds [1 x [1024 x i32]]* %in_b, i32 0, i32 0, i32 0, !MSB !1, !LSB !2, !extendFrom !1*/
if (reset) begin main_8_10 = 0; end
		main_8_10 = 1'd0;
end
always @(*) begin
	/* main: %8*/
	/*   %11 = getelementptr inbounds [1 x [1024 x i32]]* %out_c, i32 0, i32 0, i32 0, !MSB !1, !LSB !2, !extendFrom !1*/
if (reset) begin main_8_11 = 0; end
		main_8_11 = 1'd0;
end
always @(*) begin
	/* main: %12*/
	/*   %i2.01 = phi i32 [ 0, %8 ], [ %15, %12 ], !MSB !7, !LSB !2, !extendFrom !7*/
	if (((cur_state == LEGUP_F_main_BB__8_10) & (fsm_stall == 1'd0))) begin
		main_12_i201 = 32'd0;
	end
	/* main: %12*/
	/*   %i2.01 = phi i32 [ 0, %8 ], [ %15, %12 ], !MSB !7, !LSB !2, !extendFrom !7*/
	else /* if ((((cur_state == LEGUP_F_main_BB__12_12) & (fsm_stall == 1'd0)) & (main_12_exitcond2 == 1'd0))) */ begin
		main_12_i201 = main_12_15_reg;
	end
end
always @(posedge clk) begin
	/* main: %12*/
	/*   %i2.01 = phi i32 [ 0, %8 ], [ %15, %12 ], !MSB !7, !LSB !2, !extendFrom !7*/
	if (((cur_state == LEGUP_F_main_BB__8_10) & (fsm_stall == 1'd0))) begin
		main_12_i201_reg <= main_12_i201;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(main_12_i201) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_12_i201_reg"); $finish; end
		/* synthesis translate_on */
	end
	/* main: %12*/
	/*   %i2.01 = phi i32 [ 0, %8 ], [ %15, %12 ], !MSB !7, !LSB !2, !extendFrom !7*/
	if ((((cur_state == LEGUP_F_main_BB__12_12) & (fsm_stall == 1'd0)) & (main_12_exitcond2 == 1'd0))) begin
		main_12_i201_reg <= main_12_i201;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(main_12_i201) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_12_i201_reg"); $finish; end
		/* synthesis translate_on */
	end
end
always @(*) begin
	/* main: %12*/
	/*   %scevgep = getelementptr [1 x [1024 x i32]]* %out_c, i32 0, i32 0, i32 %i2.01, !MSB !1, !LSB !2, !extendFrom !1*/
		main_12_scevgep = (1'd0 + (4 * {21'd0,main_12_i201_reg}));
end
always @(*) begin
	/* main: %12*/
	/*   %13 = load i32* %scevgep, align 4, !MSB !5, !LSB !2, !extendFrom !5*/
		main_12_13 = main_0_out_c_out_a;
end
always @(*) begin
	/* main: %12*/
	/*   %15 = add nsw i32 %i2.01, 1, !MSB !4, !LSB !2, !extendFrom !4*/
		main_12_15 = ({1'd0,main_12_i201_reg} + 32'd1);
end
always @(posedge clk) begin
	/* main: %12*/
	/*   %15 = add nsw i32 %i2.01, 1, !MSB !4, !LSB !2, !extendFrom !4*/
	if ((cur_state == LEGUP_F_main_BB__12_11)) begin
		main_12_15_reg <= main_12_15;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(main_12_15) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_12_15_reg"); $finish; end
		/* synthesis translate_on */
	end
end
always @(*) begin
	/* main: %12*/
	/*   %exitcond2 = icmp eq i32 %15, 1024, !MSB !2, !LSB !2, !extendFrom !2*/
		main_12_exitcond2 = (main_12_15_reg == 32'd1024);
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		finish <= 1'd0;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(1'd0) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to finish"); $finish; end
		/* synthesis translate_on */
	end
	/* main: %16*/
	/*   ret i32 0, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_main_BB__16_13)) begin
		finish <= (fsm_stall == 1'd0);
		/* synthesis translate_off */
		if (start == 1'b0 && ^((fsm_stall == 1'd0)) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to finish"); $finish; end
		/* synthesis translate_on */
	end
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		return_val <= 0;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(0) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to return_val"); $finish; end
		/* synthesis translate_on */
	end
	/* main: %16*/
	/*   ret i32 0, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_main_BB__16_13)) begin
		return_val <= 32'd0;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(32'd0) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to return_val"); $finish; end
		/* synthesis translate_on */
	end
end
always @(posedge clk) begin
	matrix_start <= 1'd0;
	/* main: %8*/
	/*   call fastcc void @matrix(i32* %9, i32* %10, i32* %11) #2, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_main_BB__8_8)) begin
		matrix_start <= 1'd1;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(1'd1) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to matrix_start"); $finish; end
		/* synthesis translate_on */
	end
	if ((cur_state == LEGUP_F_main_BB__8_10)) begin
		matrix_start <= 1'd0;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(1'd0) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to matrix_start"); $finish; end
		/* synthesis translate_on */
	end
end
always @(posedge clk) begin
	matrix_arg_in_a <= 0;
	/* main: %8*/
	/*   call fastcc void @matrix(i32* %9, i32* %10, i32* %11) #2, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_main_BB__8_8)) begin
		matrix_arg_in_a <= main_8_9;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(main_8_9) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to matrix_arg_in_a"); $finish; end
		/* synthesis translate_on */
	end
end
always @(posedge clk) begin
	matrix_arg_in_b <= 0;
	/* main: %8*/
	/*   call fastcc void @matrix(i32* %9, i32* %10, i32* %11) #2, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_main_BB__8_8)) begin
		matrix_arg_in_b <= main_8_10;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(main_8_10) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to matrix_arg_in_b"); $finish; end
		/* synthesis translate_on */
	end
end
always @(posedge clk) begin
	matrix_arg_out_c <= 0;
	/* main: %8*/
	/*   call fastcc void @matrix(i32* %9, i32* %10, i32* %11) #2, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_main_BB__8_8)) begin
		matrix_arg_out_c <= main_8_11;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(main_8_11) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to matrix_arg_out_c"); $finish; end
		/* synthesis translate_on */
	end
end
always @(*) begin
	main_0_in_a_write_enable_a = 1'd0;
	/* main: %3*/
	/*   store i32 1, i32* %scevgep3, align 4, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_main_BB__3_4)) begin
		main_0_in_a_write_enable_a = 1'd1;
	end
end
always @(*) begin
	main_0_in_a_in_a = 0;
	/* main: %3*/
	/*   store i32 1, i32* %scevgep3, align 4, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_main_BB__3_4)) begin
		main_0_in_a_in_a = 32'd1;
	end
end
assign main_0_in_a_byteena_a = 1'd1;
always @(*) begin
	main_0_in_a_enable_a = 1'd0;
	/* main: %3*/
	/*   store i32 1, i32* %scevgep3, align 4, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_main_BB__3_4)) begin
		main_0_in_a_enable_a = 1'd1;
	end
end
always @(*) begin
	main_0_in_a_address_a = 10'd0;
	/* main: %3*/
	/*   store i32 1, i32* %scevgep3, align 4, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_main_BB__3_4)) begin
		main_0_in_a_address_a = (main_3_scevgep3 >>> 3'd2);
	end
end
assign main_0_in_a_write_enable_b = 1'd0;
assign main_0_in_a_in_b = 0;
assign main_0_in_a_byteena_b = 1'd1;
assign main_0_in_a_enable_b = 1'd0;
assign main_0_in_a_address_b = 10'd0;
always @(*) begin
	main_0_in_b_write_enable_a = 1'd0;
	/* main: %3*/
	/*   store i32 1, i32* %scevgep2, align 4, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_main_BB__3_4)) begin
		main_0_in_b_write_enable_a = 1'd1;
	end
end
always @(*) begin
	main_0_in_b_in_a = 0;
	/* main: %3*/
	/*   store i32 1, i32* %scevgep2, align 4, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_main_BB__3_4)) begin
		main_0_in_b_in_a = 32'd1;
	end
end
assign main_0_in_b_byteena_a = 1'd1;
always @(*) begin
	main_0_in_b_enable_a = 1'd0;
	/* main: %3*/
	/*   store i32 1, i32* %scevgep2, align 4, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_main_BB__3_4)) begin
		main_0_in_b_enable_a = 1'd1;
	end
end
always @(*) begin
	main_0_in_b_address_a = 10'd0;
	/* main: %3*/
	/*   store i32 1, i32* %scevgep2, align 4, !MSB !1, !LSB !2, !extendFrom !1*/
	if ((cur_state == LEGUP_F_main_BB__3_4)) begin
		main_0_in_b_address_a = (main_3_scevgep2 >>> 3'd2);
	end
end
assign main_0_in_b_write_enable_b = 1'd0;
assign main_0_in_b_in_b = 0;
assign main_0_in_b_byteena_b = 1'd1;
assign main_0_in_b_enable_b = 1'd0;
assign main_0_in_b_address_b = 10'd0;
assign main_0_out_c_write_enable_a = 1'd0;
assign main_0_out_c_in_a = 0;
assign main_0_out_c_byteena_a = 1'd1;
always @(*) begin
	main_0_out_c_enable_a = 1'd0;
	/* main: %12*/
	/*   %13 = load i32* %scevgep, align 4, !MSB !5, !LSB !2, !extendFrom !5*/
	if ((cur_state == LEGUP_F_main_BB__12_11)) begin
		main_0_out_c_enable_a = 1'd1;
	end
end
always @(*) begin
	main_0_out_c_address_a = 10'd0;
	/* main: %12*/
	/*   %13 = load i32* %scevgep, align 4, !MSB !5, !LSB !2, !extendFrom !5*/
	if ((cur_state == LEGUP_F_main_BB__12_11)) begin
		main_0_out_c_address_a = (main_12_scevgep >>> 3'd2);
	end
end
assign main_0_out_c_write_enable_b = 1'd0;
assign main_0_out_c_in_b = 0;
assign main_0_out_c_byteena_b = 1'd1;
assign main_0_out_c_enable_b = 1'd0;
assign main_0_out_c_address_b = 10'd0;

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
wire  main_inst_matrix_start;
reg  main_inst_matrix_finish;
wire [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_inst_matrix_arg_in_a;
wire [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_inst_matrix_arg_in_b;
wire [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] main_inst_matrix_arg_out_c;
wire  main_inst_main_0_in_a_write_enable_a;
wire [31:0] main_inst_main_0_in_a_in_a;
wire  main_inst_main_0_in_a_byteena_a;
wire  main_inst_main_0_in_a_enable_a;
wire [9:0] main_inst_main_0_in_a_address_a;
reg [31:0] main_inst_main_0_in_a_out_a;
wire  main_inst_main_0_in_a_write_enable_b;
wire [31:0] main_inst_main_0_in_a_in_b;
wire  main_inst_main_0_in_a_byteena_b;
wire  main_inst_main_0_in_a_enable_b;
wire [9:0] main_inst_main_0_in_a_address_b;
reg [31:0] main_inst_main_0_in_a_out_b;
wire  main_inst_main_0_in_b_write_enable_a;
wire [31:0] main_inst_main_0_in_b_in_a;
wire  main_inst_main_0_in_b_byteena_a;
wire  main_inst_main_0_in_b_enable_a;
wire [9:0] main_inst_main_0_in_b_address_a;
reg [31:0] main_inst_main_0_in_b_out_a;
wire  main_inst_main_0_in_b_write_enable_b;
wire [31:0] main_inst_main_0_in_b_in_b;
wire  main_inst_main_0_in_b_byteena_b;
wire  main_inst_main_0_in_b_enable_b;
wire [9:0] main_inst_main_0_in_b_address_b;
reg [31:0] main_inst_main_0_in_b_out_b;
wire  main_inst_main_0_out_c_write_enable_a;
wire [31:0] main_inst_main_0_out_c_in_a;
wire  main_inst_main_0_out_c_byteena_a;
wire  main_inst_main_0_out_c_enable_a;
wire [9:0] main_inst_main_0_out_c_address_a;
reg [31:0] main_inst_main_0_out_c_out_a;
wire  main_inst_main_0_out_c_write_enable_b;
wire [31:0] main_inst_main_0_out_c_in_b;
wire  main_inst_main_0_out_c_byteena_b;
wire  main_inst_main_0_out_c_enable_b;
wire [9:0] main_inst_main_0_out_c_address_b;
reg [31:0] main_inst_main_0_out_c_out_b;
reg  main_inst_finish_reg;
reg [31:0] main_inst_return_val_reg;
reg  main_0_in_a_inst_clk;
reg  main_0_in_a_inst_clken;
reg [9:0] main_0_in_a_inst_address_a;
reg  main_0_in_a_inst_wren_a;
reg [31:0] main_0_in_a_inst_data_a;
wire  main_0_in_a_inst_byteena_a;
wire [31:0] main_0_in_a_inst_q_a;
reg [9:0] main_0_in_a_inst_address_b;
reg  main_0_in_a_inst_wren_b;
reg [31:0] main_0_in_a_inst_data_b;
wire  main_0_in_a_inst_byteena_b;
wire [31:0] main_0_in_a_inst_q_b;
reg  main_0_in_b_inst_clk;
reg  main_0_in_b_inst_clken;
reg [9:0] main_0_in_b_inst_address_a;
reg  main_0_in_b_inst_wren_a;
reg [31:0] main_0_in_b_inst_data_a;
wire  main_0_in_b_inst_byteena_a;
wire [31:0] main_0_in_b_inst_q_a;
reg [9:0] main_0_in_b_inst_address_b;
reg  main_0_in_b_inst_wren_b;
reg [31:0] main_0_in_b_inst_data_b;
wire  main_0_in_b_inst_byteena_b;
wire [31:0] main_0_in_b_inst_q_b;
reg  main_0_out_c_inst_clk;
reg  main_0_out_c_inst_clken;
reg [9:0] main_0_out_c_inst_address_a;
reg  main_0_out_c_inst_wren_a;
reg [31:0] main_0_out_c_inst_data_a;
wire  main_0_out_c_inst_byteena_a;
wire [31:0] main_0_out_c_inst_q_a;
reg [9:0] main_0_out_c_inst_address_b;
reg  main_0_out_c_inst_wren_b;
reg [31:0] main_0_out_c_inst_data_b;
wire  main_0_out_c_inst_byteena_b;
wire [31:0] main_0_out_c_inst_q_b;
reg  matrix_inst_clk;
reg  matrix_inst_clk2x;
reg  matrix_inst_clk1x_follower;
reg  matrix_inst_reset;
reg  matrix_inst_memory_controller_waitrequest;
reg  matrix_inst_start;
wire  matrix_inst_finish;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] matrix_inst_arg_in_a;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] matrix_inst_arg_in_b;
reg [`MEMORY_CONTROLLER_ADDR_SIZE-1:0] matrix_inst_arg_out_c;
wire  matrix_inst_main_0_in_a_write_enable_a;
wire [31:0] matrix_inst_main_0_in_a_in_a;
wire  matrix_inst_main_0_in_a_byteena_a;
wire  matrix_inst_main_0_in_a_enable_a;
wire [9:0] matrix_inst_main_0_in_a_address_a;
reg [31:0] matrix_inst_main_0_in_a_out_a;
wire  matrix_inst_main_0_in_a_write_enable_b;
wire [31:0] matrix_inst_main_0_in_a_in_b;
wire  matrix_inst_main_0_in_a_byteena_b;
wire  matrix_inst_main_0_in_a_enable_b;
wire [9:0] matrix_inst_main_0_in_a_address_b;
reg [31:0] matrix_inst_main_0_in_a_out_b;
wire  matrix_inst_main_0_in_b_write_enable_a;
wire [31:0] matrix_inst_main_0_in_b_in_a;
wire  matrix_inst_main_0_in_b_byteena_a;
wire  matrix_inst_main_0_in_b_enable_a;
wire [9:0] matrix_inst_main_0_in_b_address_a;
reg [31:0] matrix_inst_main_0_in_b_out_a;
wire  matrix_inst_main_0_in_b_write_enable_b;
wire [31:0] matrix_inst_main_0_in_b_in_b;
wire  matrix_inst_main_0_in_b_byteena_b;
wire  matrix_inst_main_0_in_b_enable_b;
wire [9:0] matrix_inst_main_0_in_b_address_b;
reg [31:0] matrix_inst_main_0_in_b_out_b;
wire  matrix_inst_main_0_out_c_write_enable_a;
wire [31:0] matrix_inst_main_0_out_c_in_a;
wire  matrix_inst_main_0_out_c_byteena_a;
wire  matrix_inst_main_0_out_c_enable_a;
wire [9:0] matrix_inst_main_0_out_c_address_a;
reg [31:0] matrix_inst_main_0_out_c_out_a;
wire  matrix_inst_main_0_out_c_write_enable_b;
wire [31:0] matrix_inst_main_0_out_c_in_b;
wire  matrix_inst_main_0_out_c_byteena_b;
wire  matrix_inst_main_0_out_c_enable_b;
wire [9:0] matrix_inst_main_0_out_c_address_b;
reg [31:0] matrix_inst_main_0_out_c_out_b;
reg  matrix_inst_finish_reg;


main main_inst (
	.clk (main_inst_clk),
	.clk2x (main_inst_clk2x),
	.clk1x_follower (main_inst_clk1x_follower),
	.reset (main_inst_reset),
	.memory_controller_waitrequest (main_inst_memory_controller_waitrequest),
	.start (main_inst_start),
	.finish (main_inst_finish),
	.return_val (main_inst_return_val),
	.matrix_start (main_inst_matrix_start),
	.matrix_finish (main_inst_matrix_finish),
	.matrix_arg_in_a (main_inst_matrix_arg_in_a),
	.matrix_arg_in_b (main_inst_matrix_arg_in_b),
	.matrix_arg_out_c (main_inst_matrix_arg_out_c),
	.main_0_in_a_write_enable_a (main_inst_main_0_in_a_write_enable_a),
	.main_0_in_a_in_a (main_inst_main_0_in_a_in_a),
	.main_0_in_a_byteena_a (main_inst_main_0_in_a_byteena_a),
	.main_0_in_a_enable_a (main_inst_main_0_in_a_enable_a),
	.main_0_in_a_address_a (main_inst_main_0_in_a_address_a),
	.main_0_in_a_out_a (main_inst_main_0_in_a_out_a),
	.main_0_in_a_write_enable_b (main_inst_main_0_in_a_write_enable_b),
	.main_0_in_a_in_b (main_inst_main_0_in_a_in_b),
	.main_0_in_a_byteena_b (main_inst_main_0_in_a_byteena_b),
	.main_0_in_a_enable_b (main_inst_main_0_in_a_enable_b),
	.main_0_in_a_address_b (main_inst_main_0_in_a_address_b),
	.main_0_in_a_out_b (main_inst_main_0_in_a_out_b),
	.main_0_in_b_write_enable_a (main_inst_main_0_in_b_write_enable_a),
	.main_0_in_b_in_a (main_inst_main_0_in_b_in_a),
	.main_0_in_b_byteena_a (main_inst_main_0_in_b_byteena_a),
	.main_0_in_b_enable_a (main_inst_main_0_in_b_enable_a),
	.main_0_in_b_address_a (main_inst_main_0_in_b_address_a),
	.main_0_in_b_out_a (main_inst_main_0_in_b_out_a),
	.main_0_in_b_write_enable_b (main_inst_main_0_in_b_write_enable_b),
	.main_0_in_b_in_b (main_inst_main_0_in_b_in_b),
	.main_0_in_b_byteena_b (main_inst_main_0_in_b_byteena_b),
	.main_0_in_b_enable_b (main_inst_main_0_in_b_enable_b),
	.main_0_in_b_address_b (main_inst_main_0_in_b_address_b),
	.main_0_in_b_out_b (main_inst_main_0_in_b_out_b),
	.main_0_out_c_write_enable_a (main_inst_main_0_out_c_write_enable_a),
	.main_0_out_c_in_a (main_inst_main_0_out_c_in_a),
	.main_0_out_c_byteena_a (main_inst_main_0_out_c_byteena_a),
	.main_0_out_c_enable_a (main_inst_main_0_out_c_enable_a),
	.main_0_out_c_address_a (main_inst_main_0_out_c_address_a),
	.main_0_out_c_out_a (main_inst_main_0_out_c_out_a),
	.main_0_out_c_write_enable_b (main_inst_main_0_out_c_write_enable_b),
	.main_0_out_c_in_b (main_inst_main_0_out_c_in_b),
	.main_0_out_c_byteena_b (main_inst_main_0_out_c_byteena_b),
	.main_0_out_c_enable_b (main_inst_main_0_out_c_enable_b),
	.main_0_out_c_address_b (main_inst_main_0_out_c_address_b),
	.main_0_out_c_out_b (main_inst_main_0_out_c_out_b)
);



ram_dual_port main_0_in_a_inst (
	.clk (main_0_in_a_inst_clk),
	.clken (main_0_in_a_inst_clken),
	.address_a (main_0_in_a_inst_address_a),
	.wren_a (main_0_in_a_inst_wren_a),
	.data_a (main_0_in_a_inst_data_a),
	.byteena_a (main_0_in_a_inst_byteena_a),
	.q_a (main_0_in_a_inst_q_a),
	.address_b (main_0_in_a_inst_address_b),
	.wren_b (main_0_in_a_inst_wren_b),
	.data_b (main_0_in_a_inst_data_b),
	.byteena_b (main_0_in_a_inst_byteena_b),
	.q_b (main_0_in_a_inst_q_b)
);

defparam
	main_0_in_a_inst.width_a = 32,
	main_0_in_a_inst.width_b = 32,
	main_0_in_a_inst.widthad_a = 10,
	main_0_in_a_inst.widthad_b = 10,
	main_0_in_a_inst.width_be_a = 1,
	main_0_in_a_inst.width_be_b = 1,
	main_0_in_a_inst.numwords_a = 1024,
	main_0_in_a_inst.numwords_b = 1024,
	main_0_in_a_inst.latency = 1;


ram_dual_port main_0_in_b_inst (
	.clk (main_0_in_b_inst_clk),
	.clken (main_0_in_b_inst_clken),
	.address_a (main_0_in_b_inst_address_a),
	.wren_a (main_0_in_b_inst_wren_a),
	.data_a (main_0_in_b_inst_data_a),
	.byteena_a (main_0_in_b_inst_byteena_a),
	.q_a (main_0_in_b_inst_q_a),
	.address_b (main_0_in_b_inst_address_b),
	.wren_b (main_0_in_b_inst_wren_b),
	.data_b (main_0_in_b_inst_data_b),
	.byteena_b (main_0_in_b_inst_byteena_b),
	.q_b (main_0_in_b_inst_q_b)
);

defparam
	main_0_in_b_inst.width_a = 32,
	main_0_in_b_inst.width_b = 32,
	main_0_in_b_inst.widthad_a = 10,
	main_0_in_b_inst.widthad_b = 10,
	main_0_in_b_inst.width_be_a = 1,
	main_0_in_b_inst.width_be_b = 1,
	main_0_in_b_inst.numwords_a = 1024,
	main_0_in_b_inst.numwords_b = 1024,
	main_0_in_b_inst.latency = 1;


ram_dual_port main_0_out_c_inst (
	.clk (main_0_out_c_inst_clk),
	.clken (main_0_out_c_inst_clken),
	.address_a (main_0_out_c_inst_address_a),
	.wren_a (main_0_out_c_inst_wren_a),
	.data_a (main_0_out_c_inst_data_a),
	.byteena_a (main_0_out_c_inst_byteena_a),
	.q_a (main_0_out_c_inst_q_a),
	.address_b (main_0_out_c_inst_address_b),
	.wren_b (main_0_out_c_inst_wren_b),
	.data_b (main_0_out_c_inst_data_b),
	.byteena_b (main_0_out_c_inst_byteena_b),
	.q_b (main_0_out_c_inst_q_b)
);

defparam
	main_0_out_c_inst.width_a = 32,
	main_0_out_c_inst.width_b = 32,
	main_0_out_c_inst.widthad_a = 10,
	main_0_out_c_inst.widthad_b = 10,
	main_0_out_c_inst.width_be_a = 1,
	main_0_out_c_inst.width_be_b = 1,
	main_0_out_c_inst.numwords_a = 1024,
	main_0_out_c_inst.numwords_b = 1024,
	main_0_out_c_inst.latency = 1;


matrix matrix_inst (
	.clk (matrix_inst_clk),
	.clk2x (matrix_inst_clk2x),
	.clk1x_follower (matrix_inst_clk1x_follower),
	.reset (matrix_inst_reset),
	.memory_controller_waitrequest (matrix_inst_memory_controller_waitrequest),
	.start (matrix_inst_start),
	.finish (matrix_inst_finish),
	.arg_in_a (matrix_inst_arg_in_a),
	.arg_in_b (matrix_inst_arg_in_b),
	.arg_out_c (matrix_inst_arg_out_c),
	.main_0_in_a_write_enable_a (matrix_inst_main_0_in_a_write_enable_a),
	.main_0_in_a_in_a (matrix_inst_main_0_in_a_in_a),
	.main_0_in_a_byteena_a (matrix_inst_main_0_in_a_byteena_a),
	.main_0_in_a_enable_a (matrix_inst_main_0_in_a_enable_a),
	.main_0_in_a_address_a (matrix_inst_main_0_in_a_address_a),
	.main_0_in_a_out_a (matrix_inst_main_0_in_a_out_a),
	.main_0_in_a_write_enable_b (matrix_inst_main_0_in_a_write_enable_b),
	.main_0_in_a_in_b (matrix_inst_main_0_in_a_in_b),
	.main_0_in_a_byteena_b (matrix_inst_main_0_in_a_byteena_b),
	.main_0_in_a_enable_b (matrix_inst_main_0_in_a_enable_b),
	.main_0_in_a_address_b (matrix_inst_main_0_in_a_address_b),
	.main_0_in_a_out_b (matrix_inst_main_0_in_a_out_b),
	.main_0_in_b_write_enable_a (matrix_inst_main_0_in_b_write_enable_a),
	.main_0_in_b_in_a (matrix_inst_main_0_in_b_in_a),
	.main_0_in_b_byteena_a (matrix_inst_main_0_in_b_byteena_a),
	.main_0_in_b_enable_a (matrix_inst_main_0_in_b_enable_a),
	.main_0_in_b_address_a (matrix_inst_main_0_in_b_address_a),
	.main_0_in_b_out_a (matrix_inst_main_0_in_b_out_a),
	.main_0_in_b_write_enable_b (matrix_inst_main_0_in_b_write_enable_b),
	.main_0_in_b_in_b (matrix_inst_main_0_in_b_in_b),
	.main_0_in_b_byteena_b (matrix_inst_main_0_in_b_byteena_b),
	.main_0_in_b_enable_b (matrix_inst_main_0_in_b_enable_b),
	.main_0_in_b_address_b (matrix_inst_main_0_in_b_address_b),
	.main_0_in_b_out_b (matrix_inst_main_0_in_b_out_b),
	.main_0_out_c_write_enable_a (matrix_inst_main_0_out_c_write_enable_a),
	.main_0_out_c_in_a (matrix_inst_main_0_out_c_in_a),
	.main_0_out_c_byteena_a (matrix_inst_main_0_out_c_byteena_a),
	.main_0_out_c_enable_a (matrix_inst_main_0_out_c_enable_a),
	.main_0_out_c_address_a (matrix_inst_main_0_out_c_address_a),
	.main_0_out_c_out_a (matrix_inst_main_0_out_c_out_a),
	.main_0_out_c_write_enable_b (matrix_inst_main_0_out_c_write_enable_b),
	.main_0_out_c_in_b (matrix_inst_main_0_out_c_in_b),
	.main_0_out_c_byteena_b (matrix_inst_main_0_out_c_byteena_b),
	.main_0_out_c_enable_b (matrix_inst_main_0_out_c_enable_b),
	.main_0_out_c_address_b (matrix_inst_main_0_out_c_address_b),
	.main_0_out_c_out_b (matrix_inst_main_0_out_c_out_b)
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
	main_inst_matrix_finish = (~(matrix_inst_start) & matrix_inst_finish_reg);
end
always @(*) begin
	main_inst_main_0_in_a_out_a = main_0_in_a_inst_q_a;
end
always @(*) begin
	main_inst_main_0_in_a_out_b = main_0_in_a_inst_q_b;
end
always @(*) begin
	main_inst_main_0_in_b_out_a = main_0_in_b_inst_q_a;
end
always @(*) begin
	main_inst_main_0_in_b_out_b = main_0_in_b_inst_q_b;
end
always @(*) begin
	main_inst_main_0_out_c_out_a = main_0_out_c_inst_q_a;
end
always @(*) begin
	main_inst_main_0_out_c_out_b = main_0_out_c_inst_q_b;
end
always @(posedge clk) begin
	if ((reset | main_inst_start)) begin
		main_inst_finish_reg <= 1'd0;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(1'd0) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_inst_finish_reg"); $finish; end
		/* synthesis translate_on */
	end
	if (main_inst_finish) begin
		main_inst_finish_reg <= 1'd1;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(1'd1) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_inst_finish_reg"); $finish; end
		/* synthesis translate_on */
	end
end
always @(posedge clk) begin
	if ((reset | main_inst_start)) begin
		main_inst_return_val_reg <= 0;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(0) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_inst_return_val_reg"); $finish; end
		/* synthesis translate_on */
	end
	if (main_inst_finish) begin
		main_inst_return_val_reg <= main_inst_return_val;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(main_inst_return_val) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to main_inst_return_val_reg"); $finish; end
		/* synthesis translate_on */
	end
end
always @(*) begin
	main_0_in_a_inst_clk = clk;
end
always @(*) begin
	main_0_in_a_inst_clken = ~(memory_controller_waitrequest);
end
always @(*) begin
	main_0_in_a_inst_address_a = (main_inst_main_0_in_a_address_a | matrix_inst_main_0_in_a_address_a);
end
always @(*) begin
	main_0_in_a_inst_wren_a = (main_inst_main_0_in_a_write_enable_a | matrix_inst_main_0_in_a_write_enable_a);
end
always @(*) begin
	main_0_in_a_inst_data_a = (main_inst_main_0_in_a_in_a | matrix_inst_main_0_in_a_in_a);
end
always @(*) begin
	main_0_in_a_inst_address_b = (main_inst_main_0_in_a_address_b | matrix_inst_main_0_in_a_address_b);
end
always @(*) begin
	main_0_in_a_inst_wren_b = (main_inst_main_0_in_a_write_enable_b | matrix_inst_main_0_in_a_write_enable_b);
end
always @(*) begin
	main_0_in_a_inst_data_b = (main_inst_main_0_in_a_in_b | matrix_inst_main_0_in_a_in_b);
end
always @(*) begin
	main_0_in_b_inst_clk = clk;
end
always @(*) begin
	main_0_in_b_inst_clken = ~(memory_controller_waitrequest);
end
always @(*) begin
	main_0_in_b_inst_address_a = (main_inst_main_0_in_b_address_a | matrix_inst_main_0_in_b_address_a);
end
always @(*) begin
	main_0_in_b_inst_wren_a = (main_inst_main_0_in_b_write_enable_a | matrix_inst_main_0_in_b_write_enable_a);
end
always @(*) begin
	main_0_in_b_inst_data_a = (main_inst_main_0_in_b_in_a | matrix_inst_main_0_in_b_in_a);
end
always @(*) begin
	main_0_in_b_inst_address_b = (main_inst_main_0_in_b_address_b | matrix_inst_main_0_in_b_address_b);
end
always @(*) begin
	main_0_in_b_inst_wren_b = (main_inst_main_0_in_b_write_enable_b | matrix_inst_main_0_in_b_write_enable_b);
end
always @(*) begin
	main_0_in_b_inst_data_b = (main_inst_main_0_in_b_in_b | matrix_inst_main_0_in_b_in_b);
end
always @(*) begin
	main_0_out_c_inst_clk = clk;
end
always @(*) begin
	main_0_out_c_inst_clken = ~(memory_controller_waitrequest);
end
always @(*) begin
	main_0_out_c_inst_address_a = (main_inst_main_0_out_c_address_a | matrix_inst_main_0_out_c_address_a);
end
always @(*) begin
	main_0_out_c_inst_wren_a = (main_inst_main_0_out_c_write_enable_a | matrix_inst_main_0_out_c_write_enable_a);
end
always @(*) begin
	main_0_out_c_inst_data_a = (main_inst_main_0_out_c_in_a | matrix_inst_main_0_out_c_in_a);
end
always @(*) begin
	main_0_out_c_inst_address_b = (main_inst_main_0_out_c_address_b | matrix_inst_main_0_out_c_address_b);
end
always @(*) begin
	main_0_out_c_inst_wren_b = (main_inst_main_0_out_c_write_enable_b | matrix_inst_main_0_out_c_write_enable_b);
end
always @(*) begin
	main_0_out_c_inst_data_b = (main_inst_main_0_out_c_in_b | matrix_inst_main_0_out_c_in_b);
end
always @(*) begin
	matrix_inst_clk = clk;
end
always @(*) begin
	matrix_inst_clk2x = clk2x;
end
always @(*) begin
	matrix_inst_clk1x_follower = clk1x_follower;
end
always @(*) begin
	matrix_inst_reset = reset;
end
always @(*) begin
	matrix_inst_memory_controller_waitrequest = memory_controller_waitrequest;
end
always @(*) begin
	matrix_inst_start = main_inst_matrix_start;
end
always @(*) begin
	matrix_inst_arg_in_a = main_inst_matrix_arg_in_a;
end
always @(*) begin
	matrix_inst_arg_in_b = main_inst_matrix_arg_in_b;
end
always @(*) begin
	matrix_inst_arg_out_c = main_inst_matrix_arg_out_c;
end
always @(*) begin
	matrix_inst_main_0_in_a_out_a = main_0_in_a_inst_q_a;
end
always @(*) begin
	matrix_inst_main_0_in_a_out_b = main_0_in_a_inst_q_b;
end
always @(*) begin
	matrix_inst_main_0_in_b_out_a = main_0_in_b_inst_q_a;
end
always @(*) begin
	matrix_inst_main_0_in_b_out_b = main_0_in_b_inst_q_b;
end
always @(*) begin
	matrix_inst_main_0_out_c_out_a = main_0_out_c_inst_q_a;
end
always @(*) begin
	matrix_inst_main_0_out_c_out_b = main_0_out_c_inst_q_b;
end
always @(posedge clk) begin
	if ((reset | matrix_inst_start)) begin
		matrix_inst_finish_reg <= 1'd0;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(1'd0) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to matrix_inst_finish_reg"); $finish; end
		/* synthesis translate_on */
	end
	if (matrix_inst_finish) begin
		matrix_inst_finish_reg <= 1'd1;
		/* synthesis translate_off */
		if (start == 1'b0 && ^(1'd1) === 1'bX) begin $display ("ERROR: Right hand side is 'X'. Assigned to matrix_inst_finish_reg"); $finish; end
		/* synthesis translate_on */
	end
end
always @(posedge clk) begin
	finish <= main_inst_finish;
end
always @(posedge clk) begin
	return_val <= main_inst_return_val;
end

endmodule
