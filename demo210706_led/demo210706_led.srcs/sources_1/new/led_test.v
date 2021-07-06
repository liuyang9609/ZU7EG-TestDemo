`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/06 14:36:00
// Design Name: 
// Module Name: led_test
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


module led_test#(
    parameter cnt_full = 32'd49_999_999
)(
    input diff_clk_p_i,
    input diff_clk_n_i,
    input rst_n_i,
    output reg [1:0] led_o
    );

    wire clk_i;
    reg [31:0] tcnt;

    IBUFGDS CLK_U(
        .I(diff_clk_p_i),
        .IB(diff_clk_n_i),
        .O(clk_i)
    );

    always @(posedge clk_i)begin
        if(!rst_n_i)
            begin
                tcnt <= 32'd0;
                led_o <= 2'b1;
            end
        else if(tcnt < cnt_full)
            tcnt <= tcnt + 1'b1;
        else 
        begin
            if(led_o == 2'b10)
            begin
                led_o <= 2'b1;
            end
            else 
            begin
                led_o <= led_o << 1;
            end
            tcnt <= 32'd0;
        end     
    end

endmodule
