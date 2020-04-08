module pc(
    input wire clk,
    input wire rst_n,
    input wire [15:0] pc_in,
    output reg [15:0] pc_out
);

    always @(posedge clk) begin
        if (!rst_n) pc_out<= 16'h0;
        else pc_out <= pc_in;
    end

endmodule

