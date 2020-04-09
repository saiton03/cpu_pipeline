module imem (
    input wire clk,
    input wire rst_n,
    input wire [15:0] pc,
    output wire [15:0] op
);
    `include "def.h"

    reg [15:0] imem [1023:0]; //10'hfff

    integer i;
    always @(posedge clk) begin
        if(!rst_n) begin
            for(i=0;i<64;i=i+1)
                imem[i] <= 16'h0;
            
            //init
            imem[0]<={OP_LDHI,3'h6,8'h3}; 
            imem[1]<={OP_ADDIU,3'h6,8'ha0}; //r6 = 0x3a0
            imem[2]<={OP_LDHI,3'h0,8'h3};
            imem[3]<={OP_ADDIU,3'h0,8'h70}; //r0 = 0x370 (880)
            imem[4]<={OP_REG,3'h2,3'h0,F_MV}; //r2 =r0
            imem[5]<={OP_REG,3'h3,3'h0,F_MV}; //r3 =r0
            imem[6]<={OP_REG,3'h0,3'h6,F_ST}; //mem[r6] = r0
            imem[7]<={OP_ADDI,3'h6,8'h2}; //r6+=2
            imem[8]<={OP_REG,3'h0,3'h6,F_ST}; //mem[r6] = r0
            imem[9]<={OP_ADDI,3'h6,8'h2}; //r6+=2
            imem[10]<={OP_LDI,3'h1,8'd20}; //r1=20 (node:21)
            imem[11]<={OP_REG,3'h1,3'h6,F_ST}; //mem[r6] = r1
            imem[12]<={OP_ADDI,3'h6,8'hfc}; //r6-=4
            imem[13]<={OP_JMP,11'd16}; //finish init
 
            //warshall-floyd
            imem[30]<={OP_REG,3'h4,3'h2,F_LD}; //r4=mem[r2]
            imem[31]<={OP_REG,3'h5,3'h3,F_LD}; //r5=mem[r3]
            imem[32]<={OP_REG,3'h4,3'h5,F_ADD}; //r4+=r5
            imem[33]<={OP_REG,3'h5,3'h0,F_LD}; //r5=mem[r0]
            imem[34]<={OP_REG,3'h5,3'h4,F_SUB}; //r5-=r4
            imem[35]<={OP_BMI,3'h5, 8'h2}; //if(r5<0) skip:
            imem[36]<={OP_ADDI,3'h1,8'hff}; //r1-- delay
            imem[37]<={OP_REG,3'h4,3'h0,F_ST}; //mem[r0]=r4
            imem[38]<={OP_ADDI,3'h0,8'hfe};  //r0-=2
            imem[39]<={OP_BPL,3'h1,8'hf6}; // if r1>=0 loop
            imem[40]<={OP_ADDI,3'h3,8'hfe};  //r3-=2 delay
 
            imem[41]<={OP_ADDI,3'h2,8'hd6};  //r2-=42 delay
            imem[42]<={OP_LDI,3'h1,8'd20}; //r1=20
            imem[43]<={OP_BMI,3'h2, 8'h3}; //if(r5<0) skip:
            imem[44]<={OP_REG,3'h3,3'h6,F_LD}; //r3=mem[r6]
            imem[45]<={OP_JMP,11'h7f1}; // jmp to loop
            imem[46]<=16'd0; //nop
            
            imem[47]<={OP_ADDI,3'h6,8'd2}; //r6+=2
            imem[48]<={OP_REG,3'h2,3'h6,F_LD}; //r2=mem[r6]
            imem[49]<={OP_ADDI,3'h3,8'hd6}; //r3-=42
            imem[50]<={OP_BMI,3'h3, 8'd9}; //if(r3<0) exit
            imem[51]<={OP_ADDI,3'h2,8'hfe}; //r2-=2
            imem[52]<={OP_REG,3'h2,3'h6,F_ST}; //mem[r6] = r2
            imem[53]<={OP_ADDI,3'h6,8'hfe}; //r6-=2
            imem[54]<={OP_REG,3'h3,3'h6,F_ST}; //mem[r6] = r3
            imem[55]<={OP_LDHI,3'h0,8'h3};
            imem[56]<={OP_JMP,11'h7e8}; //goto loop
            imem[57]<={OP_ADDIU,3'h0,8'h70}; //r0 = 0x370 (880)
 
            imem[60]<={OP_JMP,11'h7ff};  //exit (exdless)

        end
    end

    assign op = imem[pc];
endmodule

