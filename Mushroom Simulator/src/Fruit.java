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
	
	float start_base_radius, start_head_radius;	
	float end_base_radius, end_head_radius; 
	
	float head_radius, base_radius; 
	
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
		
		this.health = 1.0f;
		this.is_ready = false;
		this.is_dying = false; 
		this.is_dead  = false; 
		
		this.base_position = new PVector(init_x, init_y); 
		this.head_position = new PVector(init_x, init_y);		
	
		this.length = MIN_HEIGHT + this.dna.fruit_height * (MAX_HEIGHT-MIN_HEIGHT);	
		
		 start_base_radius = 1;
	     start_head_radius = 1; 
	      
	     end_base_radius = start_base_radius * 20; 
	     end_head_radius = start_head_radius * 20; 
		
		this.base_head_distance = new PVector((float)(Math.random() - 0.5 * 4), length); 	
	} 
	
	void update() {
		pct += step; 
		System.out.println("pct: " + pct);
		if (pct < 1.0) {
			head_position.x = base_position.x + (pct * base_head_distance.x); 			
			head_position.y = base_position.y - ((float)(Math.pow(pct, 0.5)) * base_head_distance.y); 
		
			head_radius = start_head_radius + (pct * (end_head_radius - start_head_radius)); 
			base_radius = start_base_radius + (pct * (end_base_radius - start_base_radius));
			
		}
		
		if (pct > 0.9 &&  pct < 0.901) {
			this.is_ready = true; 
			this.death_rate = 0.0001f; 
		}
		
		if (pct >= 0.93) {
			this.is_ready = false; 
			System.out.println("is_ready: pct = " + pct);
		}
		
		if (this.health == 0) {
			System.out.println("is_dead: pct = " + pct);
			this.is_dead = true; 
		}		
		
		this.health -= this.death_rate; 
		
	}
	
	void display(Environment environment) {
		processing.fill(120, 200, 230); 
		processing.noStroke(); 
		
		// Base ellipse 
		processing.ellipse(base_position.x, base_position.y, base_radius, base_radius);
		
		// Head ellipse
		processing.ellipse(head_position.x, head_position.y, head_radius, head_radius);
		
		// Stem
		processing.beginShape();
		processing.vertex(base_position.x + base_radius/2, base_position.y); 
	    processing.vertex(head_position.x + head_radius/2, head_position.y); 
	    processing.vertex(head_position.x - head_radius/2, head_position.y); 
	    processing.vertex(base_position.x - head_radius/2, base_position.y); 
	    processing.endShape(); 
	      
	    // Cap
	    processing.arc(head_position.x, head_position.y, 100*pct, 100*pct, processing.radians(180), processing.radians(360));
	}
	
	public Spore spore() {
		float x_pos = processing.map((float)Math.random(), 0.0f, 1.0f, head_position.x - head_radius, head_position.x + head_radius); 
		return new Spore(processing, this.dna, (int)(x_pos), (int)(head_position.y)); 
	}
	
	/** Fruit Getters **/ 
	
	boolean is_ready() { return is_ready; }
	
	boolean is_dying() { return is_dying; }
	
	boolean is_dead() { return is_dead; }
	
}
