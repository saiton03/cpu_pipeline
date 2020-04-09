module decoder (
    input wire [4:0] opcode,
    input wire [4:0] func,
    input wire zerof,
    input wire posf,
    output reg [1:0] pc_sel,
    output reg [1:0] com_sel,
    output reg [1:0] alu_bsel,
    output wire jr_sel,
    //output wire r7_we,
    output wire rd_sel,
    output reg rwe,
    output wire st_op,
    output wire ld_op
);
    `include "def.h"

    always @(*) begin
        case(opcode) 
            OP_REG : pc_sel = 2'b00;
            OP_JMP, OP_JAL : pc_sel = 2'b10;
            OP_BEZ : pc_sel = (zerof)? 2'b01 : 2'b00;
            OP_BNZ : pc_sel = (!zerof)? 2'b01 : 2'b00;
            OP_BPL : pc_sel = (posf)? 2'b01 : 2'b00;
            OP_BMI : pc_sel = (!posf)? 2'b01 : 2'b00;
            default : pc_sel = 2'b00;
        endcase
    end

    assign jr_sel = (opcode == OP_REG && (func == F_JR || func == F_JALR))? 1:0;
    //assign r7_we = (opcode == OP_REG && (func == F_JAL || func == F_JALR))? 1:0;

    always @(*) begin
        case(opcode) 
            OP_REG : com_sel = (func == F_JALR)? 2'b01:2'b00;
            OP_LDI, OP_LDIU, OP_LDHI : com_sel = 2'b01;
            default : com_sel = 2'b10;
        endcase
    end
    
    always @(*) begin
        case(opcode) 
            OP_REG : alu_bsel = 2'b00;
            OP_LDI, OP_ADDI : alu_bsel = 2'b01;
            OP_LDHI : alu_bsel = 2'b11;
            default : alu_bsel = 2'b10;
        endcase
    end
    
    assign rd_sel = (opcode == OP_JAL || (opcode == OP_REG && func == F_JALR))? 1:0;

    always @(*) begin
        if(opcode==OP_REG) begin
            case(func)
                F_NOP, F_ST, F_JR, F_SB, F_EINT, F_RTI : rwe = 0;
                default : rwe = 1;
            endcase
        end else begin
            case(opcode)
                OP_LDI, OP_LDIU, OP_ADDI, OP_ADDIU, OP_LDHI, OP_JAL : rwe = 1;
                default : rwe = 0;
            endcase
        end
    end

    assign st_op = (opcode == OP_REG && (func == F_ST || func == F_SB))? 1:0;
    assign ld_op = (opcode == OP_REG && (func == F_LD || func == F_LB || func == F_LBU))? 1:0;

endmodule
