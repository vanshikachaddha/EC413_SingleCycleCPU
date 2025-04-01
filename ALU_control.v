`timescale 1ns / 1ns

module ALU_control(
	 input [5:0] instruction,
	 input [2:0] ALUOp,
	 output reg [2:0] func
    );

 always @(*) begin
	// Remember that the ALUOP is set by the control unit in control.v
	// ALUOp = 2'b00 for R-type instructions
	// ALUOp = 2'b01 for branch instructions
	// ALUOp = 2'b10 for lw and sw instructions
	// ALUp = 3'b11 for I-Type instructions 


	if (ALUOp == 3'b000) begin  
		if (instruction == 6'h20) 
		func = 3'd0;
		else if (instruction == 6'h22)
		func = 3'd1;
		else if (instruction == 6'h24)
		func = 3'd2;
		else if (instruction == 6'h25)
		func = 3'd3;
		else if (instruction == 6'h27)
		func = 3'd4;
		else if (instruction == 6'h28) // added 
		func = 3'd5;                   // added 
		else if (instruction == 6'h2a)
		func = 3'd6;
		else
		func = 3'd7;
	end else if (ALUOp == 3'b001) begin  
		func = 3'd1;
	end else if (ALUOp == 3'b010) begin
		func = 3'd0;
	end else if (ALUOp == 3'b011) begin // addi
	    func = 3'd0;
	end else if (ALUOp == 3'b100) begin // ori
	    func = 3'd3;
	end else if (ALUOp == 3'b101) begin // lui
	    func = 3'd7;
	end else if (ALUOp == 3'b111) begin //bne
	    func = 3'd1;
	end else begin
		func = 3'd7;
	end
   end


endmodule
