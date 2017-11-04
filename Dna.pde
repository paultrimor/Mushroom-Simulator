class Dna {
  
  float fruit_height;
  float fruit_width;
  float spore_weight;
  float spore_friction;
  float mycelium_rules; 
  
  float[] property_array = new float[5]; 
   
  Dna() {                 
      fruit_height = random(0,1); 
      fruit_width = random(0,1);
      spore_weight = random(0,1); 
      spore_friction = random(0,1); 
      mycelium_rules = random(0,1);    
      
  }
  
  // Dna Setter
  Dna(float fruit_height,float fruit_width,float spore_weight,float spore_friction,float mycelium_rules) {
    this.fruit_height = fruit_height; 
    this.fruit_width = fruit_width; 
    this.spore_weight = spore_weight; 
    this.spore_friction = spore_friction; 
    this.mycelium_rules = mycelium_rules;    
  }
  
  // Copy new Dna to memory 
  Dna copy() {
    
     // Simple copy
     float new_fruit_height = this.fruit_height; 
     float new_fruit_width = this.fruit_width; 
     float new_spore_weight = this.spore_weight; 
     float new_spore_friction = this.spore_friction; 
     float new_mycelium_rules = this.mycelium_rules; 
     
     // create new Dna
     return new Dna(new_fruit_height, new_fruit_width, new_spore_weight, new_spore_friction, new_mycelium_rules); 
    
  } 
  
  
} // Class body end 