`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/26 18:01:52
// Design Name: 
// Module Name: top
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


module top(
    //VGA模块接口
    output [3:0] red_vga,green_vga,blue_vga,//rgb像素信息
    output col_vga, //行时序信号
    output row_vga, //场时序信号
    
    //蓝牙模块接口
    input bluetooth_in, //接pmod
    
    //摄像头对外接口 
    input pclk,href,vsync,//用于控制图像数据传输的三组信号
    input [7:0] camera_data ,//图像数据信号
    output sio_c,//摄像头sio_c信号
    inout sio_d,//摄像头sio_d信号
    output reset,//reset信号，需要拉高，否则会重置寄存器
    output pwdn,//pwdn信号，拉低，关闭耗电模式
    output xclk,//xclk信号，可不接

    //数码管
    output[7:0] dis_pos,//数码管显示位置
    output[6:0] display,//数码管显示
    
    input  clk,//板内自带时钟，100mhz
    input  rst//复位，高电平有效
    );

    //vga时钟 25.175mhz,蓝牙时钟100mhz，摄像头时钟25mhz, blk 100mhz
    wire clk_vga, clk_bluetooth, clk_camera ,clk_blk;
    wire locked; 
    clk_wiz_0 div(.clk_in1(clk),.clk_out1(clk_vga),.clk_out2(clk_bluetooth),
    .clk_out3(clk_camera),.clk_out4(clk_blk),.locked(locked),.reset(0));
    
    wire [7:0] bluetooth_out;//蓝牙数据传输
    wire [3:0] bluetooth_dealed;
    bluetooth bt(.clk_bluetooth(clk_bluetooth),.rst(rst),.data_bluetooth(bluetooth_in),
    .bluetooth_out(bluetooth_out),.bluetooth_dealed(bluetooth_dealed));
        
    camera cam(.clk(clk_camera),.rst(rst),.sio_c(sio_c),.sio_d(sio_d),.reset(reset),.pwdn(pwdn),.xclk(xclk));

    wire [11:0] ram_data;//写数据
    wire [18:0] ram_addr;//写地址
    wire  write_ready;//缓存写有效

    getpic gp(.rst(rst),.pclk(pclk),.href(href),.vsync(vsync),.data_camera(camera_data),.bluetooth_dealed(bluetooth_dealed),
    .data_out(ram_data),.write_ready(write_ready),.now_addr(ram_addr));
    
    wire [11:0] vga_data;//读数据
    wire [18:0] vga_addr;//读地址

    blk_mem_gen_0 buffer(.clka(clk_blk),.ena(1),.wea(write_ready),.addra(ram_addr),.dina(ram_data),
    .clkb(clk_blk),.enb(1),.addrb(vga_addr),.doutb(vga_data));

    display7 dis(.clk(clk_blk),.rst(rst),.iData(bluetooth_dealed[3:0]),.oData(display),.dis_pos(dis_pos));

    vga_show showw(.clk_vga(clk_vga),.rst(rst),.data_rgb(vga_data),.ram_addr(vga_addr),.bluetooth_dealed(bluetooth_dealed),
    .col_vga(col_vga),.row_vga(row_vga),.red_vga(red_vga),.green_vga(green_vga),.blue_vga(blue_vga));

endmodule
