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
    reg [7:0] reg0;
    reg [7:0] reg1;
    reg [7:0] reg2;
    reg [7:0] reg3;

    // initalize to 0
    initial begin
        reg0 <= 8'b0;
        reg1 <= 8'b0;
        reg2 <= 8'b0;
        reg3 <= 8'b0;
    end

    // main loop
    always @(posedge clock) begin
        if (signal_regwrite) begin
            case (write_reg)
                2'b00: reg0 <= write_data;
                2'b01: reg1 <= write_data;
                2'b10: reg2 <= write_data;
                2'b11: reg3 <= write_data;
            endcase
        end
        else begin
            case (read_reg1)
                2'b00: output_reg1 <= reg0;
                2'b01: output_reg1 <= reg1;
                2'b10: output_reg1 <= reg2;
                2'b11: output_reg1 <= reg3;
            endcase
            
            case (read_reg2)
                2'b00: output_reg2 <= reg0;
                2'b01: output_reg2 <= reg1;
                2'b10: output_reg2 <= reg2;
                2'b11: output_reg2 <= reg3;
            endcase
        end
    end

endmodule
