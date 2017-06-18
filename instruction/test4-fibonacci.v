module tester(
    input [7:0] address,
    input clear,
    output [7:0] instruction
);

// memory for instruction
wire [7:0] memory [0:31];


// Instruction start

assign memory[0] = 8'b01001001; // m1(1) to s2 : r0010 rw 1
assign memory[1] = 8'b00100111; // s2(1)+s1(0) to s3 : r0011 rw 1
assign memory[2] = 8'b00111001; // s3(1)+s2(1) to s1 : r0211 rw 2
assign memory[3] = 8'b00011000; // s1(2)+s2(1) to s0 : r3211 rw 3
assign memory[4] = 8'b00000111; // s0(3)+s1(2) to s3 : r3215 rw 5
assign memory[5] = 8'b00110010; // s3(5)+s0(3) to s2 : r3285 rw 8
assign memory[6] = 8'b00101101; // s2(8)+s3(5) to s1 : r3'13'85 rw 13
assign memory[7] = 8'b00011000; // s1(13)+s2(8) to s0 : r'21'13'85 rw 21

assign memory[8] = 8'b11000011; // stop

// Instruction end

// output instruction
assign instruction = memory[address];

endmodule
