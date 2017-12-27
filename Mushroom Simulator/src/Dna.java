import processing.core.*; 

public class Dna {
	
	float fruit_height; 
	float fruit_width; 
	
	float spore_weight; 
	float spore_friction;
	
	/**
	 * Mycelium fitness function taken from "Simulation of Root Forms Using Cellular Automata Model" by Nanang Winarno
	 * source: http://aip.scitation.org/doi/pdf/10.1063/1.4941186
	 */
	float mycelium_center_probability; 
	float mycelium_edge_probability; 
	
	
	Dna() {
		this.fruit_height 	= (float)(Math.random()); 
		this.fruit_width 	= (float)(Math.random()); 
		
		this.spore_weight 	= (float)(Math.random()); 
		this.spore_friction = (float)(Math.random()); 
		
		this.mycelium_center_probability =  (float) (Math.random());
		this.mycelium_edge_probability   =  (float) (Math.random()); 
		
	}
	
}
