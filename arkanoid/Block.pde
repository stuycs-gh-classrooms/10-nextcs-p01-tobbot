class Block {
  // Instance Variables
  int w, h; // The dimensions
  boolean isAlive;
  PVector center; //Store coordinates

  Block(PVector bcenter, int bw, int bh) {
    center = bcenter;
    w = bw;
    h = bh;
    isAlive = true;
  }//block

  void destroy() {
    isAlive = false;
  }//destroy

  void display() {
    if (isAlive) {
      fill(255, 0, 0);
      rectMode(CENTER);  //make the x, y be the rect center
      rect(center.x, center.y, w, h);
    }
  }//display
}//block
