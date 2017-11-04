class Fruit {
    Dna dna; 
    
    int init_x; 
    int init_y; 
    
    PVector base_position;
  
    PVector head_position = new PVector(0,0); 
    PVector head_velocity = new PVector(0,0); 
    PVector head_acceleration = new PVector(0,0); 
    
    PVector base_head_distance = new PVector(0, 0); 
  
    float start_head_radius;
    float start_base_radius; 
    
    float end_head_radius;    
    float end_base_radius; 
    
    float base_radius, head_radius; 
    
    int MAX_HEIGHT; 
    
    float pct = 0.0; 
    float step = 0.001; 
    
    int time; 
    
    
    Fruit(Dna dna, int x, int y) {
      this.dna = dna; 
      this.init_x = x;
      this.init_y = y;   
      
      base_position = new PVector(init_x, init_y); 
      head_position = new PVector(init_x, init_y); 
      
      int MAX_HEIGHT = 300; 
      
      float length = this.dna.fruit_height * MAX_HEIGHT;    
      
      base_head_distance.set(20, length); 
      
      start_base_radius = 1;
      start_head_radius = 1; 
      
      end_base_radius = start_base_radius * 40; 
      end_head_radius = start_head_radius * 20; 
      
      base_radius = start_base_radius;
      head_radius = start_head_radius;     
    }
              
    void update() {
       pct += step; 
      if (pct < 1.0) {
        head_position.x = base_position.x + (pct * base_head_distance.x); 
        head_position.y = base_position.y - (pow(pct, 0.5) * base_head_distance.y); 
        
        head_radius = start_head_radius + (pct * (end_head_radius - start_head_radius));
        base_radius = start_base_radius + (pct * (end_base_radius - start_base_radius));        
      }
    }
    
    void display(Environment environment) {  

      noStroke(); 
      // Draw base epllipse 
      ellipse(base_position.x, base_position.y, base_radius, base_radius); 
      
      //Draw head radius 
      ellipse(head_position.x, head_position.y, head_radius, head_radius); 
      
      // Connect base and head with curve
      strokeWeight(1); 
      stroke(#ff0000); 
      line(base_position.x, base_position.y, head_position.x, head_position.y); 
    
      println(pct); 
    }
    

}