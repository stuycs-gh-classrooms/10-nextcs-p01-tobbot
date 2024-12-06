class Ball {

  //instance variables
  PVector center;
  PVector v; //speed and direction
  boolean alive;
  color c;
  
  //constructors
  void move() {
    center.x = center.x + (int) v.x;
    center.y = center.y + (int) v.y;
  }//move
  
  void setColor(color newColor) {
    c = newColor;
  }//setColor

  void checkCollison() {
  }//checkCollison

  void bounce() {
  }//bounce

  void reset() {
    if (center.y < height) {
      alive = false;
    }
  }//reset

  void display() {
    fill(c);
    circle(center.x, center.y, 10);
  }//display
}//Ball
