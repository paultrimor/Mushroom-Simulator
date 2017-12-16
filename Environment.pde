class Environment {
  
  int screen_width; 
  int screen_height; 
  
  int ground_level; 
  
  ArrayList<Mycelium> mycelia; 
  ArrayList<Spore> spores; 
  ArrayList<Fruit> fruits; 
  
  
  int[][] ground_grid;  
  int w;
  
   int ground_grid_rows, ground_grid_columns; 
  
  
  Environment(int screen_width, int screen_height) {
    this.screen_width = screen_width; 
    this.screen_height = screen_height; 
    
    // Mushroom Simulation
    this.ground_level = screen_height / 2;  
    
    // Connection between Screen and ground_grid 
    w = 4; 
    this.ground_grid_rows = screen_width/w; 
    this.ground_grid_columns = ground_level/w ;
    
    ground_grid = new int[this.ground_level][this.ground_grid_rows]; 
    
    initialize_grid();     
  }
  
  void initialize_grid() {
    for (int j = 0; j < this.ground_level; j++) {
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
    
    
  }
  
  void spore_scan(Environment environment){
    for (int i = 0; i <= spores.size()-1; i++){   
     
     spores.get(i).update(environment);     
     spores.get(i).display(environment); 
                
     if (spores.get(i).is_on_ground()) {     
       
       // Limit mycellium birth rate
       if (random(0, 1) > 0.99) {
         Mycelium m = spores.get(i).germinate(); 
         m.set_initial_position(environment, int(spores.get(i).get_x_pos()), int(spores.get(i).get_y_pos()));
         mycelia.add(m);
          
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
    //  if (fruits.get(i).is_dead()) {
    //    fruits.remove(i); 
   //   }
     
    }
    
  }
  
  // Run the world 
  void run() {    
  
  }  
  
  void add_mycelium() {
    int random_width; 
    random_width = int(random(0, width)); 
   
    // Add Expirimental Players
    mycelia.add( new Mycelium(new Dna(), random_width, ground_level));
    //mycelia.add(new Mycelium(new Dna(), 600, 250));  
    
     mycelia.get(0).set_initial_position(this, random_width, ground_level);
    //mycelia.get(1).set_initial_position(this, 550, 250);
  }
 
   void add_fruit(Fruit fruit) {
    this.fruits.add(fruit);
  }
  
  void add_spore(Spore spore) {
    this.spores.add(spore); 
  }
   
  void display_ground() {
   for( int j = 1; j < ground_grid_columns-1; j++) {
      for (int i = 1; i < ground_grid_rows-1; i++) {           
        
        //set(i, j + ground_level, ground_grid[j][i]); 
        noStroke(); 
        fill(this.ground_grid[j][i]);           
       rect(i*w, ground_level + j *w,w, w); 
      }
    }
    
    
  }  
  
  
}