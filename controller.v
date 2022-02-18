`timescale 1ns / 1ps

module controller(input x,
input y,input clock,
input reset,
output [1:0] out
);

reg [1:0] present_state = 2'b00;
wire [1:0] next_state;
wire w1,w2,w3,w4,w5;


and A1(w1,~present_state[1],present_state[0]);
and A2(w2,present_state[1],x);
and A3(w3,x,~present_state[0],~present_state[1]);
and A5(w5,y,x);
and A4(w4,y,~present_state[1],present_state[0]);
or o1(out[1],w1,w2);
or o2(out[0],w3,w4,w5);

//Instantiate two D flip flops
Dflipflop df(.D((present_state[0]&~present_state[1])|(present_state[1]&x)),
.clock(clock),.reset(reset),
.Q(next_state[1]));

Dflipflop df1(.D((~present_state[0]&~present_state[1]&x)|(present_state[0]&~present_state[1]&y)|(y&x)),
.clock(clock),.reset(reset),
.Q(next_state[0]));

always @(reset or next_state)begin
    if(reset) begin present_state <= 2'b00; end
    else begin present_state <= next_state; end
    end
    
endmodule
