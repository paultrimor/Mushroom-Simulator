import processing.core.*; 

public class Spore {
	PApplet processing; 
	
	Dna dna; 
	
	float x_pos, y_pos; 
	float tx, ty; //Animation variables  
	
	// State variables 
	float health, death_rate; 
	boolean on_ground, is_dead; 

	Spore(PApplet p, Dna dna, int x, int y) {
		this.processing = p; 
		
		this.dna = dna; 
		
		this.x_pos = x; 
		this.y_pos = y; 
		
		this.tx = 100 * processing.random(0,1); 
		this.ty = 300 * processing.random(0,1); 
		
		this.health  = 100f; 
		this.death_rate = 0.1f; 
		
		this.on_ground = false; 
		this.is_dead = false; 	
		
		// Spore animation variables 	

	}
	
	float tick = 0.1f; 
	public void update(Environment environment) {
		
		if (y_pos > environment.get_ground_level() ) {
			System.out.println("Spore has hit the ground! ");
			this.on_ground 	= true; 
			this.is_dead 	= true; 
		} else {
			if (x_pos < 0 )
				x_pos = environment.width; 
			if (x_pos > environment.width)
				x_pos = 0; 
			
			x_pos += PApplet.map(processing.noise(tx), 0f, 1f, -3f, 3f);
			
			y_pos += PApplet.map(processing.noise(ty), 0f, 1f, -1f, 2.5f); 
		}
		
		tx += tick; 
		ty += tick; 
		
	}
	
	public void display(Environment environment) {
		processing.ellipse(x_pos, y_pos, 5, 5);
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
