module sel3 #(
    parameter MSB = 15
)(
    input wire [MSB:0] in0,
    input wire [MSB:0] in1,
    input wire [MSB:0] in2,
    output wire [MSB:0] out,
    input wire [1:0] sel
);
    assign out = (sel == 2'b00)? in0:
                 (sel == 2'b01)? in1: in2;

endmodule



