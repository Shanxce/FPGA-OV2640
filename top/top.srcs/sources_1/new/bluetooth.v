`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/26 18:06:16
// Design Name: 
// Module Name: bluetooth
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

module bluetooth(
    input clk_bluetooth,
    input rst,
    input data_bluetooth,
    output reg[3:0] bluetooth_dealed,
    output reg [7:0] bluetooth_out
);
    parameter bps=9600;    
    parameter need_cnt=100000000/bps;   //对应9600波特率
    reg [15:0] bps_cnt;     //每一位中的计数器
    reg [3:0] cnt;          //每一组数据的计数器
    reg [1:0] first_two;    //除去滤波
    reg begin_bps_cnt;      //加法使能信号

    always @ (posedge clk_bluetooth)
    begin
        if(rst)
            first_two<=2'b11;
        else
            first_two<={first_two[0],data_bluetooth};    //串行赋值
    end

    always @ (posedge clk_bluetooth)
    begin
        if(rst)
            begin_bps_cnt<=0;
        else if(first_two[1]&~first_two[0])
            begin_bps_cnt<=1;
        else if(cnt==8 && bps_cnt==need_cnt-1)
            begin_bps_cnt<=0;
    end

    always @ (posedge clk_bluetooth)
    begin
        if(rst)
        begin
            bps_cnt<=0;
            cnt<=0;
        end
        else if(begin_bps_cnt)
        begin
            if(bps_cnt==need_cnt-1)
            begin
                bps_cnt<=0;
                if(cnt==8)
                    cnt<=0;
                else
                    cnt<=cnt+1;
            end
            else
                bps_cnt<=bps_cnt+1;
        end
    end
    
    always @ (posedge clk_bluetooth)
    begin
        if(rst)
            bluetooth_out<=0;
        else if(begin_bps_cnt && bps_cnt==need_cnt/2-1 && cnt>0)
            bluetooth_out[cnt-1]<=data_bluetooth;
    end
    
    always @ (posedge clk_bluetooth)
    begin
        if(cnt==8)
        begin
            if(bluetooth_out[3:0]==0)
                bluetooth_dealed[3:0]<=0;
            else if(bluetooth_out[3:0]==4)
                bluetooth_dealed[2]<=1;
            else if(bluetooth_out[3:0]==5)
                bluetooth_dealed[2]<=0;
            else
                bluetooth_dealed[1:0]<=bluetooth_out[1:0];
        end
    end
endmodule

