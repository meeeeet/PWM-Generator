
iverilog tb_clk.v clkduty.v
vvp a.out
gtkwave wave.vcd
rm a.out
rm wave.vcd
