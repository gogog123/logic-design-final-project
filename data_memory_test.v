`timescale 1ns / 1ps

module data_memory_test;

	// Inputs
	reg signal_memread;
	reg signal_memwrite;
	reg address;
	reg [7:0] data_to_write;
	reg clock;

	// Outputs
	wire [7:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	data_memory uut (
		.signal_memread(signal_memread), 
		.signal_memwrite(signal_memwrite), 
		.address(address), 
		.data_to_write(data_to_write), 
		.clock(clock), 
		.data_out(data_out)
	);

	initial begin
		// Initialize Inputs
		signal_memread = 0;
		signal_memwrite = 0;
		address = 0;
		data_to_write = 0;
		clock = 0;
		#100;
        
		signal_memread = 0;
		signal_memwrite = 1;
		address = 8'b00000000;
		data_to_write = 8'b00001111;
		clock = 1;
		#100;

		signal_memread = 0;
		signal_memwrite = 0;
		address = 0;
		data_to_write = 0;
		clock = 0;
		#100;
        
		signal_memread = 1;
		signal_memwrite = 0;
		address = 8'b00000000;
		data_to_write = 8'b00000000;
		clock = 1;
		#100;

	end
      
endmodule

