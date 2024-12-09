class Paddle {
  //instance variables
  PVector center;
  int w, h;
  color c;
  boolean alive;

  Paddle(PVector pcenter, int pw, int ph, color pcolor) {
    center = pcenter;
    w = pw;
    h = ph;
    c = pcolor;
    alive = true;
  }//constructors

  void moveWithMouse() {
    if (mouseX > w / 2 && mouseX < width - w / 2 && alive) {
      center.x = mouseX;  // Move paddle with mouse
    }
  }//moveWithMouse

  void display() {
    fill(c);
    rectMode(CENTER);
    rect(center.x, center.y, w, h);
  }//display
}//Paddle
