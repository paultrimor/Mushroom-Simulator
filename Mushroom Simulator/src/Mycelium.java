import processing.core.*; 

public class Mycelium {
	PApplet processing;
	
	Dna dna; 
	Dna partner_dna; 
	
	Cell[] cells = new Cell[2000]; 
	int num_cells; 
	
	int init_x, init_y; 
	
	// States
	float health; 
	float death_rate; 
	boolean is_dying; 
	boolean is_dead; 
	
	Mycelium(PApplet p, Dna dna, int x, int y) {
		this.processing = p; 
		
		this.dna = dna; 
		
		this.init_x = x; 
		this.init_y = y; 
		
		this.health 	= 1.0f; 
		this.death_rate = 0.0f; 
		this.is_dying	= false; 
		this.is_dead	= false; 
		
		initialize_cells(); 
	}
	
	public void initialize_cells() {
		for (int i = 0; i < cells.length; i++) {
			cells[i] = null; 
		}	
		num_cells = 0; 
	}
	
	public void set_initial_position(Environment environment, int x, int y) {		
		cells[0] = new Cell(x, y); 	
		environment.set_grid(x, y, 1);
		num_cells++; 
		
	}
	
	public void update(Environment environment) {
		
		int current; 
		int top, top_left, top_right; 
		
		for (int j = 1; j < environment.get_grid_columns() -1; j++) {
			for (int i = 1; i < environment.get_grid_rows() -1; i++) {
			
			/**
				current = environment.get_grid(i, j);
				
				top 	  = environment.get_grid(i, j-i); 
				top_left  = environment.get_grid(i-1, j-i); 
				top_right = environment.get_grid(i+1, j-1);
			**/
				
				
			}
		}
	}

	public void display_to_grid(Environment environment) {
		for (int i = 0; i < cells.length; i++) {
			if (cells[i] != null) { 
				environment.set_grid(cells[i].x, cells[i].y, 100);
			}
		}
	}
}

