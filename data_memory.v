`timescale 1ns / 1ps

module data_memory(
    input signal_memread,
    input signal_memwrite,
    input address,
    input [7:0] data_to_write,
    input clock,
    output reg [7:0] data_out
    );

    // 2D array declaration
    reg [7:0] memory[0:31];

    always @(posedge clock) begin

        // read signal
        if (signal_memread) begin
            data_out <= memory[address];
        end

        // write signal
        else if (signal_memwrite) begin
            memory[address] <= data_to_write;
        end

    end

endmodule
