`timescale 1ns / 1ps

module microprocessor(
    input [7:0] instruction,
    input fast_clock,
    input clear,
    output [3:0] first_segment,
    output [3:0] second_segment,
    output [7:0] read_address
    );

    // 1-second clock
    wire clock;

    // control signals
    wire signal_memtoreg;
    wire signal_regwrite;
    wire signal_alusrc;
    wire signal_branch;
    wire signal_memread;
    wire signal_memwrite;
    wire signal_regdst;
    wire signal_aluop;

    // convert fast clock to 1-second clock
    clock_divider new_clock(
        .clock_in(fast_clock),
        .clear(clear),
        .clock_out(clock)
    );

    // control signal distribution
    control_unit control(
        .clock(clock),
        .opcode(instruction[7:6]),
        .signal_aluop(signal_aluop),
        .signal_alusrc(signal_alusrc),
        .signal_branch(signal_branch),
        .signal_regdst(signal_regdst),
        .signal_memread(signal_memread),
        .signal_memtoreg(signal_memtoreg),
        .signal_memwrite(signal_memwrite),
        .signal_regwrite(signal_regwrite)
    );

endmodule
