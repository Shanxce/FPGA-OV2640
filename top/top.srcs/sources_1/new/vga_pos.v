`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/26 18:03:50
// Design Name: 
// Module Name: vga_show
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


module vga_pos(
    input vga_clk,
    input rst,      //复位
    output reg[11:0] col_pos,//行坐标
    output reg[11:0] row_pos//列坐标
);
    parameter col_all=11'd800;
    parameter row_all=11'd525;
    
    always @ (posedge vga_clk)
    begin
            if(col_pos==col_all-1)
            begin
                col_pos<=0;
                if(row_pos==row_all-1)
                    row_pos<=0;
                else
                    row_pos<=row_pos+1;
            end
            else
                col_pos<=col_pos+1;
    end
endmodule
