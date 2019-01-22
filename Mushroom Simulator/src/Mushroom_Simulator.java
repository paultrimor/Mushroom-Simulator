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
		environment.spore_scan(); 
		environment.fruit_scan(); 
		environment.mycelium_scan(); 
		environment.display_ground();
				
	}
	

	/** Utilties **/ 
	public void print_2D_array(int[][] array) {
		for (int j = 0; j < array.length; j++) {
			for (int i = 0; i < array[j].length; i++) {
				System.out.println(array[j][i]) ; 
			}
		}
	}
}
