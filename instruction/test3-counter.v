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
assign memory[2] = 8'b01101101; // m3(3) to s3 : r0123 rw 3
assign memory[3] = 8'b01110001; // m4(4) to s0 : r4123 rw 4
assign memory[4] = 8'b01000101; // m5(5) to s1 : r4523 rw 5
assign memory[5] = 8'b01011001; // m6(6) to s2 : r4563 rw 6
assign memory[6] = 8'b01101101; // m7(7) to s3 : r4567 rw 7
assign memory[7] = 8'b01110001; // m8(8) to s0 : r8567 rw 8

assign memory[8] = 8'b01000101; 
assign memory[9] = 8'b01011001; 
assign memory[10] = 8'b01101101; 
assign memory[11] = 8'b01110001; // rw 12

assign memory[12] = 8'b01000101; 
assign memory[13] = 8'b01011001; 
assign memory[14] = 8'b01101101; 
assign memory[15] = 8'b01110001; // rw 16

assign memory[16] = 8'b01000101; 
assign memory[17] = 8'b01011001; 
assign memory[18] = 8'b01101101; 
assign memory[19] = 8'b01110001; // rw 20

assign memory[20] = 8'b01000101; 
assign memory[21] = 8'b01011001; 
assign memory[22] = 8'b01101101; 
assign memory[23] = 8'b01110001; // rw 24

assign memory[24] = 8'b01000101; 
assign memory[25] = 8'b01011001; 
assign memory[26] = 8'b01101101; 
assign memory[27] = 8'b01110001; // rw 28

assign memory[28] = 8'b11000011; // stop

// Instruction end

// output instruction
assign instruction = memory[address];

endmodule