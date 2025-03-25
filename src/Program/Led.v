module led(
  input sys_clk,
  input rst_n,
  input pause_button, // Add a pause control signal
  output reg [3:0] led
);
  reg [31:0] timer_cnt;
  reg paused; // Pause state register

  always @(posedge sys_clk or negedge rst_n) begin
    if (!rst_n) begin
      led <= 4'd0;
      timer_cnt <= 32'd0;
      paused <= 1'b0;
    end
    else begin
      // Toggle pause state when button is pressed
      if (pause_button) paused <= ~paused;

      if (!paused) begin
        if (timer_cnt >= 32'd24_999_999) begin
          led <= ~led;
          timer_cnt <= 32'd0;
        end
        else timer_cnt <= timer_cnt + 32'd1;
      end
    end
  end
endmodule
