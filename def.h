//alu com
parameter [2:0] THA = 3'b000,
                THB = 3'b001,
                AND = 3'b010,
                OR  = 3'b011,
                SL  = 3'b100,
                SR  = 3'b101,
                ADD = 3'b110,
                SUB = 3'b111;

//ope_func
parameter [4:0] F_NOP  = 5'b00000,
                F_MV   = 5'b00001,
                F_AND  = 5'b00010,
                F_OR   = 5'b00011,
                F_SL   = 5'b00100,
                F_SR   = 5'b00101,
                F_ADD  = 5'b00110,
                F_SUB  = 5'b00111,
                F_ST   = 5'b01000,
                F_LD   = 5'b01001,
                F_JR   = 5'b01010,
                F_JALR = 5'b11000,
                F_SB   = 5'b01011,
                F_LB   = 5'b01100,
                F_LBU  = 5'b01101,
                F_EINT = 5'b01110,
                F_RTI  = 5'b01111;

//ope_opcode
parameter [4:0] OP_REG   = 5'b00000,
                OP_LDI   = 5'b01000,
                OP_LDIU  = 5'b01001,
                OP_ADDI  = 5'b01100,
                OP_ADDIU = 5'b01101,
                OP_LDHI  = 5'b01010,
                OP_BEZ   = 5'b10000,
                OP_BNZ   = 5'b10001,
                OP_BPL   = 5'b10010,
                OP_BMI   = 5'b10011,
                OP_JMP   = 5'b10100,
                OP_JAL   = 5'b10101;

                

