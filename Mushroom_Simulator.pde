void setup() {
  
  Environment enviroment = new Environment(800, 500);   
  size(enviroment.screen_width, enviroment.screen_height); 

  // Create a new Mycelium Object from random 
  Dna dna1 = new Dna(); 
  Mycelium myco1 = new Mycelium(dna1); 
  
  // Create a new Mycelum Object and SET its DNA 
  Dna dna2 = new Dna( 0.765454, 0.232213, 0.234332, 0.937482, 0.127258); 
  Mycelium myco2 = new Mycelium(dna2); 
  
  
  // Example Mycelium
  ArrayList<Mycelium> mycelia = new ArrayList<Mycelium>();
  
  for (int i = 0; i < 10; i++) {
    mycelia.add(new Mycelium(new Dna())); 
  }
  
  
  
 /**
   * Mycelium Loop Germinate Spores 
   *  - Checks if spores are ready to germinate, 
   *  - If they are, advance into Mycelium state
   *  - Don't forget to pass the DNA 
  **/ 
  for (int i = 0; i < mycelia.size(); i++) {
    
    // if Mi.is_ready() == true
     // if Mi.is_female() == true 
        
      
  }  
  
  
}

void draw(){


  
  
}