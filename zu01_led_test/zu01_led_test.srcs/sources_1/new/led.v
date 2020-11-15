`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/15 17:59:17
// Design Name: 
// Module Name: led
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module run_led#
(
parameter TSET = 32'd49_999_999
)
(
    input diff_clock_clk_p,
    input diff_clock_clk_n,
    input RSTn_i,
    output reg [1:0]LED_o
);

wire CLK_i;
reg [31:0]tcnt;

//对差分时钟采用 IBUFGDS IP 核去转换
IBUFGDS CLK_U(
.I(diff_clock_clk_p),
.IB(diff_clock_clk_n),
.O(CLK_i)
);

always @(posedge CLK_i)begin
    if(!RSTn_i)
        tcnt <= 32'd0;
    else if(tcnt < TSET) 
        tcnt <= tcnt + 1'b1;
    else 
        tcnt <= 32'd0;
end

wire led_en = (tcnt == TSET); 

always @(posedge CLK_i)
    if(!RSTn_i)begin
    LED_o <= 2'b1;
    end
    else if(led_en)begin
        if(LED_o == 2'b10)
            LED_o <= 2'b1;
        else LED_o <= LED_o << 1;
    end
    
endmodule	
