// Project
// A simpler version of the project
// which is only a 8*8 array

module Project_VMU(pixel, weight, preset, clk, reset, memory);

// total bits of input pixels is 8*8=64bits
// total bits of input weights is 8*8=64bits
input [63:0] pixel;
input [63:0] weight;
input preset, clk, reset;

// each intersection is 8*8 multiplication and addition, so is 16 bits
// there are 64 intersections in total, so output is 16*8*8=1024 bits
output [1023:0] memory;

// but it is better to slice the output into different sets


//we need to slice the two inputs into different sets
wire [7:0] pixel0;
wire [7:0] pixel1;
wire [7:0] pixel2;
wire [7:0] pixel3;
wire [7:0] pixel4;
wire [7:0] pixel5;
wire [7:0] pixel6;
wire [7:0] pixel7;

wire [7:0] weight0;
wire [7:0] weight1;
wire [7:0] weight2;
wire [7:0] weight3;
wire [7:0] weight4;
wire [7:0] weight5;
wire [7:0] weight6;
wire [7:0] weight7;


//used to represent the output of each intersection
wire [15:0] convolution_ping0;
wire [15:0] convolution_ping1;
wire [15:0] convolution_ping2;
wire [15:0] convolution_ping3;
wire [15:0] convolution_ping4;
wire [15:0] convolution_ping5;
wire [15:0] convolution_ping6;
wire [15:0] convolution_ping7;

wire [15:0] convolution_ping8;
wire [15:0] convolution_ping9;
wire [15:0] convolution_ping10;
wire [15:0] convolution_ping11;
wire [15:0] convolution_ping12;
wire [15:0] convolution_ping13;
wire [15:0] convolution_ping14;
wire [15:0] convolution_ping15;

wire [15:0] convolution_ping16;
wire [15:0] convolution_ping17;
wire [15:0] convolution_ping18;
wire [15:0] convolution_ping19;
wire [15:0] convolution_ping20;
wire [15:0] convolution_ping21;
wire [15:0] convolution_ping22;
wire [15:0] convolution_ping23;

wire [15:0] convolution_ping24;
wire [15:0] convolution_ping25;
wire [15:0] convolution_ping26;
wire [15:0] convolution_ping27;
wire [15:0] convolution_ping28;
wire [15:0] convolution_ping29;
wire [15:0] convolution_ping30;
wire [15:0] convolution_ping31;

wire [15:0] convolution_ping32;
wire [15:0] convolution_ping33;
wire [15:0] convolution_ping34;
wire [15:0] convolution_ping35;
wire [15:0] convolution_ping36;
wire [15:0] convolution_ping37;
wire [15:0] convolution_ping38;
wire [15:0] convolution_ping39;

wire [15:0] convolution_ping40;
wire [15:0] convolution_ping41;
wire [15:0] convolution_ping42;
wire [15:0] convolution_ping43;
wire [15:0] convolution_ping44;
wire [15:0] convolution_ping45;
wire [15:0] convolution_ping46;
wire [15:0] convolution_ping47;

wire [15:0] convolution_ping48;
wire [15:0] convolution_ping49;
wire [15:0] convolution_ping50;
wire [15:0] convolution_ping51;
wire [15:0] convolution_ping52;
wire [15:0] convolution_ping53;
wire [15:0] convolution_ping54;
wire [15:0] convolution_ping55;

wire [15:0] convolution_ping56;
wire [15:0] convolution_ping57;
wire [15:0] convolution_ping58;
wire [15:0] convolution_ping59;
wire [15:0] convolution_ping60;
wire [15:0] convolution_ping61;
wire [15:0] convolution_ping62;
wire [15:0] convolution_ping63;






wire [15:0] convolution_pong0;
wire [15:0] convolution_pong1;
wire [15:0] convolution_pong2;
wire [15:0] convolution_pong3;
wire [15:0] convolution_pong4;
wire [15:0] convolution_pong5;
wire [15:0] convolution_pong6;
wire [15:0] convolution_pong7;

wire [15:0] convolution_pong8;
wire [15:0] convolution_pong9;
wire [15:0] convolution_pong10;
wire [15:0] convolution_pong11;
wire [15:0] convolution_pong12;
wire [15:0] convolution_pong13;
wire [15:0] convolution_pong14;
wire [15:0] convolution_pong15;

wire [15:0] convolution_pong16;
wire [15:0] convolution_pong17;
wire [15:0] convolution_pong18;
wire [15:0] convolution_pong19;
wire [15:0] convolution_pong20;
wire [15:0] convolution_pong21;
wire [15:0] convolution_pong22;
wire [15:0] convolution_pong23;

wire [15:0] convolution_pong24;
wire [15:0] convolution_pong25;
wire [15:0] convolution_pong26;
wire [15:0] convolution_pong27;
wire [15:0] convolution_pong28;
wire [15:0] convolution_pong29;
wire [15:0] convolution_pong30;
wire [15:0] convolution_pong31;

wire [15:0] convolution_pong32;
wire [15:0] convolution_pong33;
wire [15:0] convolution_pong34;
wire [15:0] convolution_pong35;
wire [15:0] convolution_pong36;
wire [15:0] convolution_pong37;
wire [15:0] convolution_pong38;
wire [15:0] convolution_pong39;

wire [15:0] convolution_pong40;
wire [15:0] convolution_pong41;
wire [15:0] convolution_pong42;
wire [15:0] convolution_pong43;
wire [15:0] convolution_pong44;
wire [15:0] convolution_pong45;
wire [15:0] convolution_pong46;
wire [15:0] convolution_pong47;

wire [15:0] convolution_pong48;
wire [15:0] convolution_pong49;
wire [15:0] convolution_pong50;
wire [15:0] convolution_pong51;
wire [15:0] convolution_pong52;
wire [15:0] convolution_pong53;
wire [15:0] convolution_pong54;
wire [15:0] convolution_pong55;

wire [15:0] convolution_pong56;
wire [15:0] convolution_pong57;
wire [15:0] convolution_pong58;
wire [15:0] convolution_pong59;
wire [15:0] convolution_pong60;
wire [15:0] convolution_pong61;
wire [15:0] convolution_pong62;
wire [15:0] convolution_pong63;


wire [1023:0] pingout;
wire [1023:0] pongout;
wire [1023:0] storage;



// allocate pixel(x) to the corresponding inputs
assign pixel0 = pixel[7:0];
assign pixel1 = pixel[15:8];
assign pixel2 = pixel[23:16];
assign pixel3 = pixel[31:24];
assign pixel4 = pixel[39:32];
assign pixel5 = pixel[47:40];
assign pixel6 = pixel[55:48];
assign pixel7 = pixel[63:56];

assign weight0 = weight[7:0];
assign weight1 = weight[15:8];
assign weight2 = weight[23:16];
assign weight3 = weight[31:24];
assign weight4 = weight[39:32];
assign weight5 = weight[47:40];
assign weight6 = weight[55:48];
assign weight7 = weight[63:56];




VMU_with_PingPong VMU0(pixel0, weight0, preset, clk, reset, convolution_ping0, convolution_pong0);
VMU_with_PingPong VMU1(pixel1, weight0, preset, clk, reset, convolution_ping1, convolution_pong1);
VMU_with_PingPong VMU2(pixel2, weight0, preset, clk, reset, convolution_ping2, convolution_pong2);
VMU_with_PingPong VMU3(pixel3, weight0, preset, clk, reset, convolution_ping3, convolution_pong3);
VMU_with_PingPong VMU4(pixel4, weight0, preset, clk, reset, convolution_ping4, convolution_pong4);
VMU_with_PingPong VMU5(pixel5, weight0, preset, clk, reset, convolution_ping5, convolution_pong5);
VMU_with_PingPong VMU6(pixel6, weight0, preset, clk, reset, convolution_ping6, convolution_pong6);
VMU_with_PingPong VMU7(pixel7, weight0, preset, clk, reset, convolution_ping7, convolution_pong7);

VMU_with_PingPong VMU8(pixel0, weight1, preset, clk, reset, convolution_ping8, convolution_pong8);
VMU_with_PingPong VMU9(pixel1, weight1, preset, clk, reset, convolution_ping9, convolution_pong9);
VMU_with_PingPong VMU10(pixel2, weight1, preset, clk, reset, convolution_ping10, convolution_pong10);
VMU_with_PingPong VMU11(pixel3, weight1, preset, clk, reset, convolution_ping11, convolution_pong11);
VMU_with_PingPong VMU12(pixel4, weight1, preset, clk, reset, convolution_ping12, convolution_pong12);
VMU_with_PingPong VMU13(pixel5, weight1, preset, clk, reset, convolution_ping13, convolution_pong13);
VMU_with_PingPong VMU14(pixel6, weight1, preset, clk, reset, convolution_ping14, convolution_pong14);
VMU_with_PingPong VMU15(pixel7, weight1, preset, clk, reset, convolution_ping15, convolution_pong15);

VMU_with_PingPong VMU16(pixel0, weight2, preset, clk, reset, convolution_ping16, convolution_pong16);
VMU_with_PingPong VMU17(pixel1, weight2, preset, clk, reset, convolution_ping17, convolution_pong17);
VMU_with_PingPong VMU18(pixel2, weight2, preset, clk, reset, convolution_ping18, convolution_pong18);
VMU_with_PingPong VMU19(pixel3, weight2, preset, clk, reset, convolution_ping19, convolution_pong19);
VMU_with_PingPong VMU20(pixel4, weight2, preset, clk, reset, convolution_ping20, convolution_pong20);
VMU_with_PingPong VMU21(pixel5, weight2, preset, clk, reset, convolution_ping21, convolution_pong21);
VMU_with_PingPong VMU22(pixel6, weight2, preset, clk, reset, convolution_ping22, convolution_pong22);
VMU_with_PingPong VMU23(pixel7, weight2, preset, clk, reset, convolution_ping23, convolution_pong23);

VMU_with_PingPong VMU24(pixel0, weight3, preset, clk, reset, convolution_ping24, convolution_pong24);
VMU_with_PingPong VMU25(pixel1, weight3, preset, clk, reset, convolution_ping25, convolution_pong25);
VMU_with_PingPong VMU26(pixel2, weight3, preset, clk, reset, convolution_ping26, convolution_pong26);
VMU_with_PingPong VMU27(pixel3, weight3, preset, clk, reset, convolution_ping27, convolution_pong27);
VMU_with_PingPong VMU28(pixel4, weight3, preset, clk, reset, convolution_ping28, convolution_pong28);
VMU_with_PingPong VMU29(pixel5, weight3, preset, clk, reset, convolution_ping29, convolution_pong29);
VMU_with_PingPong VMU30(pixel6, weight3, preset, clk, reset, convolution_ping30, convolution_pong30);
VMU_with_PingPong VMU31(pixel7, weight3, preset, clk, reset, convolution_ping31, convolution_pong31);

VMU_with_PingPong VMU32(pixel0, weight4, preset, clk, reset, convolution_ping32, convolution_pong32);
VMU_with_PingPong VMU33(pixel1, weight4, preset, clk, reset, convolution_ping33, convolution_pong33);
VMU_with_PingPong VMU34(pixel2, weight4, preset, clk, reset, convolution_ping34, convolution_pong34);
VMU_with_PingPong VMU35(pixel3, weight4, preset, clk, reset, convolution_ping35, convolution_pong35);
VMU_with_PingPong VMU36(pixel4, weight4, preset, clk, reset, convolution_ping36, convolution_pong36);
VMU_with_PingPong VMU37(pixel5, weight4, preset, clk, reset, convolution_ping37, convolution_pong37);
VMU_with_PingPong VMU38(pixel6, weight4, preset, clk, reset, convolution_ping38, convolution_pong38);
VMU_with_PingPong VMU39(pixel7, weight4, preset, clk, reset, convolution_ping39, convolution_pong39);

VMU_with_PingPong VMU40(pixel0, weight5, preset, clk, reset, convolution_ping40, convolution_pong40);
VMU_with_PingPong VMU41(pixel1, weight5, preset, clk, reset, convolution_ping41, convolution_pong41);
VMU_with_PingPong VMU42(pixel2, weight5, preset, clk, reset, convolution_ping42, convolution_pong42);
VMU_with_PingPong VMU43(pixel3, weight5, preset, clk, reset, convolution_ping43, convolution_pong43);
VMU_with_PingPong VMU44(pixel4, weight5, preset, clk, reset, convolution_ping44, convolution_pong44);
VMU_with_PingPong VMU45(pixel5, weight5, preset, clk, reset, convolution_ping45, convolution_pong45);
VMU_with_PingPong VMU46(pixel6, weight5, preset, clk, reset, convolution_ping46, convolution_pong46);
VMU_with_PingPong VMU47(pixel7, weight5, preset, clk, reset, convolution_ping47, convolution_pong47);

VMU_with_PingPong VMU48(pixel0, weight6, preset, clk, reset, convolution_ping48, convolution_pong48);
VMU_with_PingPong VMU49(pixel1, weight6, preset, clk, reset, convolution_ping49, convolution_pong49);
VMU_with_PingPong VMU50(pixel2, weight6, preset, clk, reset, convolution_ping50, convolution_pong50);
VMU_with_PingPong VMU51(pixel3, weight6, preset, clk, reset, convolution_ping51, convolution_pong51);
VMU_with_PingPong VMU52(pixel4, weight6, preset, clk, reset, convolution_ping52, convolution_pong52);
VMU_with_PingPong VMU53(pixel5, weight6, preset, clk, reset, convolution_ping53, convolution_pong53);
VMU_with_PingPong VMU54(pixel6, weight6, preset, clk, reset, convolution_ping54, convolution_pong54);
VMU_with_PingPong VMU55(pixel7, weight6, preset, clk, reset, convolution_ping55, convolution_pong55);

VMU_with_PingPong VMU56(pixel0, weight7, preset, clk, reset, convolution_ping56, convolution_pong56);
VMU_with_PingPong VMU57(pixel1, weight7, preset, clk, reset, convolution_ping57, convolution_pong57);
VMU_with_PingPong VMU58(pixel2, weight7, preset, clk, reset, convolution_ping58, convolution_pong58);
VMU_with_PingPong VMU59(pixel3, weight7, preset, clk, reset, convolution_ping59, convolution_pong59);
VMU_with_PingPong VMU60(pixel4, weight7, preset, clk, reset, convolution_ping60, convolution_pong60);
VMU_with_PingPong VMU61(pixel5, weight7, preset, clk, reset, convolution_ping61, convolution_pong61);
VMU_with_PingPong VMU62(pixel6, weight7, preset, clk, reset, convolution_ping62, convolution_pong62);
VMU_with_PingPong VMU63(pixel7, weight7, preset, clk, reset, convolution_ping63, convolution_pong63);


// the arrangment of outputs
// we need to select the output which is either from ping or pong (i.e. the one just finished the calculation)


assign pongout = {convolution_pong63, convolution_pong62, convolution_pong61, convolution_pong60, convolution_pong59, convolution_pong58, convolution_pong57, convolution_pong56,
					convolution_pong55, convolution_pong54, convolution_pong53, convolution_pong52, convolution_pong51, convolution_pong50, 
					convolution_pong49, convolution_pong48, convolution_pong47, convolution_pong46, convolution_pong45, convolution_pong44, convolution_pong43, convolution_pong42, convolution_pong41, convolution_pong40, 
					convolution_pong39, convolution_pong38, convolution_pong37, convolution_pong36, convolution_pong35, convolution_pong34, convolution_pong33, convolution_pong32, convolution_pong31, convolution_pong30, 
					convolution_pong29, convolution_pong28, convolution_pong27, convolution_pong26, convolution_pong25, convolution_pong24, convolution_pong23, convolution_pong22, convolution_pong21, convolution_pong20, 
					convolution_pong19, convolution_pong18, convolution_pong17, convolution_pong16, convolution_pong15, convolution_pong14, convolution_pong13, convolution_pong12, convolution_pong11, convolution_pong10, 
					convolution_pong9, convolution_pong8, convolution_pong7, convolution_pong6, convolution_pong5, convolution_pong4, convolution_pong3, convolution_pong2, convolution_pong1, convolution_pong0};

assign pingout = {convolution_ping63, convolution_ping62, convolution_ping61, convolution_ping60, convolution_ping59, convolution_ping58, convolution_ping57, convolution_ping56,
					convolution_ping55, convolution_ping54, convolution_ping53, convolution_ping52, convolution_ping51, convolution_ping50, 
					convolution_ping49, convolution_ping48, convolution_ping47, convolution_ping46, convolution_ping45, convolution_ping44, convolution_ping43, convolution_ping42, convolution_ping41, convolution_ping40, 
					convolution_ping39, convolution_ping38, convolution_ping37, convolution_ping36, convolution_ping35, convolution_ping34, convolution_ping33, convolution_ping32, convolution_ping31, convolution_ping30, 
					convolution_ping29, convolution_ping28, convolution_ping27, convolution_ping26, convolution_ping25, convolution_ping24, convolution_ping23, convolution_ping22, convolution_ping21, convolution_ping20, 
					convolution_ping19, convolution_ping18, convolution_ping17, convolution_ping16, convolution_ping15, convolution_ping14, convolution_ping13, convolution_ping12, convolution_ping11, convolution_ping10, 
					convolution_ping9, convolution_ping8, convolution_ping7, convolution_ping6, convolution_ping5, convolution_ping4, convolution_ping3, convolution_ping2, convolution_ping1, convolution_ping0};

MUX MUX1(pingout, pongout, preset, storage);

assign memory = storage;

endmodule



module MUX(pingout, pongout, preset, storage);

input [1023:0] pingout;
input [1023:0] pongout;
input preset;
output [1023:0] storage;

assign storage = preset ? pingout : pongout;


endmodule




//-----------------------------------------------------following is the part of one single VMU-------------------------------------------------------------
// VMU_with_Ping_Pong
// EESM5020 Project---VMU Design
// this verilog code is for only one intersection
// assumption: the size of the filter is 5*5
// the size of the input picture does not really matter


module VMU_with_PingPong(pixel, weight, preset, clk, reset, accum1out, accum2out);

// the input will be changing, but they need to be buffered clock by clock
input [7:0] pixel;
input [7:0] weight;
input clk,reset,preset;

// the output is the sum of 25 values
// two 8-bit data multiplied together will give us a 16-bit data
// ---------------------------------------Is there any risk to use output reg?----------------
output reg [15:0] accum1out;
output reg [15:0] accum2out;


// how the input data comes
// every clock cycle, we do one matrix multiplication
// if the filter is 5*5, then means we need 25 cycles to finish one feature extraction

/* wire [7:0] pixel_out, weight_out;

DFF DFF0(clk, reset, pixel, pixel_out);      // one is for the input data
DFF DFF1(clk, reset, weight, weight_out);  // the other one is for the weight */


// Multiplication
// we need to multiply 25 times before
// i.e. we will have 25 different results from the multiplication

/*
reg [15:0] Mul0;
always@(posedge clk)
begin
	Mul0 <= pixel * weight;
end
*/
wire [15:0] Mul0;
wallace_tree8 wallace_tree_multiplier1(clk, pixel, weight, Mul0);



// Addition
// we can add the value up directly but we will not know what type of the adder 
// will be used 
wire [15:0] Q1;
wire [15:0] Q2;
ACC_Ping ACC1(clk, reset, preset, Mul0, Q1); 
ACC_Pong ACC2(clk, reset, preset, Mul0, Q2); 

always@(posedge clk)
begin
	if(reset == 1'b1) begin
		accum2out <= 16'd0;
	    accum1out <= 16'd0;
	end
	else begin
		accum2out <= Q2;
		accum1out <= Q1;
	end
end

endmodule



// Ping-Pong ACC

// we need one more preset input to enable or disable the accum
// or we can simply call it an enable signal
// so we need two kinds of accum
module ACC_Ping (clk, reset, preset, D, Q); 

input clk, reset, preset; 
input  [15:0] D; 
output [15:0] Q; 
reg    [15:0] tmp;  

//
wire [15:0] bk_tmp;
wire [15:0] S;

assign bk_tmp = tmp;
brent_kung bk1(bk_tmp, D, S);

 
//always @(posedge clk or posedge reset) 
always @(posedge clk) 
	begin 
      if (reset) 
        tmp <= 16'd0; 
	  else if (preset)
		tmp <= tmp;
      else 
        //tmp <= tmp + D; 
		tmp <= S;

end 
	
assign Q = tmp; 
  
endmodule



module ACC_Pong (clk, reset, preset, D, Q); 

input clk, reset, preset; 
input  [15:0] D; 
output [15:0] Q; 
reg    [15:0] tmp;  

//
wire [15:0] bk_tmp;
wire [15:0] S;

assign bk_tmp = tmp;
brent_kung bk1(bk_tmp, D, S);

 
//always @(posedge clk or posedge reset) 
always @(posedge clk) 
	begin 
      if (reset) 
        tmp <= 16'd0; 
	  else if (!preset)
		tmp <= tmp;
      else 
        //tmp <= tmp + D; 
		tmp <= S;

end 
	
assign Q = tmp; 
  
endmodule


// brent_kung16

module brent_kung(A, B, S);

    input  [15:0] A;
    input  [15:0] B;
	output [15:0] S;


    wire   [15:0] A;
    wire   [15:0] B;
	wire   [15:0] S;

    
    wire [15:0] p;
    wire [15:0] g;
    wire [15:0] C;

	// level 1
    wire [7:0] level1_g;
    wire [7:0] level1_p;
	// level 2
    wire [3:0] level2_g;
    wire [3:0] level2_p;
	// level 3
    wire [1:0] level3_g;
    wire [1:0] level3_p;
	// level 4
    wire       level4_g;
    wire       level4_p;
	// level 5
    wire       level5_g;
    wire       level5_p;
	// level 6
    wire [2:0] level6_g;
    wire [2:0] level6_p;
	// level 7
    wire [7:0] level7_g;
    wire [7:0] level7_p;

    // pg generator
    genvar i;
    generate
    	for (i=0; i<16; i=i+1) begin
    		pg_gen pg_gen_ins(
    			.a(A[i]),
    			.b(B[i]),
    			.p(p[i]),
    			.g(g[i])
    		);
    	end
    endgenerate
    
    // tree carry generator
    // level 1 gp
    generate
    	for (i=0; i<8; i=i+1) begin
    		dot_operation dot_operation_instance_level1(
    			.g1(g[i*2]),
    			.p1(p[i*2]),
    			.g2(g[i*2+1]),
    			.p2(p[i*2+1]),
    			.gout(level1_g[i]),
    			.pout(level1_p[i])
    		);
    	end
    endgenerate

    //level 2 gp
    generate
    	for (i=0; i<4; i=i+1) begin
    		dot_operation dot_operation_instance_level2(
    			.g1(level1_g[i*2]),
    			.p1(level1_p[i*2]),
    			.g2(level1_g[i*2+1]),
    			.p2(level1_p[i*2+1]),
    			.gout(level2_g[i]),
    			.pout(level2_p[i])
    		);    		
    	end
    endgenerate

    //level 3 gp
    generate
    	for (i=0; i<2; i=i+1) begin
    		dot_operation dot_operation_instance_level3(
    			.g1(level2_g[i*2]),
    			.p1(level2_p[i*2]),
    			.g2(level2_g[i*2+1]),
    			.p2(level2_p[i*2+1]),
    			.gout(level3_g[i]),
    			.pout(level3_p[i])
    		);    		
    	end
    endgenerate

    //level 4 gp
	dot_operation dot_operation_instance_level4(
		.g1(level3_g[0]),
		.p1(level3_p[0]),
		.g2(level3_g[1]),
		.p2(level3_p[1]),
		.gout(level4_g),
		.pout(level4_p)
	);    		

    //level 5 gp
	dot_operation dot_operation_instance_level5(
		.g1(level3_g[0]),
		.p1(level3_p[0]),
		.g2(level2_g[2]),
		.p2(level2_p[2]),
		.gout(level5_g),
		.pout(level5_p)
	);   

    //level 6 gp
	dot_operation dot_operation_instance_level6_0( //c6
		.g1(level2_g[0]),
		.p1(level2_p[0]),
		.g2(level1_g[2]),
		.p2(level1_p[2]),
		.gout(level6_g[0]),
		.pout(level6_p[0])
	); 

	dot_operation dot_operation_instance_level6_1( //c10
		.g1(level3_g[0]),
		.p1(level3_p[0]),
		.g2(level1_g[4]),
		.p2(level1_p[4]),
		.gout(level6_g[1]),
		.pout(level6_p[1])
	); 

	dot_operation dot_operation_instance_level6_2( //c14
		.g1(level5_g),
		.p1(level5_p),
		.g2(level1_g[6]),
		.p2(level1_p[6]),
		.gout(level6_g[2]),
		.pout(level6_p[2])
	); 

    //level 7 gp
    assign level7_g[0] = g[0];
    assign level7_p[0] = 0;
	dot_operation dot_operation_instance_level7_1( //c3
		.g1(level1_g[0]),
		.p1(level1_p[0]),
		.g2(g[2]),
		.p2(p[2]),
		.gout(level7_g[1]),
		.pout(level7_p[1])
	); 	

	dot_operation dot_operation_instance_level7_2( //c5
		.g1(level2_g[0]),
		.p1(level2_p[0]),
		.g2(g[4]),
		.p2(p[4]),
		.gout(level7_g[2]),
		.pout(level7_p[2])
	); 	

	dot_operation dot_operation_instance_level7_3( //c7
		.g1(level6_g[0]),
		.p1(level6_p[0]),
		.g2(g[6]),
		.p2(p[6]),
		.gout(level7_g[3]),
		.pout(level7_p[3])
	); 	

	dot_operation dot_operation_instance_level7_4( //c9
		.g1(level3_g[0]),
		.p1(level3_p[0]),
		.g2(g[8]),
		.p2(p[8]),
		.gout(level7_g[4]),
		.pout(level7_p[4])
	); 	

	dot_operation dot_operation_instance_level7_5( //c11
		.g1(level6_g[1]),
		.p1(level6_p[1]),
		.g2(g[10]),
		.p2(p[10]),
		.gout(level7_g[5]),
		.pout(level7_p[5])
	); 	

	dot_operation dot_operation_instance_level7_6( //c13
		.g1(level5_g),
		.p1(level5_p),
		.g2(g[12]),
		.p2(p[12]),
		.gout(level7_g[6]),
		.pout(level7_p[6])
	); 	

	dot_operation dot_operation_instance_level7_7( //c15
		.g1(level6_g[2]),
		.p1(level6_p[2]),
		.g2(g[14]),
		.p2(p[14]),
		.gout(level7_g[7]),
		.pout(level7_p[7])
	); 	
    
    assign C = {level4_g,    level7_g[7], level6_g[2], level7_g[6],
                level5_g,    level7_g[5], level6_g[1], level7_g[4],
                level3_g[0], level7_g[3], level6_g[0], level7_g[2],
                level2_g[0], level7_g[1], level1_g[0], level7_g[0]};

	// sum generator
	assign S[0] = p[0];
	//assign S[16] = C[15];
	//assign Cout = C[15];
	generate
		for (i=1; i<16; i=i+1) begin
			assign S[i] = C[i-1] ^ p[i];
		end
	endgenerate

endmodule


module dot_operation(g1, p1, g2, p2, gout, pout
	);

    input  g1;
    input  p1;
    input  g2;
    input  p2;
    output gout;
    output pout;

    wire   g1;
    wire   p1;
    wire   g2;
    wire   p2;
    wire  gout;
    wire  pout;
    
    assign gout = g2 + (p2 & g1);
    assign pout = p2 & p1;

endmodule


module pg_gen(a, b, p, g
	);

    input  a;
    input  b;
    output g;
    output p;

    wire   a;
    wire   b;
    wire   p;
    wire   g;

	assign g = a & b;
	assign p = a ^ b;

endmodule


module wallace_tree8(input clk,
		input  [7:0] a,
		input  [7:0] b,
		//output [9:0] sum,
		//output [10:0] carry,
		//output [4:0] z5,
		output [15:0] z
	);

	wire zero = 1'b0;
	reg [7:0] p[7:0];

	integer i, j;
	always @(posedge clk)
	begin
		for(i=0; i<8; i=i+1)
			for(j=0; j<8; j=j+1)
				p[i][j] = a[i] & b[j];
	end

//level 1
	wire [2:0] s1[16:00];
	wire [2:0] c1[16:00];
	//	p[07][07]
	full_adder fa01_13_00 (p [06][07], p [07][06], zero      , s1[13][00], c1[14][00]);
	full_adder fa01_12_00 (p [05][07], p [06][06], p [07][05], s1[12][00], c1[13][00]);
	full_adder fa01_11_00 (p [04][07], p [05][06], p [06][05], s1[11][00], c1[12][00]);
	//	p[07][04]
	full_adder fa01_10_00 (p [03][07], p [04][06], p [05][05], s1[10][00], c1[11][00]);
	full_adder fa01_10_01 (p [06][04], p [07][03], zero      , s1[10][01], c1[11][01]);
	full_adder fa01_09_00 (p [02][07], p [03][06], p [04][05], s1[09][00], c1[10][00]);
	full_adder fa01_09_01 (p [05][04], p [06][03], p [07][02], s1[09][01], c1[10][01]);
	full_adder fa01_08_00 (p [01][07], p [02][06], p [03][05], s1[08][00], c1[09][00]);
	full_adder fa01_08_01 (p [04][04], p [05][03], p [06][02], s1[08][01], c1[09][01]);
	//	p[07][01]
	full_adder fa01_07_00 (p [00][07], p [01][06], p [02][05], s1[07][00], c1[08][00]);
	full_adder fa01_07_01 (p [03][04], p [04][03], p [05][02], s1[07][01], c1[08][01]);
	full_adder fa01_07_02 (p [06][01], p [07][00], zero      , s1[07][02], c1[08][02]);
	full_adder fa01_06_00 (p [00][06], p [01][05], p [02][04], s1[06][00], c1[07][00]);
	full_adder fa01_06_01 (p [03][03], p [04][02], p [05][01], s1[06][01], c1[07][01]);
	//	p[06][00]
	full_adder fa01_05_00 (p [00][05], p [01][04], p [02][03], s1[05][00], c1[06][00]);
	full_adder fa01_05_01 (p [03][02], p [04][01], p [05][00], s1[05][01], c1[06][01]);
	full_adder fa01_04_00 (p [00][04], p [01][03], p [02][02], s1[04][00], c1[05][00]);
	full_adder fa01_04_01 (p [03][01], p [04][00], zero      , s1[04][01], c1[05][01]);
	full_adder fa01_03_00 (p [00][03], p [01][02], p [02][01], s1[03][00], c1[04][00]);
	//	p[03][00]
	full_adder fa01_02_00 (p [00][02], p [01][01], p [02][00], s1[02][00], c1[03][00]);
	full_adder fa01_01_00 (p [00][01], p [01][00], zero      , s1[01][00], c1[02][00]);
	//	p[00][00]

//level 2
	wire [2:0] s2[16:00];
	wire [2:0] c2[16:00];
	full_adder fa02_14_00 (p [07][07], c1[14][00], zero      , s2[14][00], c2[15][00]);
	full_adder fa02_13_00 (s1[13][00], c1[13][00], zero      , s2[13][00], c2[14][00]);
	full_adder fa02_12_00 (s1[12][00], c1[12][00], zero      , s2[12][00], c2[13][00]);
	full_adder fa02_11_00 (p [07][04], s1[11][00], c1[11][00], s2[11][00], c2[12][00]);
	//	c1[11][01]
	full_adder fa02_10_00 (s1[10][00], s1[10][01], c1[10][00], s2[10][00], c2[11][00]);
	//	c1[10][01]
	full_adder fa02_09_00 (s1[09][00], s1[09][01], c1[09][00], s2[09][00], c2[10][00]);
	//	c1[09][01]
	full_adder fa02_08_00 (p [07][01], s1[08][00], s1[08][01], s2[08][00], c2[09][00]);
	full_adder fa02_08_01 (c1[08][00], c1[08][01], c1[08][02], s2[08][01], c2[09][01]);
	full_adder fa02_07_00 (s1[07][00], s1[07][01], s1[07][02], s2[07][00], c2[08][00]);
	full_adder fa02_07_01 (c1[07][00], c1[07][01], zero      , s2[07][01], c2[08][01]);
	full_adder fa02_06_00 (p [06][00], s1[06][00], s1[06][01], s2[06][00], c2[07][00]);
	full_adder fa02_06_01 (c1[06][00], c1[06][01], zero      , s2[06][01], c2[07][01]);
	full_adder fa02_05_00 (s1[05][00], s1[05][01], c1[05][00], s2[05][00], c2[06][00]);
	//	c1[05][01]
	full_adder fa02_04_00 (s1[04][00], s1[04][01], c1[04][00], s2[04][00], c2[05][00]);
	full_adder fa02_03_00 (p [03][00], s1[03][00], c1[03][00], s2[03][00], c2[04][00]);
	full_adder fa02_02_00 (s1[02][00], c1[02][00], zero      , s2[02][00], c2[03][00]);
	//	s1[01][00]
	//	p[00][00]

//level 3
	wire [2:0] s3[16:00];
	wire [2:0] c3[16:00];
	//	c2[15][00]
	full_adder fa03_14_00 (s2[14][00], c2[14][00], zero      , s3[14][00], c3[15][00]);
	full_adder fa03_13_00 (s2[13][00], c2[13][00], zero      , s3[13][00], c3[14][00]);
	full_adder fa03_12_00 (s2[12][00], c2[12][00], zero      , s3[12][00], c3[13][00]);
	full_adder fa03_11_00 (s2[11][00], c1[11][01], c2[11][00], s3[11][00], c3[12][00]);
	full_adder fa03_10_00 (s2[10][00], c1[10][01], c2[10][00], s3[10][00], c3[11][00]);
	full_adder fa03_09_00 (s2[09][00], c1[09][01], c2[09][00], s3[09][00], c3[10][00]);
	//	c2[09][01]
	full_adder fa03_08_00 (s2[08][00], s2[08][01], c2[08][00], s3[08][00], c3[09][00]);
	//	c2[08][01]
	full_adder fa03_07_00 (s2[07][00], s2[07][01], c2[07][00], s3[07][00], c3[08][00]);
	//	c2[07][01]
	full_adder fa03_06_00 (s2[06][00], s2[06][01], c2[06][00], s3[06][00], c3[07][00]);
	full_adder fa03_05_00 (s2[05][00], c1[05][01], c2[05][00], s3[05][00], c3[06][00]);
	full_adder fa03_04_00 (s2[04][00], c2[04][00], zero      , s3[04][00], c3[05][00]);
	full_adder fa03_03_00 (s2[03][00], c2[03][00], zero      , s3[03][00], c3[04][00]);
	//	s2[02][00]
	//	s1[01][00]
	//	p[00][00]

//level 4
	wire [16:00] s4;
	wire [16:00] c4;
	full_adder fa04_15_00 (c2[15][00], c3[15][00], zero      , s4[15], c4[16]);
	full_adder fa04_14_00 (s3[14][00], c3[14][00], zero      , s4[14], c4[15]);
	full_adder fa04_13_00 (s3[13][00], c3[13][00], zero      , s4[13], c4[14]);
	full_adder fa04_12_00 (s3[12][00], c3[12][00], zero      , s4[12], c4[13]);
	full_adder fa04_11_00 (s3[11][00], c3[11][00], zero      , s4[11], c4[12]);
	full_adder fa04_10_00 (s3[10][00], c3[10][00], zero      , s4[10], c4[11]);
	full_adder fa04_09_00 (s3[09][00], c2[09][01], c3[09][00], s4[09], c4[10]);
	full_adder fa04_08_00 (s3[08][00], c2[08][01], c3[08][00], s4[08], c4[09]);
	full_adder fa04_07_00 (s3[07][00], c2[07][01], c3[07][00], s4[07], c4[08]);
	full_adder fa04_06_00 (s3[06][00], c3[06][00], zero      , s4[06], c4[07]);
	full_adder fa04_05_00 (s3[05][00], c3[05][00], zero      , s4[05], c4[06]);
	full_adder fa04_04_00 (s3[04][00], c3[04][00], zero      , s4[04], c4[05]);
	//	s3[03][00]
	//	s2[02][00]
	//	s1[01][00]
	//	p[00][00]

	assign z[4] = s4[04];
	assign z[3] = s3[03][00];
	assign z[2] = s2[02][00];
	assign z[1] = s1[01][00];
	assign z[0] = p [00][00];
	//assign z5 = z[4:0];
	//assign sum = s4[14:05];
	//assign carry = {s4[15]|c4[15], c4[14:05]};
	assign z[15:05] = s4[15:05] + c4[15:05];

endmodule

// ----------------------------------------------------
// Part I: 32-bit RIPPLE CARRY ADDER
// ----------------------------------------------------

// function: giving a,b,cin as input, and then calculate to obtain the sum and cout

/*
module ripple_carry_adder(
		input [7:0] a,  // 32 bits
		input [7:0] b,
		input        cin,
		output [7:0] sum,
		output        cout);
	
	//systemverilog style
	wire [7:0] s;
	wire [8:0] c;
	
	assign c[0] = cin;
	
	genvar i;
    generate
    	for (i=0; i<8; i=i+1) begin
    		full_adder m0(
    			.a(a[i]),
    			.b(b[i]),
				.cin(c[i]),
				.sum(s[i]),        //output
				.cout(c[i+1]));     //output
    		
    	end
    endgenerate
	
	assign sum={s[7],s[6],s[5],s[4],s[3],s[2],s[1],s[0]};
	assign cout = c[8];

	
endmodule
*/
	
	
// ----------------------------------------------------
// Part II: ONE BIT RIPPLE CARRY ADDER --- FULL ADDER
// ----------------------------------------------------

// function: giving a and b, generate the result of p and g

module full_adder(
		input a,
		input b,
		input cin,
		output sum,
		output cout);
		
	assign {cout,sum} = a + b + cin;
	
endmodule	