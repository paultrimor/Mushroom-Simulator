

class Mycelium {
  Cell[] cells = new Cell[4000]; 
  int num_cells = 0; 
  Dna dna;  
  Dna partner_dna; 
  float health; 
  
  int x_init; 
  int y_init;   
  
  int mycelium_color;
  float color_variance; 
  
  // States
  float death_rate; 
  boolean is_dying; 
  boolean is_dead; 
  
  Mycelium(Dna new_dna, int x, int y) {
    dna = new_dna;
    x_init = x; 
    y_init = y; 
    
    mycelium_color = this.dna.get_mycelium_color(); 
    color_variance = random(0,1); 
    
    // Initalize cell
    for (int i = 0; i < cells.length; i++) {
      cells[i] = null; 
    }    
    health = 100;     
  }
  
  void set_initial_position(Environment environment, int x, int y){
    
    this.x_init = x;
    this.y_init = y;    
    
    cells[0] = new Cell(x/4, y/4); 
    environment.set_grid(x, y, 1); 
    num_cells++;
  }
  
  // Add Cells 
  void update_grid(Environment environment) {
   
   int current_cell_value;    
   
  int neighbors;
   for (int j = 2; j < environment.get_grid_columns() -2; j++) {
      for (int i = 2; i < environment.get_grid_rows() -2; i++) {
         current_cell_value = environment.get_grid(i, j);   
         
        
        neighbors = 0; 
        
          // Get neighboring cells 
          for (int x = -1; x <= 1; x++) {
            for (int y = -1; y <= 1; y++) {             
              //Add up all the neighbors’ states. 
             neighbors += environment.get_grid(i+x,j+y); 
           }
          }
          
            if (num_cells < cells.length){      
              
              if (current_cell_value == 0 && neighbors >=1 && random(0,1) > 0.98) {                
                // Down preferance
                cells[num_cells] = new Cell(i*4, (j)*4); 
                environment.set_grid(i*4, (j)*4, 0); 
                num_cells++; 
                
                }       

          }           
                    
          if (num_cells > 1500) {
            is_dying = true; 
          }
          
          if (this.is_dead()) {
            
          }
          
      }
    }    
  }
  
  // Display to ground_grid - Update ground_grid which will be displaed
  void display_to_grid(Environment environment) {
   for (int i = 0; i < cells.length; i++) {
     if (cells[i] != null){       
        // Cover the color of the cell to an integer                
         environment.set_grid(cells[i].x, cells[i].y, 1);
     }
   }
   
  }
  
  boolean is_ready() {
     // Trigger true when Mycellium is ready to fruit 
     death_rate = 0.01;
     return is_dying;      
  }
  
  boolean is_dead(){
    return (health < 0.001); 
  }
  
  Dna get_partner() {  
     return new Dna(); 
  }
  
  int get_x_init() {
    return this.x_init; 
  }
  
  int get_y_init() {
    return this.y_init; 
  }
  // Get the cell coordinates of partner and mycelium       
  Cell compute_center() {
    int rand_x = int(random(0, environment.get_grid_rows())); 
    int rand_y = int(random(0, environment.get_grid_columns())); 
    
    Cell c = new Cell(rand_x, rand_y); 
    
    return c; 
  }
  
  Dna compute_child_dna() {
    
    float child_fruit_height = this.dna.fruit_height;
    float child_fruit_width = this.dna.fruit_width;
    float child_spore_weight = this.dna.spore_weight;
    float child_spore_friction = this.dna.spore_friction;
    float child_mycelium_rules = this.dna.mycelium_rules; 
    color child_mycelium_color = this.dna.mycelium_color;      
        
    return new Dna(child_fruit_height, child_fruit_width, child_spore_weight, child_spore_friction, child_mycelium_rules, child_mycelium_color); 
  }  
  
  Fruit fruit() {
    Cell center_cell = this.compute_center(); 
    Dna new_dna = this.compute_child_dna();      
    return new Fruit(new_dna, center_cell.x * 4, 500); 
  }  
  
  
}