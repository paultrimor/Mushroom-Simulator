import processing.core.*; 

public class Mushroom_Simulator extends PApplet{
	
	Environment environment; 	
	
	public static void main(String[] args) {
		PApplet.main("Mushroom_Simulator");
		// PApplet.main("Gene_table");
		
	}
	
	public void settings() {
		size(1000, 1000);
	}
	
	public void setup() {
		
		 environment = new Environment(this, 1000, 1000, false);
		 environment.initialize_ground_grid();
		 environment.initialize_players(); 
		
	}
	
	public void draw() {
		noStroke(); 
		background(0); 
		environment.display_ground();
		environment.spore_scan(); 
		// environment.fruit_scan(); 
		// environment.mycelium_scan(); 
				
	}
	
}
