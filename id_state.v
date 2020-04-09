module id_state (
    input wire clk,
    input wire rst_n,
    input wire [15:0] op,
    input wire [15:0] pc_next,
    input wire [15:0] fwddata,
    input wire [15:0] rf_c,
    input wire [2:0] rd_ex,
    input wire rwe_ex,
    output wire [1:0] pc_sel,
    output wire jr_sel,
    output wire [15:0] jmp8,
    output wire [15:0] jmp11,
    output wire [15:0] jmpr,
    output reg [15:0] areg,
    output reg [15:0] breg,
    output reg [2:0] com_id,
    output reg rwe_id,
    output reg st_op_id,
    output reg ld_op_id,
    output reg [2:0] rd_id
);
  `include "def.h"
  
   //ir
   reg [15:0] ir;
   always @(posedge clk) begin
       if(!rst_n) ir<=16'h0;
       else ir<=op;
   end

   wire [4:0] opcode, func;
   wire [2:0] rd,rs;
   wire [7:0] imm8;
   wire [10:0] imm11;
   assign opcode = ir[15:11];
   assign rd = ir[10:8];
   assign rs = ir[7:5];
   assign func = ir[4:0];
   assign imm8 = ir[7:0];
   assign imm11 = ir[10:0];

   //decoder
   wire [1:0] comsel,alu_bsel;
   wire rd_sel, rwe, st_op, ld_op;
   wire zerof, posf;

   decoder decoder_inst(
      .opcode (opcode),
      .func (func),
      .zerof (zerof),
      .posf (posf),
      .pc_sel (pc_sel),
      .com_sel (comsel),
      .alu_bsel (alu_bsel),
      .jr_sel (jr_sel),
      .rd_sel (rd_sel),
      .rwe (rwe),
      .st_op (st_op),
      .ld_op (ld_op)
   );

   //register
   wire [2:0] rd_mod;
   wire [15:0] ref_a, ref_b;

   sel2 #(.MSB(2)) sel_rd(
      .in0 (rd),
      .in1 (3'h7),
      .out (rd_mod),
      .sel (rd_sel)
   );

   register register_inst(
      .clk (clk),
      .rst_n (rst_n),
      .a_addr (rd_mod),
      .b_addr (rs),
      .c_addr (rd_ex),
      .ref_c (rf_c),
      .ref_a (ref_a),
      .ref_b (ref_b),
      .rwe (rwe_ex)
   );

   //sel regb
   wire [15:0] breg_ir,imm8_ext,imm8_ext0, imm8_hi;
   assign imm8_ext = {{8{imm8[7]}},imm8};
   assign imm8_ext0 = {8'h0,imm8};
   assign imm8_hi = imm8 << 8;

   assign jmp8 = imm8_ext;
   assign jmp11 = {{5{imm11[10]}},imm11};

   sel4 sel_regb_ir(
      .in0 (ref_b),
      .in1 (imm8_ext),
      .in2 (imm8_ext0),
      .in3 (imm8_hi),
      .out (breg_ir),
      .sel (alu_bsel)
   );

   wire [15:0] breg_row;

   sel2 sel_breg_row(
      .in0 (breg_ir),
      .in1 (pc_next),
      .sel (rd_sel),
      .out (breg_row)
   );
   
   assign jmpr = areg_in;
   assign zerof = |areg_in;
   assign posf = ~areg_in[15];
   
   wire [15:0] areg_in, breg_in;
   wire selareg, selbreg;
   assign selareg = (rd_id == rd_mod) & (rwe_id == 1);
   assign selbreg = (rd_id == rs) & (rwe_id == 1);

   sel2 sel_areg(
      .in0 (ref_a),
      .in1 (fwddata), 
      .sel (selareg),
      .out (areg_in)
   );

   sel2 sel_breg(
      .in0 (breg_row),
      .in1 (fwddata), 
      .sel (selbreg),
      .out (breg_in)
   );

   //com
   wire [2:0] com_id_in;

   sel3 #(.MSB(2)) sel_com(
      .in0 (func[2:0]),
      .in1 (THB),
      .in2 (ADD),
      .sel (comsel),
      .out (com_id_in)
   );
   
   always @(posedge clk) begin
      if(!rst_n) begin
          areg<=16'h0;
          breg<=16'h0;
          rd_id<=3'h0;
          st_op_id<=0;
          ld_op_id<=0;
          com_id<=3'h0;
          rwe_id<=0;
      end else begin
          areg<=areg_in;
          breg<=breg_in;
          rd_id<=rd_mod;
          st_op_id<=st_op;
          ld_op_id<=ld_op;
          com_id<=com_id_in;
          rwe_id<=rwe;
      end
   end

endmodule

