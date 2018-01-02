import processing.core.*; 

public class Cell {
	
	int x; // in pixels 
	int y; 
	
	int previous_state; 
	int next_state; 
	
	Cell(int x, int y) {
		this.x = x;
		this.y = y; 
	}
	
	public int get_x() { return this.x; }
	
	public int get_y() { return this.y; }
		
	
	
}
