module sel4 #(
    parameter MSB = 15
)(
    input wire [MSB:0] in0,
    input wire [MSB:0] in1,
    input wire [MSB:0] in2,
    input wire [MSB:0] in3,
    output wire [MSB:0] out,
    input wire [1:0] sel
);
    assign out = (sel == 2'b00)? in0:
                 (sel == 2'b01)? in1:
                 (sel == 2'b10)? in2: in3;

endmodule



