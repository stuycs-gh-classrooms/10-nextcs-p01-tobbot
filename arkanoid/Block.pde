class Block {
  // Instance Variables
  int w, h; // The dimensions
  boolean isAlive;
  PVector block; //Store coordinates

  //Contructors
  Block(PVector block, int w, int h) {
    w = this.w;
    h = this.h;
    block = new PVector(block.x, block.y);
  } // Block

  boolean checkHit() {
    return true; 
  } // checkhit

  void destroy() {
    if (checkHit()) {
      isAlive = false ;
    } // Set Boolean
  } // destroy
} //Ball
