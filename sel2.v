module sel2 #(
    parameter MSB = 15
)(
    input wire [MSB:0] in0,
    input wire [MSB:0] in1,
    output wire [MSB:0] out,
    input wire sel
);
    assign out = (sel)? in1:in0;

endmodule



