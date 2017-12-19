import processing.core.*; 

public class Mycelium {
	PApplet processing;
	
	Dna dna; 
	Dna partner_dna; 
	
	Cell[] cells = new Cell[4000];
	
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
	}
	
	public void set_initial_position(Environment environment, int x, int y) {		
		this.init_x = x; 
		this.init_y = y;		
	}
}
