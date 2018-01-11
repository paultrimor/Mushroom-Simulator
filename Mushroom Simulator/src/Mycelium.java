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
	
	int prev_num_cells = 0; 
	public void update(Environment environment) {
		/** "Simulation of Root Forms Using Cellular Automata Model" by Nanang Winarno 
		 * 	source: http://aip.scitation.org/doi/pdf/10.1063/1.4941186
		*/
		
		// Temporary variable for storing previous num_cells 
		int temp_prev_num_cells = prev_num_cells; 
		int temp_num_cells = num_cells; 
		
		System.out.println("update(): t_prev_num: " + temp_prev_num_cells + " t_num_cells: " + temp_num_cells);
		for (int i = temp_prev_num_cells; i < temp_num_cells; i++) {
			System.out.println("\titeration : " + i);
			// Testing update. 			
			int current = environment.get_grid(
					this.init_x_position/environment.w + cells[i].x_offset, 
					this.init_y_position/environment.w + cells[i].y_offset
			); 
			
			int left_2_cell = environment.get_grid(
					this.init_x_position/environment.w + cells[i].x_offset - 2, 
					this.init_y_position/environment.w + cells[i].y_offset
			); 
			
			int right_2_cell = environment.get_grid(
					this.init_x_position/environment.w + cells[i].x_offset + 2, 
					this.init_y_position/environment.w + cells[i].y_offset
			);
			
			int bottom_left = environment.get_grid(
					this.init_x_position/environment.w + cells[i].x_offset + 1, 
					this.init_y_position/environment.w + cells[i].y_offset + 1
			);
			
			int bottom_right = environment.get_grid(
					this.init_x_position/environment.w - 1, 
					this.init_y_position/environment.w + 1
			);
			
			
			
			if (left_2_cell != 0) {
				if (Math.random() < 0.6) {
					add_cell(cells[i].x_offset - 1, cells[i].y_offset + 1); 
				}				
			} else {
				if (Math.random() < 0.4) {
					add_cell(cells[i].x_offset + 1, cells[i].y_offset + 1);
				}
			}
			
			if (right_2_cell != 0) {
				if (Math.random() < 0.6) {
					add_cell(cells[i].x_offset + 1, cells[i].y_offset + 1); 
				}
			} else {
				if (Math.random() < 0.4) {
					add_cell(cells[i].x_offset - 1, cells[i].y_offset + 1);
				}
			}
						
		} // end for loop 
		if (temp_num_cells != num_cells) {
			prev_num_cells = temp_num_cells; 
		}
	}
	
	public void add_cell(int x, int y) {
		cells[num_cells] = new Cell(x, y); 
		num_cells++; 
		System.out.println("\tcell was just added @: ("+x+","+y+")");
	}
		
	public void display_to_grid(Environment environment) {
		for (int c = 0; c < num_cells; c++) {
			if (cells[c] != null) { 
				
				// Convert Mycelium cell position to ground_grid coordinates. 
				int i = (this.init_x_position/environment.w) + cells[c].x_offset; 
				int j = (this.init_y_position/environment.w) + cells[c].y_offset; 

				environment.set_grid(i, j, 101);
				
				
			}
		}
	}
}

