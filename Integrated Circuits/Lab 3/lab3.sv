module top(
	input logic clk,
	input logic rst,

	input logic button_left,
	input logic button_right,
	input logic button_up,
	input logic button_down,
  
	input logic button_play,

	output logic winA,
	output logic winB,
	output logic tie,

	output logic [3:0] red,
	output logic [3:0] green,
	output logic [3:0] blue,
	output logic hsync,
	output logic vsync);
	
	
	logic [8:0] rX;
	logic [8:0] rO;
	logic [1:0] cursor_x;
	logic [1:0] cursor_y;
	logic x_o_check; //if 0 Χ plays, if 1 Ο plays
	
	edge_detector left1  (.clk(clk), .rst(rst), .in(button_left), .out(left));
	edge_detector right1 (.clk(clk), .rst(rst), .in(button_right), .out(right));
	edge_detector down1  (.clk(clk), .rst(rst), .in(button_down), .out(down));
	edge_detector up1    (.clk(clk), .rst(rst), .in(button_up), .out(up));
	edge_detector play1  (.clk(clk), .rst(rst), .in(button_play), .out(play));
  
	logic left;
    logic right;
    logic down;
    logic up;
    logic play;
  
    logic stopgame;
    assign stopgame = (winA == 1 || winB == 1 || tie ==1);
 
//game consept

always_ff @(posedge clk) begin
	if (rst) begin
		rX <= 9'b000000000;
		rO <= 9'b000000000;
		cursor_x <= 2'b00;
		cursor_y <= 2'b00;
		x_o_check <= 0 ;
	end 
	else if (clk && stopgame == 0) begin
	
		//Check where the cursor is
		if(right == 1'b1 && cursor_x < 2'b10)
			cursor_x <= cursor_x + 1'b1;
		else
		if(left == 1'b1 && cursor_x > 2'b00)
			cursor_x <= cursor_x - 1'b1;
		else
		if(up == 1'b1 && cursor_y > 2'b00)
			cursor_y <= cursor_y - 1'b1;
		else
		if(down == 1'b1 && cursor_y < 2'b10) 
			cursor_y <= cursor_y + 1'b1;		
		
		
		//check if i can write to a place and finally write and change players turn
		if(cursor_x == 2'b00 && cursor_y == 2'b00 && play == 1'b1) begin
			if(x_o_check == 0 && rX[0] == 0 && rO[0] == 0) begin
				rX[0] <= 1;
				x_o_check <= ~x_o_check;
			end else
			if(x_o_check == 1 && rO[0] == 0 && rX[0] == 0) begin
				rO[0] <= 1;
				x_o_check <= ~x_o_check;
			end 
		end else 
		if(cursor_x == 2'b01 && cursor_y == 2'b00 && play == 1'b1) begin
			if(x_o_check == 0 && rX[1] == 0 && rO[1] == 0) begin
				rX[1] <= 1;
				x_o_check <= ~x_o_check;
			end else
			if(x_o_check == 1 && rO[1] == 0 && rX[1] == 0) begin
				rO[1] <= 1;
				x_o_check <= ~x_o_check;
			end
		end else 
		if(cursor_x == 2'b10 && cursor_y == 2'b00 && play == 1'b1) begin
			if(x_o_check == 0 && rX[2] == 0 && rO[2] == 0) begin
				rX[2] <= 1;
				x_o_check <= ~x_o_check;
			end else
			if(x_o_check == 1 && rO[2] == 0 && rX[2] == 0) begin
				rO[2] <= 1;
				x_o_check <= ~x_o_check;
			end
		end else 
		if(cursor_x == 2'b00 && cursor_y == 2'b01 && play == 1'b1) begin
			if(x_o_check == 0 && rX[3] == 0 && rO[3] == 0) begin
				rX[3] <= 1;
				x_o_check <= ~x_o_check;
			end else
			if(x_o_check == 1 && rO[3] == 0 && rX[3] == 0) begin
				rO[3] <= 1;
				x_o_check <= ~x_o_check;
			end
		end else 
		if(cursor_x == 2'b01 && cursor_y == 2'b01 && play == 1'b1) begin
			if(x_o_check == 0 && rX[4] == 0 && rO[4] == 0) begin
				rX[4] <= 1;
				x_o_check <= ~x_o_check;
			end else
			if(x_o_check == 1 && rO[4] == 0 && rX[4] == 0) begin
				rO[4] <= 1;
				x_o_check <= ~x_o_check;
			end
		end else 
		if(cursor_x == 2'b10 && cursor_y == 2'b01 && play == 1'b1) begin
			if(x_o_check == 0 && rX[5] == 0 && rO[5] == 0) begin
				rX[5] <= 1;
				x_o_check <= ~x_o_check;
			end else
			if(x_o_check == 1 && rO[5] == 0 && rX[5] == 0) begin
				rO[5] <= 1;
				x_o_check <= ~x_o_check;
			end
		end else
		if(cursor_x == 2'b00 && cursor_y == 2'b10 && play == 1'b1) begin
			if(x_o_check == 0 && rX[6] == 0 && rO[6] == 0) begin
				rX[6] <= 1;
				x_o_check <= ~x_o_check;
			end else
			if(x_o_check == 1 && rO[6] == 0 && rX[6] == 0) begin
				rO[6] <= 1;
				x_o_check <= ~x_o_check;
			end
		end else
		if(cursor_x == 2'b01 && cursor_y == 2'b10 && play == 1'b1) begin
			if(x_o_check == 0 && rX[7] == 0 && rO[7] == 0) begin
				rX[7] <= 1;
				x_o_check <= ~x_o_check;
			end else
			if(x_o_check == 1 && rO[7] == 0 && rX[7] == 0) begin
				rO[7] <= 1;
				x_o_check <= ~x_o_check;
			end
		end else
		if(cursor_x == 2'b10 && cursor_y == 2'b10 && play == 1'b1) begin
			if(x_o_check == 0 && rX[8] == 0 && rO[8] == 0) begin
				rX[8] <= 1;
				x_o_check <= ~x_o_check;
			end else
			if(x_o_check == 1 && rO[8] == 0 && rX[8] == 0) begin
				rO[8] <= 1;
				x_o_check <= ~x_o_check;
			end
		end
	end
end
 

logic [10:0] columns;
logic [9:0] rows;
logic [6:0] address_O;
logic [6:0] address_X;

logic [7:0] cnto;
logic [7:0] cntx;

logic [99:0] data_O;
logic [99:0] data_X;


O_ROM orom (.address(address_O),.data(data_O));
X_ROM xrom (.address(address_X),.data(data_X));


//display vga
 
always_ff @(posedge clk) begin
	if (rst)
		pxlClk <= 1'b1;
	else
		pxlClk <= ~pxlClk;
	end
	
logic pxlClk;

always_ff @(posedge clk) begin
	if (rst) begin
		address_O <= 0 ;
		address_X <= 0 ;
		cnto <= 0;
        cntx <= 0;
        columns <= 0;
		rows <= 0;
		hsync <= 1;
		vsync <= 1;
		green <= 4'b0000;
		blue <= 4'b0000;
		red <= 4'b0000;
	end 
  else if (pxlClk) begin
		
		//1st white column
		if(columns >= 290 && columns < 305 ) begin
			green <= 4'b1111;
			blue <= 4'b1111;
			red <= 4'b1111;
		end 
		//design 2nd white column
		else if(columns >= 495 && columns < 510 ) begin 
			green <= 4'b1111;
			blue <= 4'b1111;
			red <= 4'b1111;
		end
		//design 1st white row
		else if(rows >= 190 && rows < 205 && columns >= 100 && columns < 700) begin
			green <= 4'b1111;
			blue <= 4'b1111;
			red <= 4'b1111;
		end
		//design 2nd white row
		else if(rows >= 395 && rows < 410 && columns >= 100 && columns < 700) begin
			green <= 4'b1111;
			blue <= 4'b1111;
			red <= 4'b1111;
		end
		else begin //in every other case make the pixels black
			green <= 4'b0000;
			blue <= 4'b0000;
			red <= 4'b0000;
		end
		
		
		//cursor appearance in vga display
		if((columns >= (110 + cursor_x*205)) && (columns <= (130 + cursor_x*205))) begin
			if((rows >= (10+cursor_y*205) && rows <= (30+cursor_y*205))) begin
				red<=4'b1111;
				green<=4'b1111;
				blue<=4'b1111;
			end
		end
		
		//check every cell in order to write X or O
		
		if (rX[0]==1'b1) begin
			if((columns>=(145))&&(columns<=(245)))begin
				if((rows>=(45))&&(rows<=(145)))begin
					address_X<=rows-45;
					if(data_X[99+(145-columns)]==1'b1)begin
						red<=4'b1111;
						green<=4'b1111;
						blue<=4'b1111;
					end
					else if(data_X[99+(145-columns)]==0) begin
						red<=4'b0000;
						green<=4'b0000;
						blue<=4'b0000;  
					end
				end
			end
		end
		
		
		if (rX[1]==1'b1) begin
			if((columns>=(145+205))&&(columns<=(245+205)))begin
				if((rows>=(45))&&(rows<=(145)))begin
					address_X<=rows-(45);
					if(data_X[99+(145+205-columns)]==1'b1)begin
						red<=4'b1111;
						green<=4'b1111;
						blue<=4'b1111;
					end
					else if(data_X[99+(145+205-columns)]==0) begin
						red<=4'b0000;
						green<=4'b0000;
						blue<=4'b0000;  
					end
				end
			end
		end
		
	   	if (rX[2]==1'b1) begin
			if((columns>=(145+2*205))&&(columns<=(245+2*205)))begin
				if((rows>=(45))&&(rows<=(145)))begin
					address_X<=rows-(45);
					if(data_X[99+(145+2*205-columns)]==1'b1)begin
					   red<=4'b1111;
					   green<=4'b1111;
					   blue<=4'b1111;
					end
					else if(data_X[99+(145+2*205-columns)]==0) begin
					   red<=4'b0000;
					   green<=4'b0000;
					   blue<=4'b0000;  
					end
				end
			end
		end

  
		if (rX[3]==1'b1) begin
			if((columns>=(145))&&(columns<=(245)))begin
				if((rows>=(45+205))&&(rows<=(145+205)))begin
					address_X<=rows-45-205;
					if(data_X[99+(145-columns)]==1'b1)begin
					   red<=4'b1111;
					   green<=4'b1111;
					   blue<=4'b1111;
					end
					else if(data_X[99+(145-columns)]==0) begin
					   red<=4'b0000;
					   green<=4'b0000;
					   blue<=4'b0000;  
					end
				end
			end
		end
		
		
		if (rX[4]==1'b1) begin
			if((columns>=(145+205))&&(columns<=(245+205)))begin
				if((rows>=(45+205))&&(rows<=(145+205)))begin
					address_X<=rows-(45+205);
					if(data_X[99+(145+205-columns)]==1'b1)begin
						red<=4'b1111;
						green<=4'b1111;
						blue<=4'b1111;
					end
					else if(data_X[99+(145+205-columns)]==0) begin
						red<=4'b0000;
						green<=4'b0000;
						blue<=4'b0000;  
					end
				end
			end
		end
		
		
		if (rX[5]==1'b1) begin
			if((columns>=(145+2*205))&&(columns<=(245+2*205)))begin
				if((rows>=(45+205))&&(rows<=(145+205)))begin
					address_X<=rows-(45+205);
					if(data_X[99+(145+2*205-columns)]==1'b1)begin
						red<=4'b1111;
						green<=4'b1111;
						blue<=4'b1111;
					end
					else if(data_X[99+(145+2*205-columns)]==0) begin
						red<=4'b0000;
						green<=4'b0000;
						blue<=4'b0000;  
					end
				end
			end
		end

   
		if (rX[6]==1'b1) begin
			if((columns>=(145))&&(columns<=(245)))begin
				if((rows>=(45+2*205))&&(rows<=(145+2*205)))begin
					address_X<=rows-45-2*205;
					if(data_X[99+(145-columns)]==1'b1)begin
					   red<=4'b1111;
					   green<=4'b1111;
					   blue<=4'b1111;
					end
					else if(data_X[99+(145-columns)]==0) begin
						red<=4'b0000;
						green<=4'b0000;
						blue<=4'b0000;  
					end
				end
			end
		end
		
		
		if (rX[7]==1'b1) begin
			if((columns>=(145+205))&&(columns<=(245+205)))begin
				if((rows>=(45+205*2))&&(rows<=(145+205*2)))begin
					address_X<=rows-(45+205*2);
					if(data_X[99+(145+205-columns)]==1'b1)begin
					   red<=4'b1111;
					   green<=4'b1111;
					   blue<=4'b1111;
					end
					else if(data_X[99+(145+205-columns)]==0) begin
						red<=4'b0000;
						green<=4'b0000;
						blue<=4'b0000;  
					end
			  end
			end
		end
		
		
	   	if (rX[8]==1'b1) begin
			if((columns>=(145+2*205))&&(columns<=(245+2*205)))begin
				if((rows>=(45+205*2))&&(rows<=(145+205*2)))begin
					address_X<=rows-(45+205*2);
					if(data_X[99+(145+2*205-columns)]==1'b1)begin
					   red<=4'b1111;
					   green<=4'b1111;
					   blue<=4'b1111;
					end
					else if(data_X[99+(145+2*205-columns)]==0) begin
						red<=4'b0000;
						green<=4'b0000;
						blue<=4'b0000;  
					end
				end
			end
		end
	
	

		if (rO[0]==1'b1) begin
			if((columns>=(145))&&(columns<=(245)))begin
				if((rows>=(45))&&(rows<=(145)))begin
					address_O<=rows-45;
					if(data_O[99+(145-columns)]==1'b1)begin
						red<=4'b1111;
						green<=4'b1111;
						blue<=4'b1111;
					end
					else if(data_O[99+(145-columns)]==0) begin
					red<=4'b0000;
					green<=4'b0000;
					blue<=4'b0000;  
					end
				end
			end
		end
		
		
		if (rO[1]==1'b1) begin
			if((columns>=(145+205))&&(columns<=(245+205)))begin
				if((rows>=(45))&&(rows<=(145)))begin
					address_O<=rows-(45);
					if(data_O[99+(145+205-columns)]==1'b1)begin
					   red<=4'b1111;
					   green<=4'b1111;
					   blue<=4'b1111;
					end
					else if(data_O[99+(145+205-columns)]==0) begin
						red<=4'b0000;
						green<=4'b0000;
						blue<=4'b0000;  
					end
				end
			end
		end
		
		
	   	if (rO[2]==1'b1) begin
			if((columns>=(145+2*205))&&(columns<=(245+2*205)))begin
				if((rows>=(45))&&(rows<=(145)))begin
					address_O<=rows-(45);
					if(data_O[99+(145+2*205-columns)]==1'b1)begin
					   red<=4'b1111;
					   green<=4'b1111;
					   blue<=4'b1111;
					end
					else if(data_O[99+(145+2*205-columns)]==0) begin
						red<=4'b0000;
						green<=4'b0000;
						blue<=4'b0000;  
					end
				end
			end
		end

  
		if (rO[3]==1'b1) begin
			if((columns>=(145))&&(columns<=(245)))begin
				if((rows>=(45+205))&&(rows<=(145+205)))begin
					address_O<=rows-45-205;
					if(data_O[99+(145-columns)]==1'b1)begin
					   red<=4'b1111;
					   green<=4'b1111;
					   blue<=4'b1111;
					end
					else if(data_O[99+(145-columns)]==0) begin
						red<=4'b0000;
						green<=4'b0000;
						blue<=4'b0000;  
					end
				end
			end
		end
	
	
		if (rO[4]==1'b1) begin
			if((columns>=(145+205))&&(columns<=(245+205)))begin
				if((rows>=(45+205))&&(rows<=(145+205)))begin
					address_O<=rows-(45+205);
					if(data_O[99+(145+205-columns)]==1'b1)begin
					   red<=4'b1111;
					   green<=4'b1111;
					   blue<=4'b1111;
					end
					else if(data_O[99+(145+205-columns)]==0) begin
						red<=4'b0000;
						green<=4'b0000;
						blue<=4'b0000;  
					end
				end
			end
		end
		
		
	   	if (rO[5]==1'b1) begin
			if((columns>=(145+2*205))&&(columns<=(245+2*205)))begin
				if((rows>=(45+205))&&(rows<=(145+205)))begin
					address_O<=rows-(45+205);
					if(data_O[99+(145+2*205-columns)]==1'b1)begin
					   red<=4'b1111;
					   green<=4'b1111;
					   blue<=4'b1111;
					end
					else if(data_O[99+(145+2*205-columns)]==0) begin
						red<=4'b0000;
						green<=4'b0000;
						blue<=4'b0000;  
					end
				end
			end
		end

   
		if (rO[6]==1'b1) begin
			if((columns>=(145))&&(columns<=(245)))begin
				if((rows>=(45+2*205))&&(rows<=(145+2*205)))begin
					address_O<=rows-45-2*205;
					if(data_O[99+(145-columns)]==1'b1)begin
						red<=4'b1111;
						green<=4'b1111;
						blue<=4'b1111;
					end
					else if(data_O[99+(145-columns)]==0) begin
						red<=4'b0000;
						green<=4'b0000;
						blue<=4'b0000;  
					end
				end
			end
		end
	
	
		if (rO[7]==1'b1) begin
			if((columns>=(145+205))&&(columns<=(245+205)))begin
				if((rows>=(45+205*2))&&(rows<=(145+205*2)))begin
					address_O<=rows-(45+205*2);
					if(data_O[99+(145+205-columns)]==1'b1)begin
					   red<=4'b1111;
					   green<=4'b1111;
					   blue<=4'b1111;
					end
					else if(data_O[99+(145+205-columns)]==0) begin
						red<=4'b0000;
						green<=4'b0000;
						blue<=4'b0000;  
					end
				end
			end
		end
	
	
	   	if (rO[8]==1'b1) begin
			if((columns>=(145+2*205))&&(columns<=(245+2*205)))begin
				if((rows>=(45+205*2))&&(rows<=(145+205*2)))begin
					address_O<=rows-(45+205*2);
					if(data_O[99+(145+2*205-columns)]==1'b1)begin
					   red<=4'b1111;
					   green<=4'b1111;
					   blue<=4'b1111;
					end
					else if(data_O[99+(145+2*205-columns)]==0) begin
						red<=4'b0000;
						green<=4'b0000;
						blue<=4'b0000;  
					end
				end
			end
		end
    
		//hsync output	
		if(columns >= 855 && columns < 975) 
			hsync <= 0;
		else
			hsync <= 1;
		
		//vsync output
		if(rows >= 636 && rows < 642) 
			vsync <= 0;
		else
			vsync <= 1;
		
		//column add 1
		columns <= columns + 1;
	
		if(rows==665)begin //next frame
			rows <= 0;
		end
		
		//condition in order to change line	
		if(columns == 1039) begin
			columns <= 0 ;
			rows <= rows + 1;
		end

	end
end

//design winA,winB,tie 
logic cond1 = (rX[0] == 1'b1 && rX[1] == 1'b1 && rX[2] == 1'b1);
logic cond2 = (rX[3] == 1'b1 && rX[4] == 1'b1 && rX[5] == 1'b1);
logic cond3 = (rX[6] == 1'b1 && rX[7] == 1'b1 && rX[8] == 1'b1);
logic cond4 = (rX[0] == 1'b1 && rX[3] == 1'b1 && rX[6] == 1'b1);
logic cond5 = (rX[1] == 1'b1 && rX[4] == 1'b1 && rX[7] == 1'b1);
logic cond6 = (rX[2] == 1'b1 && rX[5] == 1'b1 && rX[8] == 1'b1);
logic cond7 = (rX[0] == 1'b1 && rX[4] == 1'b1 && rX[8] == 1'b1);
logic cond8 = (rX[2] == 1'b1 && rX[4] == 1'b1 && rX[6] == 1'b1);
logic con1 = (rO[0] == 1'b1 && rO[1] == 1'b1 && rO[2] == 1'b1);
logic con2 = (rO[3] == 1'b1 && rO[4] == 1'b1 && rO[5] == 1'b1);
logic con3 = (rO[6] == 1'b1 && rO[7] == 1'b1 && rO[8] == 1'b1);
logic con4 = (rO[0] == 1'b1 && rO[3] == 1'b1 && rO[6] == 1'b1);
logic con5 = (rO[1] == 1'b1 && rO[4] == 1'b1 && rO[7] == 1'b1);
logic con6 = (rO[2] == 1'b1 && rO[5] == 1'b1 && rO[8] == 1'b1);
logic con7 = (rO[0] == 1'b1 && rO[4] == 1'b1 && rO[8] == 1'b1);
logic con8 = (rO[2] == 1'b1 && rO[4] == 1'b1 && rO[6] == 1'b1);
logic cona = (cond1 == 1'b1 || cond2 == 1'b1 || cond3 == 1'b1 || cond4 == 1'b1 || cond5 == 1'b1 || cond6 == 1'b1 || cond7 ==1'b1 ||cond8 ==1'b1);
logic conb = (con1 == 1'b1 || con2 == 1'b1 || con3 == 1'b1 || con4 == 1'b1 || con5 == 1'b1 || con6 == 1'b1 || con7 ==1'b1 ||con8 ==1'b1);	
	
always_comb begin
	if(rst ==1)begin
		winA =0;
		winB = 0;
		tie =0;
	end 
	else begin
		if(cona == 1'b1)
			winA = 1'b1;
		else if ( conb == 1'b1)
			winB = 1'b1;
		else if ((rX | rO) == 9'b111111111 && conb == 0 && cona == 0)	
			tie = 1'b1;
		else	
			tie = 1'b0;
	end
end

endmodule
