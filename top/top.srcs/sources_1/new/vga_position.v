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
    input clk,//ʱ������
    input rst,//�����źţ��ߵ�ƽ��Ч
    output reg[11:0] col_now,//�����ʱ������
    output reg[11:0] row_now,//�����ʱ������
    output is_display,//������ʱ�Ƿ��ܹ����
    output col_vga,//����Ч�ź�`
    output row_vga//����Ч�ź�
);
    //�в���
    parameter col_sync=11'd96;
    parameter col_left=11'd144;
    parameter col_right=11'd784;
    parameter col_all=11'd800;
    //�в���
    parameter row_sync=11'd2;
    parameter row_left=11'd35;
    parameter row_right=11'd515;
    parameter row_all=11'd525;
    //
    assign is_display=((col_now>=col_left)&&(col_now<=col_right)
    &&(row_now>=row_left)&&(row_now<=row_right));
    
    assign col_vga=(col_now>=col_sync);//��ͬ���ź�����ʱ��
    assign row_vga=(row_now>=row_sync);//��ͬ���ź�����ʱ��
    
    always @ (posedge clk)//�жϴ�ʱ�Ƿ���Խ��л���ͼ��
    begin
        if(rst)//�����ź�
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
