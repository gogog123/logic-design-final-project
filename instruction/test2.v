module tester(
    input [7:0] address,
    input clear,
    output [7:0] instruction
);

// memory for instruction
wire [7:0] memory [0:31];


// Instruction start

assign memory[0] = 8'b01001000; // m1(1) to s2 : r0010 rw 1
assign memory[1] = 8'b01100001; // m2(2) to s0 : r2010 rw 2
assign memory[2] = 8'b01000101; // m3(3) to s1 : r2310 rw 3
assign memory[3] = 8'b00000111; // s0(2)+s1(3) to s3 : r2315 rw 5
assign memory[4] = 8'b01111001; // m6(6) to s2 : r2365 rw 6
assign memory[5] = 8'b00101100; // s2(6)+s3(5) to s0 : r'11'365 rw 11
assign memory[6] = 8'b10100010; // s0(11) to m4 : m0123'11'
assign memory[7] = 8'b00001101; // s0(11)+s3(5) to s1 : r'11'16'65 rw 16
assign memory[8] = 8'b01111011; // m4(11) to s1 : r'11'16'11'5 rw 11
assign memory[9] = 8'b00011110; // s1(16)+s3(5) to s2 : r'11'16'21'5 rw 21

assign memory[10] = 8'b11000011; // stop

// Instruction end

// output instruction
assign instruction = memory[address];

endmodule