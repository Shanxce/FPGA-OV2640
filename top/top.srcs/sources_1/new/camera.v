`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/28 22:07:14
// Design Name: 
// Module Name: camera
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


module camera(
    input clk,
    input rst,
    output sio_c,
    inout sio_d,
    output reset,
    output pwdn,
    output xclk
);
    assign reset=1;
    assign pwdn=0;
    assign xclk=clk;
    wire [15:0] data_send;
    wire reg_ready,sccb_ready;
    reg_solve init(.clk(clk),.rst(rst),.data_out(data_send),.reg_ready(reg_ready),.sccb_ready(sccb_ready));
    sccb_solve sender(.clk(clk),.rst(rst),.sio_d(sio_d),.sio_c(sio_c),.reg_ready(reg_ready),.sccb_ready(sccb_ready),.data_addr(data_send[15:8]),.data_in(data_send[7:0]));

endmodule
