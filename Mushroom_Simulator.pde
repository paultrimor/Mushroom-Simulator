
int screen_width; 
int screen_height; 

Environment environment; 
Mycelium m1;
Fruit f1; 

ArrayList<Fruit> fruits; 

void setup() {
  
  screen_width = 1000; 
  screen_height = 1000; 
  
  size(1000, 1000); 
  
  environment = new Environment(screen_width, screen_height); 
  
  // print_2D_array(enviroment.get_ground_grid());   
  m1= new Mycelium(new Dna(), width/2, environment.get_ground_level()  ); 
  m1.set_initial_position(environment,width/2 -1 , environment.get_ground_level()/2 -1 ); 
  
  fruits = new ArrayList<Fruit>(); 
  
  for(int i = 0; i < 5; i++) {
    fruits.add( new Fruit(new Dna(), int(random(0, screen_width)), screen_height/2));
  }
  
  
  
}

void draw(){
  background(100, 100, 100);
  m1.add_cell(environment);  
  m1.display_to_grid(environment);   
  environment.display_ground(); 
  
   for (int i = 0; i < fruits.size(); i++) {
     fruits.get(i).update(); 
     fruits.get(i).display(environment); 
   }
  
   
  
}

/* Utilties **/ 
void print_2D_array(int[][] array) {
  for (int j = 0; j < array.length; j++) {
    for (int i = 0; i < array[j].length; i++) {
      println(array[j][i]) ; 
    }
  }
}