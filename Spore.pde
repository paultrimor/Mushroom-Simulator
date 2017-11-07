class Spore {
  Dna dna; 
  
  float x_pos, y_pos; 
  float tx, ty;
    
  // states     
  float health; 
  float death_rate = 0;   
  boolean on_ground = false; 
  boolean is_dead; 
  
  Spore(Dna dna, int x, int y) {
    this.health = 100; 
    this.death_rate = 0.1; 
    this.dna = dna; 
    x_pos = x;
    y_pos = y; 
    
    tx = 100 * random(0,1); 
    ty = 300 * random(0,1); 
    
    on_ground = false; 
  }
  
  float tick = 0.01; 
  void update(Environment enviornment) {
    
    if (y_pos > enviornment.get_ground_level()) {
      println("HITS GROUND!"); 
      on_ground = true;       
      is_dead = true; 
    } else {
      x_pos += map(noise(tx), 0, 1, -3, 3); 
      y_pos += map(noise(ty), 0, 1, -1, 2.5); 
      
      tx+= tick; 
      ty+= tick; 
    
    }  
    
    if (health < 0 ) {
      this.is_dead = true; 
      println("DEAD SPORE"); 
    }
    
    this.health -= this.death_rate; 
  }
  
  void display(Environment enviornment) {
    // draw spore
    fill(#00ff0f); 
    ellipse(x_pos, y_pos , 5, 5); 
    
  }
  
  boolean is_on_ground(){
    return on_ground; 
  }
  
  boolean is_dead() {
    return is_dead; 
  }
  
  Mycelium germinate() {
    println("NEW MYCELIUM CREATED!"); 
    return new Mycelium(this.dna, int(this.x_pos), int(this.y_pos) + 100); 
  } 
  
  float get_y_pos() {
    return this.y_pos; 
  }
  
  float get_x_pos() {
    return this.x_pos; 
  }
  
  
}