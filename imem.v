module imem (
    input wire clk,
    input wire rst_n,
    input wire [15:0] pc,
    output wire [15:0] op
);
    `include "def.h"

    reg [15:0] imem [4095:0]; //12'hfff

    integer i;
    always @(posedge clk) begin
        if(!rst_n) begin
            for(i=0;i<4096;i=i+1)
                imem[i] <= 16'h0;
            imem[0]<={OP_LDI,3'h0,8'haf};
            imem[1]<={OP_REG,3'h1,3'h0,F_ADD};
            imem[2]<={OP_REG,3'h2,3'h0,F_ADD};
            imem[3]<={OP_REG,3'h0,3'h3,F_ST};
            imem[4]<={OP_JMP,11'h7ff};
            imem[5]<=16'h0;
        end
    end

    assign op = imem[pc];
endmodule

