import processing.core.*; 
import java.util.ArrayList;

/**
 * Class - Environment 
 *		This class mainly handles the communication between the ground_grid 2D array 
 *		and the Mycelium Cell[][] property, and the manages the process of birth and death
 *		The Enivornment = GOD >~~~~~(0_0)~~~~~<   
 *		
 */
public class Environment {
	PApplet processing; 
	
	boolean continuous_mode = false; // 1 - traditional, 0 - continuous 
	
	// Dimensions in pixels 
	int width, height; 	
	int ground_level; 
	
	ArrayList<Mycelium> mycelia; 
	ArrayList<Spore> spores;
	ArrayList<Fruit> fruits; 
	
	int[][] ground_grid; 
	int w = 4; // down sizes environment dimensions, must be even number! 
	
	int ground_grid_rows, ground_grid_columns;
	
	Environment(PApplet p, int screen_width, int screen_height, boolean mode) {
		this.processing = p; 

		this.continuous_mode = mode; 
		this.width 	= screen_width; 
		this.height = screen_height; 
		
		this.ground_level = this.height / 2; 
		
		this.ground_grid_rows 	 = this.width / w; 
		this.ground_grid_columns = this.ground_level / w; 
		
		this.ground_grid = new int[ground_grid_columns][ground_grid_rows]; 
		
		initialize_ground_grid(); 
		
	}
	
	public void display_ground() {
		for (int j = 1; j < this.ground_grid_columns-1; j++) {
			for (int i = 1; i < this.ground_grid_rows-1; i++) {
				
				processing.rect(i*w, j*w + this.ground_level, w, w);
			}
		}
	}
	
	public void initialize_players() {
		spores = new ArrayList<Spore>(); 
		mycelia = new ArrayList<Mycelium>();
		fruits = new ArrayList<Fruit>(); 		
		
		spores.add(new Spore(processing, new Dna(),(int) (processing.random(0, this.width)), this.ground_level/4)); 			
		spores.add(new Spore(processing, new Dna(),(int) (processing.random(0, this.width)), this.ground_level/4)); 			
	
	}
	
	public void initialize_ground_grid() {
		for (int j = 0; j < this.ground_grid_columns; j++) {
			for (int i = 0; i < this.ground_grid_rows; i++) {
				this.ground_grid[j][i] = 0; 
			}
		}
	}
	
	/** Scan and examine main Players **/ 
	public void spore_scan() {
		for (int i = 0; i  <= spores.size()-1; i++) {
			Spore spore = spores.get(i); 
			spore.update(this);
			spore.display(this);
		}
	}
	
	public void mycelium_scan() {
		for (int i = 0; i < mycelia.size()-1; i++) {
			
		}
	}
	
	public void fruit_scan() {
		for (int i = 0; i < fruits.size()-1; i++) {
			
		}
	}
	
	
	/** Environment Getters and Setters **/ 

	public int get_ground_level() { return this.ground_level; }
	  
	public int[][] get_ground_grid() { return ground_grid; }
	  
	public int get_grid(int x, int y) { return this.ground_grid[y][x]; }
	  
	public int get_grid_rows() { return this.ground_grid_rows; }
	  
	public int get_grid_columns() { return this.ground_grid_columns; }
	
	public void set_grid(int x, int y, int value){
	    this.ground_grid[y/w][x/w] = value; 
	}
	
	
}
