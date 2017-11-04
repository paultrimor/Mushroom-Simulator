class Environment {
  
  int screen_width; 
  int screen_height; 
  
  int ground_level; 
  
  public byte[][] ground_grid;  
  
  
  Environment(int screen_width, int screen_height) {
    this.screen_width = screen_width; 
    this.screen_height = screen_height; 
    this.ground_level = screen_height / 2; 
    
    ground_grid = new byte[width][ground_level]; 
    
  }
  
  public byte[][] get_ground_grid() {
    return ground_grid; 
  }
  
  
  
  
}