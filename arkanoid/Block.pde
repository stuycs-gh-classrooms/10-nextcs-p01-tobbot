class Block {
  // Instance Variables
  int w, h; // The dimensions
  boolean isAlive;
  PVector block; //Store coordinates

  Block(PVector block, int w, int h) {
    this.block = block;
    this.w = w;
    this.h = h;
    this.isAlive = true; 
  }//block 

  void destroy() {
    isAlive = false; 
  }//destroy

  void display() {
    if (isAlive) {
      fill(255, 0, 0); 
      rectMode(CENTER);  //make the x,y be the rect center 
      rect(block.x, block.y, w, h);
    } //Boolean
  } //display
}//block
