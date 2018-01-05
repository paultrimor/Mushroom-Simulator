import processing.core.*; 

public class Mycelium {
	PApplet processing;
	
	Dna dna; 
	Dna partner_dna; 
	
	Cell[] cells = new Cell[6000]; 
	int num_cells; 
	
	int init_x_position, init_y_position; 
	
	// States
	float health; 
	float death_rate; 
	boolean is_dying; 
	boolean is_dead; 
	
	Mycelium(PApplet p, Dna dna, int x, int y) {
		this.processing = p; 
		
		this.dna = dna; 
		
		this.init_x_position = x; 
		this.init_y_position = y; 
		
		this.health 	= 1.0f; 
		this.death_rate = 0.0f; 
		this.is_dying	= false; 
		this.is_dead	= false; 
		
		initialize_cells(); 
		
		// Set the initial position 
		cells[0] = new Cell(0, 0); 
		num_cells++; 
	}
	
	public void initialize_cells() {
		for (int i = 0; i < cells.length; i++) {
			cells[i] = null; 
		}	
		num_cells = 0; 
	}
	
	// Num_cell temporary variables 
	int start = 0, stop; 
	public void update(Environment environment) {
		/** "Simulation of Root Forms Using Cellular Automata Model" by Nanang Winarno 
		 * 	source: http://aip.scitation.org/doi/pdf/10.1063/1.4941186
		*/	
	}
	
	
	public void display_to_grid(Environment environment) {
		for (int c = 0; c < num_cells; c++) {
			if (cells[c] != null) { 
				
				// Convert Mycelium cell position to ground_grid coordinates. 
				int i = (this.init_x_position/environment.w) + cells[c].x_offset; 
				int j = (this.init_y_position/environment.w) + cells[c].y_offset; 
				environment.set_grid(j, 1, 100);
			}
		}
	}
}

