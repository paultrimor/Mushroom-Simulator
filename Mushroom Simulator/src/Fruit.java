import processing.core.*; 

public class Fruit {
	PApplet processing; 
	
	Dna dna; 
	
	int init_x, init_y; 
	
	int MAX_HEIGHT = 300; 
	int MIN_HEIGHT = 80; 
	float length; 
	
	PVector base_position; 	
	PVector head_position, head_velocity, head_acceleration; 	
	PVector base_head_distance; 
	
	float start_base_radius;
	float start_head_radius; 
	
	float end_base_radius; 
	float end_head_radius; 
	
	// State variables 
	float health, death_rate; 
	boolean is_ready, is_dying, is_dead; 
	
	// Animation variables 
	float pct 	= 0.0f; 
	float step 	= 0.001f;
	
	Fruit(PApplet p, Dna dna, int x, int y) {
		this.processing = p; 
		
		this.dna = dna; 
		
		this.init_x = x; 
		this.init_y = y; 
		
		this.is_ready = false;
		this.is_dying = false; 
		this.is_dead  = false; 
		
		this.base_position = new PVector(init_x, init_y); 
		this.head_position = new PVector(init_x, init_y);		
		
		this.length = MIN_HEIGHT + this.dna.fruit_height * (MAX_HEIGHT-MIN_HEIGHT);
		
		
		
	} 
	
	void update() {
		
	}
	
	void display(Environment environment) {
		
	}
	
	public Spore spore() {
		return null; 
	}
	
	/** Fruit Getters **/ 
	
	boolean is_ready() { return is_ready; }
	
	boolean is_dying() { return is_dying; }
	
	boolean is_dead() { return is_dead; }
	
}
