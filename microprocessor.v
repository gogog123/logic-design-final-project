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

    // outputs from register file
    wire [7:0] output_reg1;
    wire [7:0] output_reg2;

    // output from sign extend
    wire [7:0] sign_extended_imm;

    // output from data memory
    wire [7:0] output_memory;

    // output from ALU 
    wire [7:0] output_alu;


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

    // register file
    register_file regiters(
        .read_reg1(instruction[5:4]),
        .read_reg2(instruction[3:2]),
        // mux implementation
        .write_reg(signal_regdst ? instruction[1:0] : instruction[3:2]),
        .signal_regwrite(signal_regwrite),
        .clock(clock),
        // mux implementation
        .write_data(signal_memtoreg ? output_memory : output_alu),
        .output_reg1(output_reg1),
        .output_reg2(output_reg2)
    );

    // data memory
    data_memory data_memory(
        .clock(clock),
        .clear(clear),
        .signal_memread(signal_memread),
        .signal_memwrite(signal_memwrite),
        .address(output_alu),
        .data_to_write(output_reg2),
        .data_out(output_memory)
    );

    // sign extend
    sign_extend sign_extend(
        .in(instruction[1:0]),
        .out(sign_extended_imm)
    );

    // ALU
    adder alu(
        .in1(output_reg1),
        // mux implementation
        .in2(signal_alusrc ? sign_extended_imm : output_reg2),
        .out(output_alu),
        .signal_aluop(signal_aluop)
    );

endmodule
