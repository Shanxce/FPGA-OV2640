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
    //VGAģ��ӿ�
    output [3:0] red_vga,green_vga,blue_vga,//rgb������Ϣ
    output col_vga, //��ʱ���ź�
    output row_vga, //��ʱ���ź�
    
    //����ģ��ӿ�
    input bluetooth_in, //��pmod
    
    //����ͷ����ӿ� 
    input pclk,href,vsync,//���ڿ���ͼ�����ݴ���������ź�
    input [7:0] camera_data ,//ͼ�������ź�
    output sio_c,//����ͷsio_c�ź�
    inout sio_d,//����ͷsio_d�ź�
    output reset,//reset�źţ���Ҫ���ߣ���������üĴ���
    output pwdn,//pwdn�źţ����ͣ��رպĵ�ģʽ
    output xclk,//xclk�źţ��ɲ���

    //�����
    output[7:0] dis_pos,//�������ʾλ��
    output[6:0] display,//�������ʾ
    
    input  clk,//�����Դ�ʱ�ӣ�100mhz
    input  rst//��λ���ߵ�ƽ��Ч
    );

    //vgaʱ�� 25.175mhz,����ʱ��100mhz������ͷʱ��25mhz, blk 100mhz
    wire clk_vga, clk_bluetooth, clk_camera ,clk_blk;
    wire locked; 
    clk_wiz_0 div(.clk_in1(clk),.clk_out1(clk_vga),.clk_out2(clk_bluetooth),
    .clk_out3(clk_camera),.clk_out4(clk_blk),.locked(locked),.reset(0));
    
    wire [7:0] bluetooth_out;//�������ݴ���
    wire [3:0] bluetooth_dealed;
    bluetooth bt(.clk_bluetooth(clk_bluetooth),.rst(rst),.data_bluetooth(bluetooth_in),
    .bluetooth_out(bluetooth_out),.bluetooth_dealed(bluetooth_dealed));
        
    camera cam(.clk(clk_camera),.rst(rst),.sio_c(sio_c),.sio_d(sio_d),.reset(reset),.pwdn(pwdn),.xclk(xclk));

    wire [11:0] ram_data;//д����
    wire [18:0] ram_addr;//д��ַ
    wire  write_ready;//����д��Ч

    getpic gp(.rst(rst),.pclk(pclk),.href(href),.vsync(vsync),.data_camera(camera_data),.bluetooth_dealed(bluetooth_dealed),
    .data_out(ram_data),.write_ready(write_ready),.now_addr(ram_addr));
    
    wire [11:0] vga_data;//������
    wire [18:0] vga_addr;//����ַ

    blk_mem_gen_0 buffer(.clka(clk_blk),.ena(1),.wea(write_ready),.addra(ram_addr),.dina(ram_data),
    .clkb(clk_blk),.enb(1),.addrb(vga_addr),.doutb(vga_data));

    display7 dis(.clk(clk_blk),.rst(rst),.iData(bluetooth_dealed[3:0]),.oData(display),.dis_pos(dis_pos));

    vga_show showw(.clk_vga(clk_vga),.rst(rst),.data_rgb(vga_data),.ram_addr(vga_addr),.bluetooth_dealed(bluetooth_dealed),
    .col_vga(col_vga),.row_vga(row_vga),.red_vga(red_vga),.green_vga(green_vga),.blue_vga(blue_vga));

endmodule
