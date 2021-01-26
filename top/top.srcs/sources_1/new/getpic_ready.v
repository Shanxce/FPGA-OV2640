`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/06 22:13:47
// Design Name: 
// Module Name: getpic_ready
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


module getpic_ready (
    input pclk,vsync,      //高电平有效信息
    input [3:0]bluetooth_dealed,   //蓝牙信息
    input [18:0]next_addr,  //当前缓存位置
    output reg get_ready=0    //不同功能时是否正在传输
    );
    
    reg[35:0] wait_time=0;
    parameter wait_1 = 13600000;
    parameter wait_2 = 27200000;

    always@ (negedge pclk)
    begin
        if(bluetooth_dealed[1:0]==0)
            get_ready<=1;
        else if(bluetooth_dealed[1:0]==1)
            get_ready<=0;
        else if(bluetooth_dealed[1:0]==2)
        begin
            if(wait_time==0)
            begin
                if(vsync && next_addr==0)
                begin
                    get_ready<=get_ready^1;
                    wait_time<=wait_1;
                end
            end
            else if(wait_time>wait_1)
                wait_time<=0;
            else
            begin
                wait_time<=wait_time-1;
            end
        end
        else if(bluetooth_dealed[1:0]==3)
        begin
            if(wait_time==0)
            begin
                if(vsync && next_addr==0)
                begin
                    get_ready<=get_ready^1;
                    wait_time<=wait_2;
                end
            end
            else if(wait_time>wait_2)
                wait_time<=0;
            else
            begin
                wait_time<=wait_time-1;
            end
        end
    end
endmodule

