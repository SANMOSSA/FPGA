module Deco532(rd,RuWr,enS);
                
    input logic [4:0] rd;  
    input logic RuWr;  
    output logic [31:0] enS;
always_comb
    if (RuWr)
    begin
        case (rd)
            5'd0: enS  <= 32'b00000000000000000000000000000000;
            5'd1: enS  <= 32'b00000000000000000000000000000010;
            5'd2: enS  <= 32'b00000000000000000000000000000100;
            5'd3: enS  <= 32'b00000000000000000000000000001000;
            5'd4: enS  <= 32'b00000000000000000000000000010000;
            5'd5: enS  <= 32'b00000000000000000000000000100000;
            5'd6: enS  <= 32'b00000000000000000000000001000000;
            5'd7: enS  <= 32'b00000000000000000000000010000000;
            5'd8: enS  <= 32'b00000000000000000000000100000000;
            5'd9: enS  <= 32'b00000000000000000000001000000000;
            5'd10: enS <= 32'b00000000000000000000010000000000;
            5'd11: enS <= 32'b00000000000000000000100000000000;
            5'd12: enS <= 32'b00000000000000000001000000000000;
            5'd13: enS <= 32'b00000000000000000010000000000000;
            5'd14: enS <= 32'b00000000000000000100000000000000;
            5'd15: enS <= 32'b00000000000000001000000000000000;
            5'd16: enS <= 32'b00000000000000010000000000000000;
            5'd17: enS <= 32'b00000000000000100000000000000000;
            5'd18: enS <= 32'b00000000000001000000000000000000;
            5'd19: enS <= 32'b00000000000010000000000000000000;
            5'd20: enS <= 32'b00000000000100000000000000000000;
            5'd21: enS <= 32'b00000000001000000000000000000000;
            5'd22: enS <= 32'b00000000010000000000000000000000;
            5'd23: enS <= 32'b00000000100000000000000000000000;
            5'd24: enS <= 32'b00000001000000000000000000000000;
            5'd25: enS <= 32'b00000010000000000000000000000000;
            5'd26: enS <= 32'b00000100000000000000000000000000;
            5'd27: enS <= 32'b00001000000000000000000000000000;
            5'd28: enS <= 32'b00010000000000000000000000000000;
            5'd29: enS <= 32'b00100000000000000000000000000000;
            5'd30: enS <= 32'b01000000000000000000000000000000;
            5'd31: enS <= 32'b10000000000000000000000000000000;
            default: enS     <= 32'd0;
        endcase             
    end
endmodule