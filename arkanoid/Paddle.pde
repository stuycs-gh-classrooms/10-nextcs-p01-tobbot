class Paddle {
  //instance variables
  PVector center;
  int w, h;
  color c;

  Paddle(PVector center, int w, int h, color c) {
    this.center = center;
    this.w = w;
    this.h = h;
    this.c = c;
  }//constructors

  void moveWithMouse() {
      if (mouseX > w / 2 && mouseX < width - w / 2) {
      center.x = mouseX;  // Move paddle with mouse
    } //boolean
  }//moveWithMouse

  void display() {
    fill(c);
    rectMode(CENTER);
    rect(center.x, center.y, w, h);
  }//display
}//Paddle
