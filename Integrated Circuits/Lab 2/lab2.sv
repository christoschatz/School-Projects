module PanelDisplay (
	input logic clk,
	input logic rst,
	output logic hsync,
	output logic vsync,
	output logic [3:0] red,
	output logic [3:0] green,
	output logic [3:0] blue);
  
        logic pxlClk;
	
	always_ff @(posedge clk) begin
	if (rst)
		pxlClk <= 1'b1;
	else
		pxlClk <= ~pxlClk;
	end
	
	logic [10:0] columns;
	logic [9:0] rows;
	
	always_ff @(posedge clk) begin
	if (rst) begin
		hsync <= 1;
		vsync <= 1;
		columns <= 0;
		rows <= 0;
		green <= 4'b0000;
		blue <= 4'b0000;
		red <= 4'b0000;
	end 
	
	else if (pxlClk) begin
	
		//design green block
		if(columns >= 100 && columns < 300 && rows>=50 && rows < 250) begin
			green <= 4'b1111;
			blue <= 4'b0000;
			red <= 4'b0000;
		end 
		
		//design blue block
		else if(columns >= 500 && columns < 700 && rows>=50 && rows < 250) begin
			green <= 4'b0000;
			blue <= 4'b1111;
			red <= 4'b0000;
		end
		
		//design red block
		else if(columns >= 100 && columns < 300 && rows>=300 && rows < 500) begin
			green <= 4'b0000;
			blue <= 4'b0000;
			red <= 4'b1111;
		end
		
		//design white block
		else if(columns >= 500 && columns < 700 && rows>=300 && rows < 500) begin
			green <= 4'b1111;
			blue <= 4'b1111;
			red <= 4'b1111;
		end
		else begin //in every other case make the pixels black
			green <= 4'b0000;
			blue <= 4'b0000;
			red <= 4'b0000;
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
	
endmodule
