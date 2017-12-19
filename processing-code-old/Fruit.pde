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
    

    
    // Color Variance 
    float variance;   
    color cap_color; 
    color spore_color; 
    
    // States
    float death_rate = 0.001; 
    boolean is_ready = false; 
    boolean is_dying = false; 
    boolean is_dead = false; 
    int health = 100; 
    
    Spore[] spores = new Spore[5]; 
    
    Fruit(Dna dna, int x, int y) {
      this.health = 100; 
      this.dna = dna; 
      this.init_x = x;
      this.init_y = y;   
      
      base_position = new PVector(init_x, init_y); 
      head_position = new PVector(init_x, init_y); 
      
      int MAX_HEIGHT = 300; 
      
      float length = this.dna.fruit_height * MAX_HEIGHT;    
      
      variance = random(-1,1);
      cap_color = color(int(random(0,225)), int(random(0,225)), int(random(0,225))); 
      spore_color = color(int(random(0,225)), int(random(0,225)), int(random(0,225))); 
      
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
      
      if (pct > 0.9 && pct < 0.901) {
        this.is_ready = true; 
        death_rate = 0.0001;  
      }
      
      if (pct >= 0.93) {
        this.is_ready = false; 
      }
      
      if(this.health == 0) {
        this.is_dead = true; 
      }
      
      this.health -= death_rate; 
    }
    
    boolean is_ready() {
      return is_ready; 
    }
    
    boolean is_dying(){
      return is_dying; 
    }
    
    boolean is_dead() {
      return is_dead; 
    }
    
    Spore spore() {
      Spore spore;
      float x_pos; 
      
        x_pos = map(random(0,1), 0, 1, head_position.x - head_radius, head_position.x + head_radius); 
        spore = new Spore(this.dna, int(x_pos), int(head_position.y));        
      return spore; 
    }
    
    void display(Environment environment) {  
      noStroke(); 
      // Draw base epllipse 
      ellipse(base_position.x, base_position.y, base_radius, base_radius); 
      
      //Draw head radius 
      ellipse(head_position.x, head_position.y, head_radius, head_radius); 
      
      // Connect base and head with curve
      stroke(#0000ff); 
      noFill(); 
      
      line(base_position.x, base_position.y, head_position.x, head_position.y); 
      
      // ellipse(base_position.x, base_position.y, 10, 10); 
      // ellipse(head_position.x, head_position.y, 10, 10);      
      
      // ellipse(base_position.x + (30 * variance ), ((base_position.y + head_position.y)/2) + (30*variance), 5, 5);  
      // ellipse(base_position.x - (10 * variance ),((base_position.y + head_position.y)/2) - (10*variance), 5, 5); 
      fill(#ff0000); 
      
      // Draw fruit stem 
      noStroke(); 
      fill(#F0FFF0); 
      beginShape(); 
      vertex(base_position.x + base_radius/2, base_position.y); 
      vertex(head_position.x + head_radius/2, head_position.y); 
      vertex(head_position.x - head_radius/2, head_position.y); 
      vertex(base_position.x - head_radius/2, base_position.y); 
      endShape(); 
      
      //draw fruit cap 
      noStroke(); 
      fill(this.cap_color); 
      arc(head_position.x, head_position.y, 100*pct, 100*pct, radians(180), radians(360));

    }
    

}