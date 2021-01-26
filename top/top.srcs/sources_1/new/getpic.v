`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/28 22:12:33
// Design Name: 
// Module Name: getpic
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


module getpic (
    input rst,  //重置信号
    input pclk, //摄像头内置时钟
    input href, //摄像头传输数据信号
    input vsync,      //摄像头开始/结束传输
    input [7:0]data_camera,     //摄像头传输数据
    input [3:0]bluetooth_dealed,   //蓝牙数据
    output reg[11:0]data_out,   //得到的RGB数据
    output reg write_ready,     //写有效信号
    output reg[18:0]now_addr=0  //数据传输地址
    );

    reg [15:0] rgb565 = 0;
    reg [18:0] next_addr = 0;
    reg [1:0] stat=0;     //状态机表示当前状态
    parameter stat0=0;      //初始状态
    parameter stat1=1;      //8位有效
    parameter stat2=2;      //16位有效
    
    wire get_ready;          //不同功能时是否正在传输
    getpic_ready gpready(.pclk(pclk),.vsync(vsync),.bluetooth_dealed(bluetooth_dealed),
    .next_addr(next_addr),.get_ready(get_ready));
    
        
    always@ (posedge pclk)
        begin
        if(rst==1 || vsync==0)//高电平有效
            begin
                write_ready<=0;
                now_addr <=0;
                next_addr <= 0;
                stat <= 0;
            end
        else
        begin
            if(get_ready)
            begin
                now_addr <= next_addr;
                rgb565 <= {rgb565[7:0], data_camera};
                data_out <= {rgb565[15:12],rgb565[10:7],rgb565[4:1]};
                case(stat)
                    stat0:
                    begin
                        if(href)
                            stat<=stat1;
                        else
                            stat<=stat0;
                        write_ready<=0;
                    end
                    stat1:
                    begin
                        stat<=stat2;
                        write_ready<=0;
                    end
                    stat2:
                    begin
                        if(href)
                            stat=stat1;
                        else
                            stat=stat0;
                        write_ready<=1;
                        next_addr <= next_addr+1;
                    end
                endcase
            end
        end
    end
endmodule
