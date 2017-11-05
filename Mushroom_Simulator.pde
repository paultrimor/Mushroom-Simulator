
int screen_width; 
int screen_height; 

Environment environment; 
Mycelium m1;
Fruit f1; 
Spore spore; 
Fruit[] fruits; 

ArrayList<Fruit> fruitas; 

void setup() {
  
  screen_width = 1000; 
  screen_height = 1000; 
  
  size(1000, 1000); 
  
  environment = new Environment(screen_width, screen_height); 
  environment.initialize_players();  
  
  
}

void draw(){
   background(100, 100, 100); 
   
  environment.spore_scan(environment); 
  environment.display_ground(); 
  

 
}

/* Utilties **/ 
void print_2D_array(int[][] array) {
  for (int j = 0; j < array.length; j++) {
    for (int i = 0; i < array[j].length; i++) {
      println(array[j][i]) ; 
    }
  }
}