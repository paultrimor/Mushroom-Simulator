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
		System.out.println("Update() - pre_num: " + prev_num_cells + " num_cells: " + num_cells);
		/** "Simulation of Root Forms Using Cellular Automata Model" by Nanang Winarno 
		 * 	source: http://aip.scitation.org/doi/pdf/10.1063/1.4941186
		*/
		
		// Temporary variable for storing previous num_cells 
		int temp_prev_num_cells = prev_num_cells; 
		int temp_num_cells = num_cells; 
		
		for (int i = temp_prev_num_cells; i < temp_num_cells; i++) {
			// Testing update. 			
			int current = environment.get_grid(
					this.init_x_position/environment.w + cells[i].x_offset, 
					this.init_y_position/environment.w + cells[i].y_offset); 
			
			int adj_1 = environment.get_grid(
					this.init_x_position/environment.w + cells[i].x_offset - 1, 
					this.init_y_position/environment.w + cells[i].y_offset - 1); 
			
			int adj_2 = environment.get_grid(
					this.init_x_position/environment.w + cells[i].x_offset, 
					this.init_y_position/environment.w + cells[i].y_offset - 1); 
						
			int adj_3 = environment.get_grid(
					this.init_x_position/environment.w + cells[i].x_offset + 1, 
					this.init_y_position/environment.w + cells[i].y_offset - 1); 
			
			int adj_4 = environment.get_grid(
					this.init_x_position/environment.w + cells[i].x_offset - 1, 
					this.init_y_position/environment.w + cells[i].y_offset);
			
			int adj_5 = environment.get_grid(
					this.init_x_position/environment.w + cells[i].x_offset + 1, 
					this.init_y_position/environment.w + cells[i].y_offset);
			
			int adj_6 = environment.get_grid(
					this.init_x_position/environment.w + cells[i].x_offset - 1,
					this.init_y_position/environment.w + cells[i].y_offset + 1);
			
			int adj_7 = environment.get_grid(
					this.init_x_position/environment.w + cells[i].x_offset, 
					this.init_y_position/environment.w + cells[i].y_offset + 1
			); 
			int adj_8 = environment.get_grid(
					this.init_x_position/environment.w + cells[i].x_offset + 1, 
					this.init_y_position/environment.w + cells[i].y_offset + 1
			); 
			
			float probability = 0.3f;
			
			if (Math.random() < probability && adj_1 == 0)
				add_cell(cells[i].x_offset - 1, cells[i].y_offset - 1);
			if (Math.random() < probability && adj_2 == 0)
				add_cell(cells[i].x_offset - 0, cells[i].y_offset - 1);
			if (Math.random() < probability && adj_3 == 0)
				add_cell(cells[i].x_offset + 1, cells[i].y_offset - 1);
			
			if (Math.random() < probability && adj_4 == 0)
				add_cell(cells[i].x_offset - 1, cells[i].y_offset + 0);
			if (Math.random() < probability && adj_5 == 0)
				add_cell(cells[i].x_offset + 1, cells[i].y_offset + 0);
			
			if (Math.random() < probability && adj_6 == 0)
				add_cell(cells[i].x_offset - 1, cells[i].y_offset + 1);
			if (Math.random() < probability && adj_7 == 0)
				add_cell(cells[i].x_offset - 0, cells[i].y_offset + 1);
			if (Math.random() < probability && adj_8 == 0)
				add_cell(cells[i].x_offset + 1, cells[i].y_offset + 1);
			
		} // end for loop 
		if (temp_num_cells != num_cells) {
			prev_num_cells = temp_num_cells; 
		}
	}
	
	
	public void add_cell(int x, int y) {
		cells[num_cells] = new Cell(x, y); 
		num_cells++; 
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

