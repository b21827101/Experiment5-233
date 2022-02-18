`timescale 1ns / 1ps
module controller_tb;

reg x;   //input x,y,clock,reset
reg y;
reg clock;
reg reset;
wire [1:0] out;  //output out
    
controller c(.x(x),.y(y),.clock(clock),.reset(reset),.out(out));
initial begin
  clock  = 0;
  reset   = 1;
  #100;
  reset = 0;
  #100;
 end
//Generate a clock with period
   always #10 clock = ~clock; 
initial begin  //Test sequence
    x=0; y=0;
    #100 x=0; y=0;
    #100 x=1; y=0;
    #100 x=0; y=0;
    #100 x=0; y=1;
    #100 x=1; y=1;
    #100 x=1; y=0;
    #100 x=1; y=1;
    #100 x=0; y=1; 
    end
endmodule
