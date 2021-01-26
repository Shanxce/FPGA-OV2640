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



module vga_show(
    input clk_vga,  //输入vga的时钟，频率为25.175MHz
    input rst,      //复位
    input [11:0] data_rgb,       //从RAM中读取的像素信息
    input [3:0] bluetooth_dealed,
    output reg[18:0] ram_addr,  //下一个要读取的RAM地址
    output col_vga,
    output row_vga,
    output reg[3:0] red_vga,
    output reg[3:0] blue_vga,
    output reg[3:0] green_vga
);
//行参数
    parameter col_sync=11'd96;
    parameter col_left=11'd144;
    parameter col_right=11'd784;
    parameter col_all=11'd800;
    parameter col_siz=11'd640;
    //列参数
    parameter row_sync=11'd2;
    parameter row_left=11'd35;
    parameter row_right=11'd515;
    parameter row_all=11'd525;
    parameter row_siz=11'd480;
    
    wire [11:0] col_pos;//行坐标
    wire [11:0] row_pos;//列坐标

    assign col_vga=(col_pos<col_sync)?0:1;//行同步信号拉低时段
    assign row_vga=(row_pos<row_sync)?0:1;//场同步信号拉低时段
    
    vga_pos pos(clk_vga,rst,col_pos,row_pos);

    always@ (*)
    begin
        red_vga=0;
        blue_vga=0;
        green_vga=0;
        if((col_pos>=col_left)&&(col_pos<=col_right)&&(row_pos>=row_left)&&(row_pos<=row_right))
        begin
            ram_addr=(row_pos-row_left)*col_siz+(col_pos-col_left);
            if(bluetooth_dealed[2]==1)
            begin
                if(data_rgb[11:8]+data_rgb[7:4]+data_rgb[3:0]>24)
                begin
                    red_vga=15;
                    green_vga=15;
                    blue_vga=15;
                end
                else
                begin
                    red_vga=0;
                    green_vga=0;
                    blue_vga=0;
                end
            end
            else
            begin
                red_vga=data_rgb[11:8];
                green_vga=data_rgb[7:4];
                blue_vga=data_rgb[3:0];
            end
        end
    end
endmodule


