//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Tue Jul  6 16:19:10 2021
//Host        : LiuYang-Laptop running 64-bit major release  (build 9200)
//Command     : generate_target system_wrapper.bd
//Design      : system_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

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