`timescale 1ns / 1ps

module Dflipflop(D,clock,reset,Q);
    input D,clock,reset; //data ,clock,reset input
    output reg Q;   //output Q

    always @(posedge clock) begin
    if(reset)  
    Q<=0;
    else  
    Q<=D;
    end
endmodule
