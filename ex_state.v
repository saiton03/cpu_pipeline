module ex_state (
    input wire clk,
    input wire rst_n,
    input wire [15:0] areg,
    input wire [15:0] breg,
    output reg [15:0] creg,
    output reg [15:0] dreg,
    input wire [2:0] com_id,
    input wire [2:0] rd_id,
    input wire rwe_id,
    //input wire st_op_id,
    input wire ld_op_id,
    output reg [2:0] rd_ex,
    output reg rwe_ex,
    output reg ld_op_ex,
    output wire [15:0] fwddata,
    output wire [15:0] mem_addr,
    output wire [15:0] mem_in,
    //output wire mem_we,
    input wire [15:0] mem_out
);

    //memory
    assign mem_addr = breg;
    assign mem_in = areg;
    
    //alu
    wire [15:0] alu_out;

    alu alu_inst(
        .ina (areg),
        .inb (breg),
        .com (com_id),
        .out (alu_out)
    );

    //update
    always @(posedge clk) begin
        if(!rst_n) begin
            creg<=16'h0;    
            dreg<=16'h0;    
            rd_ex<=3'h0;
            ld_op_ex<=0;
            rwe_ex<=0;
        end else begin
            creg<=alu_out;
            dreg<=mem_out;
            rd_ex<=rd_id;
            ld_op_ex<=ld_op_id;
            rwe_ex<=rwe_id;
        end
    end

    //forwarding
    sel2 sel_fwddata(
        .in0 (alu_out),
        .in1 (mem_out),
        .sel (ld_op_id),
        .out (fwddata)
    );

endmodule


