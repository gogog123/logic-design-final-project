`timescale 1ns / 1ps

module hex_to_seven_segment(
    input [3:0] in,
    output reg [6:0] out
    );

    always @(in) begin
        case (in)
            4'd0: out <= 7'b1111110;
            4'd1: out <= 7'b0110000;
            4'd2: out <= 7'b1101101;
            4'd3: out <= 7'b1111001;
            4'd4: out <= 7'b0110011;
            4'd5: out <= 7'b1011011;
            4'd6: out <= 7'b1011111;
            4'd7: out <= 7'b1110000;
            4'd8: out <= 7'b1111111;
            4'd9: out <= 7'b1111011;
            4'd10: out <= 7'b1110111;
            4'd11: out <= 7'b0011111;
            4'd12: out <= 7'b1001110;
            4'd13: out <= 7'b0111101;
            4'd14: out <= 7'b1001111;
            4'd15: out <= 7'b1000111;
        endcase
    end

endmodule
