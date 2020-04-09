module poco_r(
    input wire clk,
    input wire rst_n,
    output wire [11:0] led
);
    
    //IF-ID
    wire [1:0] pc_sel;
    wire [15:0] jmp8;
    wire [15:0] jmp11;
    wire [15:0] jmpr;
    wire jr_sel;
    wire [15:0] pc_next;

    //ID_EX
    wire [15:0] areg;
    wire [15:0] breg;
    wire [2:0] com_id;
    wire rwe_id;
    wire ld_op_id;
    wire [2:0] rd_id;
    wire [15:0] fwddata;
    wire [2:0] rd_ex;
    wire rwe_ex;

    //EX_WB
    wire [15:0] creg;
    wire [15:0] dreg;
    wire ld_op_ex;

    //WB_ID
    wire [15:0] rf_c;

    //imem
    wire [15:0] pc;
    wire [15:0] op;

    //memory
    wire [15:0] mem_addr;
    wire [15:0] mem_in;
    wire [15:0] mem_out;
    wire st_op_id;

    if_state if_inst(
        .clk (clk),
        .rst_n (rst_n),
        .jmp8 (jmp8),
        .jmp11 (jmp11),
        .jmpr (jmpr),
        .pc_sel (pc_sel),
        .jr_sel (jr_sel),
        .imem_addr (pc),
        .pc_next (pc_next)
    );

    imem imem_inst(
        .clk (clk),
        .rst_n (rst_n),
        .pc (pc),
        .op (op)
    );

    id_state id_inst(
        .clk (clk),
        .rst_n (rst_n),
        .op (op),
        .pc_next (pc_next),
        .fwddata (fwddata),
        .rf_c (rf_c),
        .rd_ex (rd_ex),
        .rwe_ex (rwe_ex),
        .pc_sel (pc_sel),
        .jr_sel (jr_sel),
        .jmp8 (jmp8),
        .jmp11 (jmp11),
        .jmpr (jmpr),
        .areg (areg),
        .breg (breg),
        .com_id (com_id),
        .rwe_id (rwe_id),
        .st_op_id (st_op_id),
        .ld_op_id (ld_op_id),
        .rd_id (rd_id)
    );
    
    ex_state ex_inst(
        .clk (clk),
        .rst_n (rst_n),
        .areg (areg),
        .breg (breg),
        .creg (creg),
        .dreg (dreg),
        .com_id (com_id),
        .rd_id (rd_id),
        .rwe_id (rwe_id),
        .ld_op_id (ld_op_id),
        .rd_ex (rd_ex),
        .rwe_ex (rwe_ex),
        .ld_op_ex (ld_op_ex),
        .fwddata (fwddata),
        .mem_addr (mem_addr),
        .mem_in (mem_in),
        .mem_out (mem_out)
    );

    memory memory_inst(
        .clk (clk),
        .rst_n (rst_n),
        .addr (mem_addr),
        .data_in (mem_in),
        .data_out (mem_out),
        .we (st_op_id)
    );
    
    led led_inst(
        .clk (clk),
        .rst_n (rst_n),
        .addr (mem_addr),
        .in (mem_in),
        .led (led),
        .we (st_op_id)
    );

    wb_state wb_inst(
        .creg (creg),
        .dreg (dreg),
        .ld_op_ex (ld_op_ex),
        .rf_c (rf_c)
    );

endmodule

