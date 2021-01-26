`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/26 18:08:02
// Design Name: 
// Module Name: display7
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


module display7(
    input clk,
    input rst,
    input [3:0] iData,
    output reg [7:0] dis_pos,
    output reg [6:0] oData
);
    reg [3:0] cnt=0;
    reg [20:0] cnt2=0;


    always @(posedge clk)
    begin
        if(cnt2==400)
        begin
            cnt2<=0;
            if(cnt==7)
                cnt<=0;
            else
                cnt<=cnt+1;
        end
        else
            cnt2<=cnt2+1;
    end
    
    always @(posedge clk)
    begin
        if(rst)
        begin
            case(cnt)
                0:
                begin
                    dis_pos<=8'b11111110;
                    oData<=7'b0000010;
                end
                1:
                begin
                    dis_pos<=8'b11111101;
                    oData<=7'b1000000;
                end
                2:
                begin
                    dis_pos<=8'b11111011;
                    oData<=7'b0010010;
                end
                3:
                begin
                    dis_pos<=8'b11110111;
                    oData<=7'b1111001;
                end
                4:
                begin
                    dis_pos=8'b11101111;
                    oData=7'b0010010;
                end
                5:
                begin
                    dis_pos<=8'b11011111;
                    oData<=7'b0000000; 
                end
                6:
                begin
                    dis_pos<=8'b10111111;
                    oData<=7'b1111001;
                end
            endcase
        end
        else
        begin
            dis_pos = 8'b11111110;
            case(iData)
                0: oData=7'b1000000;
                1: oData=7'b1111001;
                2: oData=7'b0100100;
                3: oData=7'b0110000;
                4: oData=7'b0011001;
                5: oData=7'b0010010;
                6: oData=7'b0000010;
                7: oData=7'b1111000;  
                8: oData=7'b0000000;  
                9: oData=7'b0010000;    
            endcase 
        end
    end
endmodule
