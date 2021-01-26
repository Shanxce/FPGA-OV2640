`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/28 22:11:55
// Design Name: 
// Module Name: sccb_solve
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


module sccb_solve(
    input clk,
    input rst,
    inout sio_d,            //摄像头sio_d信号
    output reg sio_c,       //摄像头sio_c信号
    input reg_ready,            //寄存器配置是否完成
    output reg sccb_ready=0,    //SCCB协议传输完成
    input [7:0]data_addr,       //寄存器地址
    input [7:0]data_in          //寄存器数据
);

    reg[16:0] wait_time=0;
    reg[9:0] time_wait=10'b1000000000;
    reg[11:0] time_wait_long=12'b100000000000;

    reg [3:0] stat=0;
    reg [4:0] nxt_stat=0;
    reg [8:0] change_time=0;

    parameter stat_prepare=0;
    parameter stat_begin1=1;
    parameter stat_begin2=2;
    parameter stat_change1=3;
    parameter stat_change2=4;
    parameter stat_change3=5;
    parameter stat_end1=6;
    parameter stat_end2=7;
    parameter stat_end3=8;
    parameter stat_wait=9;

    reg [31:0] data_temp;
    reg sio_d_send;
    always @ (posedge clk)
    begin
        if(rst)
        begin
            stat<=stat_prepare;
            wait_time<=0;
            data_temp<=32'hffffffff;
        end
        else
        begin
            case(stat)
                stat_prepare:
                begin
                    if(reg_ready)
                    begin
                        data_temp<={2'b10,8'h60,1'bx,data_addr,1'bx,data_in,1'bx,3'b011};
                        stat=stat_begin1;
                    end
                end

                stat_begin1:
                begin
                    change_time<=2;
                    wait_time<=time_wait_long;
                    stat<=stat_wait;
                    nxt_stat<=stat_begin2;
                    sio_c<=1;
                end 
                stat_begin2:
                begin
                    data_temp<={data_temp[30:0],1'b1};
                    wait_time<=time_wait*3;
                    stat<=stat_wait;
                    nxt_stat<=stat_change3;
                    sio_c<=1;
                end

                stat_change1:
                begin
                    data_temp<={data_temp[30:0],1'b1};
                    change_time<=change_time+1;
                    if(change_time==10 || change_time==19 || change_time==28)
                        sio_d_send<=0;
                    else
                        sio_d_send<=1;
                    wait_time<=time_wait;
                    stat<=stat_wait;
                    if(change_time==29)
                        nxt_stat<=stat_end1;
                    else
                        nxt_stat<=stat_change2;
                    sio_c<=0;
                end
                stat_change2:
                begin
                    wait_time<=time_wait*2;
                    stat<=stat_wait;
                    nxt_stat<=stat_change3;
                    sio_c<=1;
                end
                stat_change3:
                begin
                    wait_time<=time_wait;
                    stat<=stat_wait;
                    nxt_stat<=stat_change1;
                    sio_c<=0;
                end

                stat_end1:
                begin
                    wait_time<=time_wait*3;
                    stat<=stat_wait;
                    nxt_stat<=stat_end2;
                    sio_c<=1;
                end
                stat_end2:
                begin
                    data_temp<={data_temp[30:0],1'b1};
                    wait_time<=time_wait_long;
                    stat<=stat_wait;
                    nxt_stat<=stat_end3;
                    sio_c<=1;
                end
                stat_end3:
                begin
                    data_temp<={data_temp[30:0],1'b1};
                    wait_time<=time_wait_long;
                    stat<=stat_wait;
                    nxt_stat<=stat_prepare;
                    sio_c<=1;
                end

                stat_wait:
                begin
                    if(wait_time==0)
                        stat<=nxt_stat;
                    else
                        wait_time<=wait_time-1;
                end
            endcase
        end
    end

    always @ (posedge clk)
    begin
        sccb_ready<=(stat==stat_prepare)&&(reg_ready==1);
    end

    assign sio_d=sio_d_send?data_temp[31]:'bz;
endmodule

