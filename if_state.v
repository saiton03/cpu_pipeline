module if_state (
    input wire clk,
    input wire rst_n,
    input wire [15:0] jmp8,
    input wire [15:0] jmp11,
    input wire [15:0] jmpr,
    input wire [1:0] pc_sel,
    input wire jr_sel,
    output wire [15:0] imem_addr,
    output wire [15:0] pc_next
);

    input wire [15:0] pc_diff;
    input wire [15:0] pc_normal;
    input wire [15:0] pc_in;

    sel3 sel_pcdiff(
        .in0 (16'h1),
        .in1 (jmp8),
        .in2 (jmp11),
        .sel (pc_sel),
        .out (pc_diff)
    );

    assign pc_normal = imem_addr + pc_diff;

    sel2 sel_pcin(
        .in0 (pc_normal),
        .in1 (jmpr),
        .sel (jr_sel),
        .out (pc_in)
    );

    pc pc_inst(
        .clk (clk),
        .rst_n (rst_n),
        .pc_in (pc_in),
        .pc_out (imem_addr)
    );

    assign pc_next = imem_addr +1;

endmodule



