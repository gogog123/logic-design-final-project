module tester(
    input [7:0] address,
    input clear,
    output [7:0] instruction
);

// memory for instruction
wire [7:0] memory [0:31];

// Instruction start

assign memory[0] = 8'b01000101; // m1(1) to s1 : r0100 rw 1
assign memory[1] = 8'b01011001; // m2(2) to s2 : r0120 rw 2
assign memory[2] = 8'b00011000; // s1(1)+s2(2) to s0 : r3120 rw 3
assign memory[3] = 8'b01011100; // m1(1) to s3 : r3121 rw 1
assign memory[4] = 8'b00001101; // s0(3)+s3(1) to s1 : r3421 rw 4
assign memory[5] = 8'b10110100; // s1 to m1 : m0423.. 
assign memory[6] = 8'b01100000; // m2(2) to s0 : r2421 rw 2
assign memory[7] = 8'b00011011; // s1(4)+s2(2) to s3 : r2426 rw 6
assign memory[8] = 8'b10001100; // s3 to m2 : m0463
assign memory[9] = 8'b01001000; // m2(6) to s2 : r2466 rw 6
assign memory[10] = 8'b00101100; // s2(6)+s3(6) to s0 : r'12'466 rw 12

assign memory[11] = 8'b11000011; // stop

// Instruction end

// output instruction
assign instruction = memory[address];

endmodule