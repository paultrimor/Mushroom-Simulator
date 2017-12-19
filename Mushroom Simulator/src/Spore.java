import processing.core.*; 

public class Spore {
	PApplet processing; 
	
	Dna dna; 
	
	float x_pos, y_pos; 
	float tx, ty; 
	
	// State variables 
	float health, death_rate; 
	boolean on_ground, is_dead; 
	
	Spore(PApplet p, Dna dna, int x, int y) {
		this.processing = p; 
		
		this.dna = dna; 
		
		this.x_pos = x; 
		this.y_pos = y; 
		
		this.health  = 100f; 
		this.death_rate = 0.1f; 
		
		this.on_ground = false; 
		this.is_dead = false; 		
	}
	
	
	public void update(Environment environment) {
		
	}
	
	public void display(Environment environment) {
		
	}
	
	public Mycelium germinate() {
		return null; 
	}
	
	/** Spore Getters **/ 
	
	public boolean is_on_ground() { return on_ground; }
	
	public boolean is_dead() { return is_dead; }
	
	float get_y_pos() { return this.y_pos; }
	
	float get_x_pos() { return this.x_pos; } 
	
}
