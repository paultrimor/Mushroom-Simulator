
int screen_width; 
int screen_height; 

Environment environment; 


void setup() {
  
  // Mushroom Simulator
  
  screen_width = 1000; 
  screen_height = 1000; 
  
  size(1000, 1000); 
  
  environment = new Environment(screen_width, screen_height); 
  environment.initialize_grid(); 
  environment.initialize_players(); 
  
  
}

void draw(){
  background(100, 100, 100);    
  environment.fruit_scan(environment); 
  environment.spore_scan(environment);   
  environment.mycelium_scan(environment); 
  
  environment.display_ground(); 
    
}

//void mouseClicked() {
//  environment.add_fruit( new Fruit(new Dna(), int(random(0, width)), int(environment.get_ground_level())));
//}


int click = 1; 

void mouseClicked() {
  println("CLICK: " + click); 
  if (click == 0){
    environment.add_mycelium(); 
  } else if (click == 1) {
   environment.add_fruit( new Fruit(new Dna(), mouseX, int(environment.get_ground_level()) + 10));
  } else if (click == 2) {
    for (int i = 0; i < 300; i++) {
      environment.add_fruit( new Fruit(new Dna(), int(random(0, width)), int(environment.get_ground_level()) + 10));
    }
  }
  
  
  //click++; 
}

/* Utilties **/ 
void print_2D_array(int[][] array) {
  for (int j = 0; j < array.length; j++) {
    for (int i = 0; i < array[j].length; i++) {
      println(array[j][i]) ; 
    }
  }
}