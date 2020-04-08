module memory (
    input wire clk,
    input wire rst_n,
    input wire [15:0] addr,
    input wire [15:0] data_in,
    input wire we,
    output wire [15:0] data_out
);

    reg [7:0] mem [65535:0];

    integer i;

    always @(posedge clk) begin
        if(!rst_n) begin
            for(i=0;i<65535;i=i+1)
                mem[i]<=8'h0;
        end else begin
            if(we) begin
                mem[addr]<=data_in[7:0];
                mem[addr+1]<=data_in[15:8];
            end
        end
    end

    assign data_out = {mem[addr+1],mem[addr]};

endmodule

