import processing.core.*; 

public class Mycelium {
	PApplet processing;
	
	Dna dna; 
	Dna partner_dna; 
	
	Cell[] cells = new Cell[6000]; 
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
	
	// Num_cell temporary variables 
	int start = 0, stop; 
	public void update(Environment environment) {
		/** "Simulation of Root Forms Using Cellular Automata Model" by Nanang Winarno 
		 * 	source: http://aip.scitation.org/doi/pdf/10.1063/1.4941186
		*/	
		
		Cell current; 
		int left_2_cell, right_2_cell; 
		int bottom_left, bottom_right; 
		
		int w = environment.get_w(); 
		start = num_cells - 1; 
		
		for (int i = start; i < stop; i++) {
			System.out.println("WORLD");
			current = cells[i]; 
			
			left_2_cell = environment.get_grid(
					(current.get_x()/w) - 2,
					(current.get_y()/w)
			);  
			
			right_2_cell = environment.get_grid(
					(current.get_x()/w) + 2,
					(current.get_y()/w)
			); 
			
			bottom_left = environment.get_grid(
					(current.get_x()/w) + 1, 
					(current.get_y()/w) - 1
			); 
			
			bottom_right = environment.get_grid(
					(current.get_x()/w) - 1, 
					(current.get_y()/w)	- 1
			);
			
			if (left_2_cell != 0) {
				if (Math.random() < this.dna.mycelium_center_probability/2) {
					// Set the cell for bottom_left	(Half Mycelium_center_probability)
					
				}
			} else {
				if (Math.random() < this.dna.mycelium_edge_probability) {
					// Set the cell for bottom left (Full Mycelium_edge_probability)
					cells[num_cells] = new Cell(current.x - 1, current.y + 1); 
					environment.set_grid(current.x/w, current.y/w, 1);
					num_cells++; 
				} 
			}
			
			if (right_2_cell != 0) {
				if (Math.random() < this.dna.mycelium_center_probability/2) {
					// Set the cell for bottom right (Half Mycelium_center_probability)
				}
			} else {
				System.out.println("Hello");
				if (Math.random() < this.dna.mycelium_edge_probability) {
					// Set the cell for bottom right (Full Mycelium_edge_probability)
					cells[num_cells] = new Cell(current.x + 1, current.y + 1); 
					environment.set_grid(current.x/w, current.y/w, 1);
					num_cells++; 
				}
			}			
			
		} // end Cell For loop 
		stop = num_cells; 
	}

	public void display_to_grid(Environment environment) {
		for (int i = 0; i < cells.length; i++) {
			if (cells[i] != null) { 
				environment.set_grid(cells[i].x, cells[i].y, 100);
			}
		}
	}
}

