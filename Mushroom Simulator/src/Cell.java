import processing.core.*; 

public class Cell {
	
	int x_offset; // in pixels 
	int y_offset; 
	
	int previous_state; 
	int next_state; 
	
	Cell(int x_offset, int y_offset) {
		this.x_offset = x_offset;
		this.y_offset = y_offset; 
	}
	
	public int get_x() { return this.x_offset; }
	
	public int get_y() { return this.y_offset; }
		
	
	
}
