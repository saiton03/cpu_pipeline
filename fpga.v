module fpga
(
  input  wire        clk,
  input  wire        rst_n,
);

  wire clk_out;
  wire rst_n_out;
  wire locked;

  /* clock wizard */
  clk_wiz clk_wiz_inst
  (
    .clk_in1  (clk),
    .clk_out1 (clk_out),
    .resetn  (rst_n),
    .locked  (locked)
  );

  /* synqhronous reset */
  synqrst synqrst_inst
  (
    .clk         (clk_out),
    .asynq_rst_n (locked),
    .synq_rst_n  (rst_n_out)
  );

  /* top */
  poco_r top_inst
  (
    .clk   (clk_out),
    .rst_n (rst_n_out),
  );

endmodule
