
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
  
 // Data DNA Table display
 String[] args = {"TwoFrameTest"};
 SecondApplet sa = new SecondApplet(); 
 PApplet.runSketch(args, sa); 
 
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

int tx = int(random(0,1000)); 
void mouseClicked() {
  
  int pos_x = int(map(noise(tx), 0, 1, 0, width));            
  environment.add_fruit(new Fruit(new Dna(), pos_x, int(environment.get_ground_level() + 5))); 
  tx += 1.5; 
   
}

/** Utilties **/ 
void print_2D_array(int[][] array) {
  for (int j = 0; j < array.length; j++) {
    for (int i = 0; i < array[j].length; i++) {
      println(array[j][i]) ; 
    }
  }
}

/** Create DNA Table window **/ 
public class SecondApplet extends PApplet {
  
  public void settings() {
    size(500, 100); 
  }
  
  public void draw() {
    background(random(0, 100), random(0, 100), random(150, 250));
  }
}