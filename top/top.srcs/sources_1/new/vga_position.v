`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/26 18:05:25
// Design Name: 
// Module Name: vga_position
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


module vga_position(
    input clk,//时钟周期
    input rst,//清零信号，高电平有效
    output reg[11:0] col_now,//输出此时行坐标
    output reg[11:0] row_now,//输出此时列坐标
    output is_display,//表征此时是否能够输出
    output col_vga,//行有效信号`
    output row_vga//列有效信号
);
    //行参数
    parameter col_sync=11'd96;
    parameter col_left=11'd144;
    parameter col_right=11'd784;
    parameter col_all=11'd800;
    //列参数
    parameter row_sync=11'd2;
    parameter row_left=11'd35;
    parameter row_right=11'd515;
    parameter row_all=11'd525;
    //
    assign is_display=((col_now>=col_left)&&(col_now<=col_right)
    &&(row_now>=row_left)&&(row_now<=row_right));
    
    assign col_vga=(col_now>=col_sync);//行同步信号拉低时段
    assign row_vga=(row_now>=row_sync);//场同步信号拉低时段
    
    always @ (posedge clk)//判断此时是否可以进行绘制图像
    begin
        if(rst)//清零信号
        begin
            col_now<=0;
            row_now<=0;
        end
        else
        begin
            if(col_now==col_all-1)
            begin
                col_now<=0;
                if(row_now==row_all-1)
                    row_now<=0;
                else
                    row_now<=row_now+1;
            end
            else
                col_now<=col_now+1;
        end
    end
endmodule
