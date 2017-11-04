
class Mycelium {
  Cell[] cells = new Cell[1000]; 
  Dna dna; 
  float health; 
  
    
  
  Mycelium(Dna new_dna) {
    dna = new_dna;
  }
  
  void colonize() {
    // Scans pixel and adds necessary pixels
    
  }
  
  void display() {
  
  }
  
  boolean is_ready() {
     // Trigger true when Mycellium is ready to fruit 
     return false; 
     
  }
  
  Dna get_partner() {  
     return new Dna(); 
  }
  
  
  
}