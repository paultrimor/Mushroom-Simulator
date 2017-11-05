class Environment {
  
  int screen_width; 
  int screen_height; 
  
  int ground_level; 
  
  ArrayList<Mycelium> mycelia; 
  ArrayList<Spore> spores; 
  ArrayList<Fruit> fruits; 
  
  
  int[][] ground_grid;  
  
   int ground_grid_rows, ground_grid_columns; 
  
  
  Environment(int screen_width, int screen_height) {
    this.screen_width = screen_width; 
    this.screen_height = screen_height; 
    this.ground_level = screen_height / 2; 
    
    
    // Connection between Screen and ground_grid 
    this.ground_grid_rows = screen_width; 
    this.ground_grid_columns = this.ground_level;
    
    ground_grid = new int[this.ground_grid_columns][this.ground_grid_rows]; 
    
    initialize_grid();     
  }
  
  void initialize_grid() {
    for (int j = 0; j < this.ground_grid_columns; j++) {
      for (int i = 0; i < this.ground_grid_rows; i++) {
        ground_grid[j][i] = 0; 
      }
    }    
  }
  
  int get_ground_level() {
    return ground_level; 
  }
  
  int[][] get_ground_grid() {
    return ground_grid; 
  }
  
  void set_grid(int x, int y, int value){
     this.ground_grid[y][x] = value; 
  }
  
  int get_grid(int x, int y) {
    return this.ground_grid[y][x]; 
  }
  
  int get_grid_rows() {
    return this.ground_grid_rows;
  }
  
  int get_grid_columns() {
    return this.ground_grid_columns; 
  }
  
  void initialize_players() {
    spores = new ArrayList<Spore>(); 
    fruits = new ArrayList<Fruit>(); 
    mycelia = new ArrayList<Mycelium>();     
    
    // Add Expirimental Players
    
     
  }
  
  void spore_scan(Environment environment){
    for (int i = 0; i <= spores.size()-1; i++){   
     
     spores.get(i).update(environment);     
     spores.get(i).display(environment); 
                
     if (spores.get(i).is_on_ground()) {
       println("MYCELLIUM ADDED!!!!!!!!!!!!!!!!!!!!!!");
       
       // Limit mycellium birth
       if (random(0, 1) < 0.5) {
         mycelia.add(spores.get(i).germinate()); 
       }
   
     }   
     
     if (spores.get(i).is_dead()) {
       spores.remove(i); 
     }
     
    }    
  }
  
  void mycelium_scan(Environment environment) {
    
    // Scan for mycelium that can give birth to fruit
    for (int i = 0; i <= mycelia.size()-1; i++) {
      
      if (mycelia.get(i).is_ready()) {
        Fruit fruit = mycelia.get(i).fruit(); 
        this.fruits.add(fruit); 
      };      
      
       mycelia.get(i).update_grid(environment);      
       mycelia.get(i).display_to_grid(environment);
       
    }   
    
  }   
  
  
  
  void fruit_scan(Environment environment) {    
    for (int i = 0; i < fruits.size(); i++) {
     
      fruits.get(i).update(); 
      fruits.get(i).display(this);    
     
     // Checks if Fruit is dying so that it can give birth 
      if (fruits.get(i).is_ready()) {    
         // Give birth to Child
           this.spores.add( fruits.get(i).spore());    
   
      }
                
      // Checks if Fruit is ready to Die
      if (fruits.get(i).is_dead()) {
        fruits.remove(i); 
      }
     
    }
    
  }
  
  // Run the world 
  void run() {    
  
  }  
  
 
   void add_fruit(Fruit fruit) {
    this.fruits.add(fruit);
  }
  
  void add_spore(Spore spore) {
    this.spores.add(spore); 
  }
   
  void display_ground() {
    line(0, ground_level, width, ground_level); 
    
    for( int j = 1; j < ground_grid_columns-1; j++) {
      for (int i = 1; i < ground_grid_rows-1; i++) {        
        set(i, j + ground_level, ground_grid[j][i]); 
      }
    }
    
    
  }  
  
  
}