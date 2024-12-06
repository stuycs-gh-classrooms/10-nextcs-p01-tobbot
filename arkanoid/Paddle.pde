class Paddle {
  
  //instance variables
 PVector center;
 int w, h;
 color c;
  
  //constructors
  
  void moveWithMouse() {
    center.x = mouseX;
  }//moveWithMouse
  
  void getBounceDist() {
  }//getBounceDist
  
  void display() {
    fill(c);
  }//display
  
}//Paddle
