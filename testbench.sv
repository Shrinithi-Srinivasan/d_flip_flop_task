module d_flip_flop_tb;
  logic d;
  logic clk;
  logic rst;
  logic q;
  d_flip_flop dut(.d(d),.clk(clk),.rst(rst),.q(q));
  task clk_gen();
    begin
      clk = 1;
      forever #5 clk = ~clk;
    end
  endtask
  task rst_gen();
    begin
      rst = 1;
      #10 rst = 0;
    end
  endtask
  task stimulus();
    begin
      d = 0;
      #10 d = $urandom_range(0,1);
      #20 d = $urandom_range(0,1);
      #30 d = $urandom_range(0,1);
      #40 $finish;
    end
  endtask
  initial begin
    fork
      clk_gen();
      rst_gen();
      stimulus();
    join
  end
  initial begin
    $dumpfile("dumpfile.vcd");
    $dumpvars(1);
  end
  initial begin
    $display("End of stimulation!");
  end
endmodule
