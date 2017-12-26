import processing.core.*; 

public class Dna {
	
	float fruit_height; 
	float fruit_width; 
	
	float spore_weight; 
	float spore_friction;
	
	
	Dna() {
		this.fruit_height 	= (float)(Math.random()); 
		this.fruit_width 	= (float)(Math.random()); 
		
		this.spore_weight 	= (float)(Math.random()); 
		this.spore_friction = (float)(Math.random()); 
		
	}
	
}
