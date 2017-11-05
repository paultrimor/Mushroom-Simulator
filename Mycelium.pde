
class Mycelium {
  Cell[] cells = new Cell[1000]; 
  int num_cells = 0; 
  Dna dna;  
  Dna partner_dna; 
  float health; 
  
  int x_init; 
  int y_init;   
    
  
  Mycelium(Dna new_dna, int x, int y) {
    dna = new_dna;
    x_init = x; 
    y_init = y; 
    
    num_cells++; 
    
    // Initalize cell
    for (int i = 0; i < cells.length; i++) {
      cells[i] = null; 
    }
    
  }
  
  void set_initial_position(Environment environment, int x, int y){
    
    this.x_init = x;
    this.y_init = y;    
    
    cells[0] = new Cell(x, y); 
    environment.set_grid(x, y, #FF0000);     
        
  }
  
  // Add Cells 
  void colonize(Environment environment) {
    int rows = environment.get_grid_rows(); 
    int columns = environment.get_grid_columns(); 
      
    // Scans pixel and adds necessary pixels
    int neighbors = 0;
    int current_pixel_value; 
    for (int j = 1; j < rows-1; j++) {
      for (int i = 1; i < columns-1; i++){     
        
        current_pixel_value = environment.get_grid(j, i); 
        
        // Calulate the number of neighbors 
        for (int x = -1; x <= 1; x++) {                
          for (int y = -1; y <= 1; y++) {
            if (environment.get_grid(j+x, i+y) != 0) {
               neighbors++; 
             }   
          }                      
        }
          
        // Rules of Life
        if (neighbors == 1 && num_cells < cells.length) {
          cells[num_cells] = new Cell(j, i); 
          num_cells++; 
          print("cell added: "); 
          println(num_cells); 
        } // Reproduction       
       }     
    }    
  }
  
  void add_cell(Environment environment){
    
    int rand_x = int(random(0, environment.get_grid_rows())); 
    int rand_y = int(random(0, environment.get_grid_columns())); 
    
    Cell c = new Cell(rand_x, rand_y); 
    
    if (num_cells < cells.length){
      cells[num_cells] = c;
      num_cells++; 
    }
        
    environment.set_grid(rand_x, rand_y, c.get_color()); 
    
  }
  
  // Display to ground_grid - Update ground_grid which will be displaed
  void display_to_grid (Environment environment) {
   for (int i = 0; i < cells.length; i++) {
       
     if (cells[i] != null){
         environment.set_grid(cells[i].x, cells[i].y, #FF0000);
     }
   }
   
  }
  
  boolean is_ready() {
     // Trigger true when Mycellium is ready to fruit 
     return false;      
  }
  
  Dna get_partner() {  
     return new Dna(); 
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
  
  Fruit Fruit() {
    Cell center_cell = this.compute_center(); 
    Dna new_dna = this.compute_child_dna();      
    return new Fruit(new_dna, center_cell.x, center_cell.y); 
  }  
  
  
}