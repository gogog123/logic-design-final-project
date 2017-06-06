`timescale 1ns / 1ps

module register_file(
    input [1:0] read_reg1,
    input [1:0] read_reg2,
    input [1:0] write_reg,
    input [7:0] write_data,
    input signal_regwrite,
    input clock,
    output reg [1:0] output_reg1,
    output reg [1:0] output_reg2
    );

    // total four registers
    reg [7:0] register [0:3];

    // initalize to 0
    initial begin
        register[0] <= 8'b0;
        register[1] <= 8'b0;
        register[2] <= 8'b0;
        register[3] <= 8'b0;
    end

    // main loop
    always @(posedge clock) begin
        if (signal_regwrite) begin
            register[write_reg] <= write_data;
        end
        else begin
            output_reg1 <= register[read_reg1];
            output_reg2 <= register[read_reg2];
        end
    end

endmodule
