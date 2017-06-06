`timescale 1ns / 1ps

module control_unit(
    input clock,
    input [1:0] opcode,
    output reg signal_memtoreg,
    output reg signal_regwrite,
    output reg signal_alusrc,
    output reg signal_branch,
    output reg signal_memread,
    output reg signal_memwrite,
    output reg signal_regdst,
    output reg signal_aluop
    );

    always @(posedge clock) begin
        case (opcode)
            2'b00: begin
                signal_regdst <= 1'b1;
                signal_regwrite <= 1'b1;
                signal_alusrc <= 1'b0;
                signal_branch <= 1'b0;
                signal_memread <= 1'b0;
                signal_memwrite <= 1'b0;
                signal_memtoreg <= 1'b0;
                signal_aluop <= 1'b1;
            end

            2'b01: begin
                signal_regdst <= 1'b0;
                signal_regwrite <= 1'b1;
                signal_alusrc <= 1'b1;
                signal_branch <= 1'b0;
                signal_memread <= 1'b1;
                signal_memwrite <= 1'b0;
                signal_memtoreg <= 1'b1;
                signal_aluop <= 1'b0;
            end

            2'b10: begin
                signal_regdst <= 1'b0; // don't care
                signal_regwrite <= 1'b0;
                signal_alusrc <= 1'b1;
                signal_branch <= 1'b0;
                signal_memread <= 1'b0;
                signal_memwrite <= 1'b1;
                signal_memtoreg <= 1'b0; // don't care
                signal_aluop <= 1'b0;
            end

            2'b11: begin
                signal_regdst <= 1'b0; // don't care
                signal_regwrite <= 1'b0;
                signal_alusrc <= 1'b0;
                signal_branch <= 1'b1;
                signal_memread <= 1'b0;
                signal_memwrite <= 1'b0;
                signal_memtoreg <= 1'b0; // don't care
                signal_aluop <= 1'b0;
            end
        endcase
    end

endmodule
