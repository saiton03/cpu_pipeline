module alu(
    input wire [15:0] ina,
    input wire [15:0] inb,
    input wire [2:0] com,
    output reg [15:0] out
);
    `include "def.h"
    
    always @(*) begin
        case (com)
            THA : out = ina;
            THB : out = inb;
            AND : out = ina & inb;
            OR  : out = ina | inb;
            SL  : out = ina << inb;
            SR  : out = ina >> inb; 
            ADD : out = ina + inb;
            SUB : out = ina - inb;
            default : out = 16'hx;
        endcase
    end

endmodule
