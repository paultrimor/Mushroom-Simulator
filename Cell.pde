class Cell {
  
  int x; 
  int y; 
  
  int cell_color; 
  
  Cell(int new_x, int new_y) {
    this.x = new_x; 
    this.y = new_y; 
    
    this.cell_color = 250;
  }
  
  color get_color() {
    return cell_color; 
  }
  
  void set_color(color new_color) {
    this.cell_color = new_color;
  }
  

}