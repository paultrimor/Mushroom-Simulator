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
    
    // Variance 
    float variance;     
    
    Fruit(Dna dna, int x, int y) {
      this.dna = dna; 
      this.init_x = x;
      this.init_y = y;   
      
      base_position = new PVector(init_x, init_y); 
      head_position = new PVector(init_x, init_y); 
      
      int MAX_HEIGHT = 300; 
      
      float length = this.dna.fruit_height * MAX_HEIGHT;    
      
      variance = random(-1,1);
      
      base_head_distance.set(variance * 40, length); 
      
      start_base_radius = 1;
      start_head_radius = 1; 
      
      end_base_radius = start_base_radius * 20; 
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
      stroke(#ff0000); 
      // Draw base epllipse 
      ellipse(base_position.x, base_position.y, base_radius, base_radius); 
      
      //Draw head radius 
      ellipse(head_position.x, head_position.y, head_radius, head_radius); 
      
      // Connect base and head with curve
      strokeWeight(1); 
      stroke(#0000ff); 
      noFill(); 
      
      line(base_position.x, base_position.y, head_position.x, head_position.y); 
      stroke(#ff0000); 
      
      // ellipse(base_position.x, base_position.y, 10, 10); 
      // ellipse(head_position.x, head_position.y, 10, 10);      
      
      // ellipse(base_position.x + (30 * variance ), ((base_position.y + head_position.y)/2) + (30*variance), 5, 5);  
      // ellipse(base_position.x - (10 * variance ),((base_position.y + head_position.y)/2) - (10*variance), 5, 5); 
      fill(#ff0000); 
      
      // Draw fruit stem 
      
      beginShape(); 
      vertex(base_position.x + base_radius/2, base_position.y); 
      vertex(head_position.x + head_radius/2, head_position.y); 
      vertex(head_position.x - head_radius/2, head_position.y); 
      vertex(base_position.x - head_radius/2, base_position.y); 
      endShape(); 
      
      //draw fruit cap 
      fill(#00ffFF); 
      arc(head_position.x, head_position.y, 100*pct, 100*pct, radians(180), radians(360));
     
      println(pct); 
    }
    

}