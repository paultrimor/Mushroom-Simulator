class Spore {
  Dna dna; 
  
  float x_pos, y_pos; 
  float tx, ty; 
  
  boolean on_ground; 
  
  Spore(Dna dna, int x, int y) {
    this.dna = dna; 
    x_pos = x;
    y_pos = y; 
    
    tx = 1000 * random(0,1); 
    ty = 1000 * random(0,1); 
    
    on_ground = true; 
  }
  
  float tick = 0.05; 
  void update(Environment enviornment) {
    
    if (y_pos > enviornment.get_ground_level()) {
      println("HITS GROUND!"); 
      y_pos = enviornment.get_ground_level();
      tick = 0.0;
      on_ground = true;       
    } else {
      x_pos += map(noise(tx), 0, 1, -3, 3); 
      y_pos += map(noise(ty), 0, 1, -1, 2.5); 
      
      tx+= tick; 
      ty+= tick; 
    
    }   
  }
  
  void display(Environment enviornment) {
    // draw spore
    ellipse(x_pos, y_pos , 5, 5); 
    
  }
  
  boolean is_on_ground(){
    return on_ground; 
  }
  
  Mycelium germinate() {
    return new Mycelium(this.dna, int(this.x_pos), int(this.y_pos)); 
  } 
  
  float get_y_pos() {
    return this.y_pos; 
  }
  
  
}