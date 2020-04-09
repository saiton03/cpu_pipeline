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
            
        end
    end

    assign op = imem[pc];
endmodule

