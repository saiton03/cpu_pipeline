module register (
    input wire clk,
    input wire rst_n,
    input wire [2:0] a_addr,
    input wire [2:0] b_addr,
    input wire [2:0] c_addr,
    input wire [15:0] ref_c,
    output wire [15:0] ref_a,
    output wire [15:0] ref_b,
    input wire rwe
);
    reg [15:0] regis [7:0];
    integer i;

    always @(posedge clk) begin
        if(!rst_n) begin
            for(i=0;i<8;i=i+1) 
                regis[i] <= 16'h0;
        end else begin
            if(rwe) regis[c_addr] <= ref_c;
        end
    end

    assign ref_a = (c_addr == a_addr && rwe)? ref_c: regis[a_addr];
    assign ref_b = (c_addr == b_addr && rwe)? ref_c: regis[b_addr];
endmodule
