module fpga
(
  input  wire        clk,
  input  wire        rst_n,
  output wire [11:0] led
);
  
  wire clk_out;
  wire rst_n_out;
  wire locked;

  
  clk_wiz_0 clk_wiz_inst
  (
    .clk_in1  (clk),
    .clk_out1 (clk_out),
    .resetn  (rst_n),
    .locked  (locked)
  );

  synqrst synqrst_inst
  (
    .clk         (clk_out),
    .asynq_rst_n (locked),
    .synq_rst_n  (rst_n_out)
  );
  
  /* top */
  poco_r poco_inst
  (
    .clk   (clk_out),
    .rst_n (rst_n_out),
    .led (led)
  );

endmodule
