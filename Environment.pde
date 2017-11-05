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
    
    
    spores.add(new Spore(new Dna(), int(random(0, width)), int(height/4))); 
      
    
    println("SIZEE: " + spores.size()); 
  }
  
  void spore_scan(Environment environment){
    println("WHY NOT?"); 
         println("SPORE SIZE" + spores.size() ); 
    for (int i = 0; i <= spores.size()-1; i++){   
      println("WHY YEAH!");

     
     spores.get(i).update(environment);     
     spores.get(i).display(environment); 
                
     if (spores.get(i).is_on_ground()) {
       mycelia.add(spores.get(i).germinate()); 
       // spores.remove(i); 
     }    
     
    }    
  }
  
  void mycelium_scan(Environment environment) {
    for (int i = 0; i <= mycelia.size()-1; i++) {
      if (mycelia.get(i).is_ready()) {
        Fruit fruit = mycelia.get(i).fruit(); 
        this.fruits.add(fruit); 
      };       
       mycelia.get(i).add_cell(this); 
       
    }
    
    
  }   
  
  
  
  void fruit_scan() {    
    for (int i = 0; i < fruits.size(); i++) {
      if (fruits.get(i).is_ready()) {
        
       Spore[] childern = fruits.get(i).spore();       
       for (int j = 0; j < childern.length ; j++) {
         this.spores.add(childern[i]); 
       }        
      }
      
      fruits.get(i).display(this);       
      
    }
    
  }
  
  // Run the world 
  void run() {    
  
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