class Dna {
  
  float fruit_height;
  float fruit_width;
  float spore_weight;
  float spore_friction;
  color spore_color; 
  float mycelium_rules; 
  int mycelium_color; 
  
  float[] property_array = new float[5]; 
   
  Dna() {                 
      fruit_height = random(0,1); 
      fruit_width = random(0,1);
      spore_weight = random(0,1); 
      spore_friction = random(0,1); 
      spore_color = color(random(0,1), random(0,1), random(0,1)); 
      mycelium_rules = random(0,1);   
      mycelium_color = int(random(0,225));
  }
  
  // Dna Setter
  Dna(float fruit_height,float fruit_width,float spore_weight,float spore_friction,float mycelium_rules, color mycelium_color) {
    this.fruit_height = fruit_height; 
    this.fruit_width = fruit_width; 
    this.spore_weight = spore_weight; 
    this.spore_friction = spore_friction; 
    this.mycelium_rules = mycelium_rules;    
    this.mycelium_color = mycelium_color; 
  }
  
  int get_mycelium_color() {
    return this.mycelium_color; 
  }
  
  color get_spore_color() {
    return this.spore_color; 
  }
  
  // Copy new Dna to memory 
  Dna copy() {
    
     // Simple copy
     float new_fruit_height = this.fruit_height; 
     float new_fruit_width = this.fruit_width; 
     float new_spore_weight = this.spore_weight; 
     float new_spore_friction = this.spore_friction; 
     float new_mycelium_rules = this.mycelium_rules; 
     color new_mycelium_color  = this.mycelium_color; 
     // create new Dna
     return new Dna(new_fruit_height, new_fruit_width, new_spore_weight, new_spore_friction, new_mycelium_rules, new_mycelium_color); 
    
  } 
  
  
} // Class body end 