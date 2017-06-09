module tester(
    input [7:0] address,
    input clear,
    output [7:0] instruction
);

// memory for instruction
wire [7:0] memory [0:31];


// Instruction start

assign memory[0] = 8'b01000100;
assign memory[1] = 8'b01001001;
assign memory[2] = 8'b00011000;
assign memory[3] = 8'b10001001;
assign memory[4] = 8'b11000011;

// Instruction end

// output instruction
assign instruction = memory[address];

endmodule
