module DMmem(Address,DataWr,DMWr,DMCtrl,sw,DataRd,Leds);
  input logic DMWr;
  input logic [2:0] DMCtrl;
  input logic [31:0] Address;
  input logic [9:0] sw;
  input logic signed [31:0] DataWr;
  output logic signed [31:0] DataRd;
  output logic [9:0] Leds;
  localparam Tamano = (2**10) - 1;
  reg [7:0] memory [Tamano : 0];

  always_comb 
    begin 
    if(DMWr) 
      begin
      case (DMCtrl)
        //B
        3'b000: begin 
          memory[Address] <= DataWr[7:0];
        end
        
        //H
        3'b001: begin 
          memory[Address] <= DataWr[7:0];
          memory[Address+1] <= DataWr[15:8];
        end
        
        //W
        3'b010: 
          begin
            memory[Address] <= DataWr[7:0];
          	memory[Address+1] <= DataWr[15:8];
            memory[Address+2] <= DataWr[23:15];
            memory[Address+3] <= DataWr[31:23];
          
        end
      endcase
    end    
  end

  
  always_comb 
    begin
    case (DMCtrl)
      //B
      3'b000: begin
        DataRd <= {{24{memory[Address][7]}}, memory[Address]};
      end
      
      //H
      3'b001: begin
        DataRd <= {{16{memory[Address+1][7]}}, memory[Address+1], memory[Address]};
      end
      
      //W
      3'b010: begin
        DataRd <= {memory[Address+3], memory[Address+2], memory[Address+1], memory[Address]};
      end
      
      //Bu
      3'b100: begin
        DataRd <= {24'b0, memory[Address]};
      end
      
      //Hu
      3'b101: begin
        DataRd <= {16'b0, memory[Address+1], memory[Address]};
      end
      
      default: DataRd = 32'b1111;
    endcase

  end
endmodule
/*
module testbench;
    logic [31:0] address;
    logic [31:0] datawr;
    logic DMWr;
    logic [2:0]  DMCtrl;
    logic [9:0]  sw;

   logic [31:0] datard;
   logic [31:0] Leds;

  DMmem Multi(
    .address(address),
    .datawr(datawr),
    .DMWr(DMWr),
    .DMCtrl(DMCtrl),
    .sw(sw),
    .datard(datard),
    .Leds(Leds));

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    address = 0;
    DMCtrl = 3'b000;
    datawr = 32'b10101010;
    DMWr = 0;
    sw = 10'b1010101010;
    repeat (10)
      begin
        #5;
        case (DMCtrl)
            3'b000: DMCtrl = 3'b001;
            3'b001: DMCtrl = 3'b010;
            3'b010: DMCtrl = 3'b100;
            3'b100: DMCtrl = 3'b101;
            3'b101: DMCtrl = 3'b111;
            3'b111: DMCtrl = 3'b000;
            default: DMCtrl = 0;
          endcase
      end
   	#10
    DMWr = 1;
    repeat (10)
      begin
        #5;
        case (DMCtrl)
            3'b000: DMCtrl = 3'b001;
            3'b001: DMCtrl = 3'b010;
            3'b010: DMCtrl = 3'b100;
            3'b100: DMCtrl = 3'b101;
            3'b101: DMCtrl = 3'b111;
            3'b111: DMCtrl = 3'b000;
            default: DMCtrl = 0;
          endcase
      end
    DMWr = 0;
	#10	
    repeat (10)
      begin
        #5;
        case (DMCtrl)
            3'b000: DMCtrl = 3'b001;
            3'b001: DMCtrl = 3'b010;
            3'b010: DMCtrl = 3'b100;
            3'b100: DMCtrl = 3'b101;
            3'b101: DMCtrl = 3'b111;
            3'b111: DMCtrl = 3'b000;
            default: DMCtrl = 0;
          endcase
      end
  
    #150
    $finish;
  end
endmodule
*/