module wb_state (
    input wire [15:0] creg,
    input wire [15:0] dreg,
    input wire ld_op_ex,
    output wire [15:0] rf_c
);

    sel2 sel_rfc(
        .in0 (creg),
        .in1 (dreg),
        .sel (ld_op_ex),
        .out (rf_c)
    );

endmodule
    
