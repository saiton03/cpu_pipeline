module led(
    input wire clk,
    input wire rst_n,
    input wire we,
    input wire [15:0] in,
    input wire [15:0] addr,
    output reg [11:0] led
);
    wire addr_l = addr[9:0];
    reg [7:0] mem [3:0];
    reg [13:0] cnt;

    always @(posedge clk) begin
        if (!rst_n) begin
            mem[0] <= 8'b0;
            mem[1] <= 8'b0;
            mem[2] <= 8'b0;
            mem[3] <= 8'b0;
            cnt <= 14'b0;
            led <= 12'b0;
        end else begin
            cnt <= cnt+1;
            if(we) begin
                case(addr)
                    10'h3fc:mem[0]<=in[7:0];
                    10'h3fd:mem[1]<=in[7:0];
                    10'h3fe:mem[2]<=in[7:0];
                    10'h3ff:mem[3]<=in[7:0];
                endcase
            end
            if (!cnt[11:0]) begin
                case (cnt[13:12])
                    2'b00 : led <= {4'b1110, mem[0]};
                    2'b01 : led <= {4'b1101, mem[1]};
                    2'b10 : led <= {4'b1011, mem[2]};
                    2'b11 : led <= {4'b0111, mem[3]};
                endcase
            end
        end
    end
endmodule

