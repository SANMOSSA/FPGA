module Multiplexor(rs,muxS,X0,X1,X2,X3,X4,X5,X6,X7,
                    X8,X9,X10,X11,X12,X13,X14,X15,
                    X16,X17,X18,X19,X20,X21,X22,X23,X24,
                    X25,X26,X27,X28,X29,X30,X31);
                
    input logic [4:0] rs;  
    input logic [31:0] X0 ;    
    input logic [31:0] X1 ;    
    input logic [31:0] X2 ;     
    input logic [31:0] X3 ;    
    input logic [31:0] X4 ;    
    input logic [31:0] X5 ;    
    input logic [31:0] X6 ;    
    input logic [31:0] X7 ;    
    input logic [31:0] X8 ;    
    input logic [31:0] X9 ;    
    input logic [31:0] X10;    
    input logic [31:0] X11;    
    input logic [31:0] X12;    
    input logic [31:0] X13;    
    input logic [31:0] X14;    
    input logic [31:0] X15;    
    input logic [31:0] X16;    
    input logic [31:0] X17;    
    input logic [31:0] X18;     
    input logic [31:0] X19;    
    input logic [31:0] X20;    
    input logic [31:0] X21;    
    input logic [31:0] X22;    
    input logic [31:0] X23;    
    input logic [31:0] X24;    
    input logic [31:0] X25;    
    input logic [31:0] X26;    
    input logic [31:0] X27;    
    input logic [31:0] X28;    
    input logic [31:0] X29;    
    input logic [31:0] X30;    
    input logic [31:0] X31;    
    output logic [31:0] muxS;
    
always_comb
    begin
        case (rs)
            5'd0:  muxS <= X0;
            5'd1:  muxS <= X1;
            5'd2:  muxS <= X2;
            5'd3:  muxS <= X3;
            5'd4:  muxS <= X4;
            5'd5:  muxS <= X5;
            5'd6:  muxS <= X6;
            5'd7:  muxS <= X7;
            5'd8:  muxS <= X8;
            5'd9:  muxS <= X9;
            5'd10: muxS <= X10;
            5'd11: muxS <= X11;
            5'd12: muxS <= X12;
            5'd13: muxS <= X13;
            5'd14: muxS <= X14;
            5'd15: muxS <= X15;
            5'd16: muxS <= X16;
            5'd17: muxS <= X17;
            5'd18: muxS <= X18;
            5'd19: muxS <= X19;
            5'd20: muxS <= X20;
            5'd21: muxS <= X21;
            5'd22: muxS <= X22;
            5'd23: muxS <= X23;
            5'd24: muxS <= X24;
            5'd25: muxS <= X25;
            5'd26: muxS <= X26;
            5'd27: muxS <= X27;
            5'd28: muxS <= X28;
            5'd29: muxS <= X29;
            5'd30: muxS <= X30;
            5'd31: muxS <= X31;
            default: muxS <= X0;
        endcase             
    end
endmodule