`timescale 1ps/1ps
module test;
    reg clk;
    reg rst_n;

    poco_r poco_inst(
        .clk (clk),
        .rst_n (rst_n)
    );

    always #5 clk = ~clk;

    integer i;

    initial begin
        $dumpfile("poco_r.vcd");
        $dumpvars(0, poco_inst);
        for(i=0;i<8;i++) $dumpvars(1,poco_inst.id_inst.register_inst.regis[i]); //show regster values
        for(i=0;i<32;i++) $dumpvars(1,poco_inst.memory_inst.mem[i]); //show regster values
        $dumpvars(1,poco_inst.memory_inst.mem[928]); 
        $dumpvars(1,poco_inst.memory_inst.mem[929]); 
        $dumpvars(1,poco_inst.memory_inst.mem[930]); 
        $dumpvars(1,poco_inst.memory_inst.mem[931]); 

        $dumplimit(1000000000);
        rst_n<=0;
        clk<=0;
    #25
        rst_n<=1;
    #1000000
        $finish;
    end

endmodule

