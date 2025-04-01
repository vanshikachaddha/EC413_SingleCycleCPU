`timescale 1ns / 1ns


module tb_cpu;

	// Inputs
	reg rst;
	reg clk;
	reg initialize;
	reg [31:0] instruction_initialize_data;
	reg [31:0] instruction_initialize_address;

	// Instantiate the Unit Under Test (UUT)
	cpu uut (
		.rst(rst), 
		.clk(clk), 
		.initialize(initialize), 
		.instruction_initialize_data(instruction_initialize_data), 
		.instruction_initialize_address(instruction_initialize_address)
	);

	initial begin
		// Initialize Inputs
		rst = 1;
		clk = 0;
		initialize = 1;
		instruction_initialize_data = 0;
		instruction_initialize_address = 0;

		#100;
		      
		instruction_initialize_address = 0;
		instruction_initialize_data = 32'b000000_00000_00010_00001_00000_10_0000;      // ADD R1, R0, R2
		#20;
		instruction_initialize_address = 4;
		instruction_initialize_data = 32'b000000_00100_00100_01000_00000_10_0010;      // SUB R8, R4, R4
		#20;
		instruction_initialize_address = 8;
		instruction_initialize_data = 32'b000000_00101_00110_00111_00000_10_0101;      // OR R7, R5, R6
		#20;
		instruction_initialize_address = 12;
		instruction_initialize_data = 32'b101011_00000_01001_00000_00000_00_1100;      // SW R9, 12(R0)
		#20;
		instruction_initialize_address = 16;
		instruction_initialize_data = 32'b100011_00000_01101_00000_00000_00_1100;      // LW R13, 12(R0) --> changed to store into R13 because wanted to make sure LW was working 
		#20
		
		instruction_initialize_address = 20;
		instruction_initialize_data = 32'b000000_00011_00001_00110_00000_10_0100;      // AND R6, R3, R1
	
		#20;
		
		instruction_initialize_address = 24;
		instruction_initialize_data = 32'b000000_00000_00010_00001_00000_10_0111;      // NOR R1, R0, R2 
		
		#20;
		
		instruction_initialize_address = 28;
		instruction_initialize_data = 32'b000000_00100_00100_01000_00000_10_1000;      // XOR R8, R4, R4
		
		
		#20;
		instruction_initialize_address = 32;
		instruction_initialize_data = 32'b000010_00000000000000000000001010;          // jump to address 40 
		
		#20 
		instruction_initialize_address = 40;
		instruction_initialize_data = 32'b000000_00010_00001_00001_00001_10_1010;          // SLT R1, R2, R1  (set R1 if R2 less than R1) 
		
		#20 
		instruction_initialize_address = 44;
		instruction_initialize_data = 32'b001000_00101_00010_0000000000001010;            // ADDI R2, R5, 10 
		
		#20 
		instruction_initialize_address = 48;
		instruction_initialize_data = 32'b001000_00101_00010_1000000000001010;            // ADDI R2, R5, (see if it sign extends) 
		
		#20 
		instruction_initialize_address = 52;
		instruction_initialize_data = 32'b001101_00001_01110_0000000000000011;            // ORI R14, R1, 3
		
		#20 
		instruction_initialize_address = 56;
		instruction_initialize_data = 32'b001101_00001_01110_1000000000000011;            // ORI R14, R1, (see if it 0 extends)
		
		#20 
		instruction_initialize_address = 60;
		instruction_initialize_data = 32'b001111_00000_01111_0000000000000001;            // LUI R15, 1 
		
		#20
		instruction_initialize_address = 64;
		instruction_initialize_data = 32'b000101_00001_00010_0000000000000001;            //BNE R1, R2, 1
		
		#20;
		instruction_initialize_address = 72;
		instruction_initialize_data = 32'b000100_00000_00000_11111_11111_11_1111;      // BEQ R0, R0, -1  --> must go last in tb because continuously 
		
		#20
		initialize = 0;
		rst = 0;
		
		
	end
      
always
#5 clk = ~clk;
endmodule

