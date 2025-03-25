module vtf_led_test;
  reg sys_clk;      // Single clock signal
  reg rst_n;  
  wire [3:0] led;   // 4-bit LED to match module

  led uut (
    .sys_clk(sys_clk),  // Correcting the port name
    .rst_n(rst_n),
    .led(led)
  );

  initial begin
    sys_clk = 0;
    rst_n = 0;
    #1000;
    rst_n = 1;      // Release reset after 1000ns
    #20000000;      // Extend simulation time to see LED toggle
    $finish;
  end

  // Generate 100 MHz clock (period = 10ns → toggle every 5ns)
  always #5 sys_clk = ~sys_clk; 
endmodule
