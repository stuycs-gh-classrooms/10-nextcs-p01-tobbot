class Ball {

  //instance variables
  PVector center;
  PVector v; //speed and direction
  color c;
  int size;
  int lastCollisionFrame = 0;

  Ball(PVector bcenter, PVector bv, color bc, int bsize) {
    center = bcenter;
    v = bv;
    c = bc;
    size = bsize;
    alive = true;
  } //contructor

  void move() {
    center.add(v);  //add vectors

    // Ball bouncing off the left and right walls
    if (center.x - size / 2 < 0 || center.x + size / 2 > width) {
      v.x *= -1;  // Invert the horizontal velocity
    }

    // Ball bouncing off the top wall
    if (center.y - size / 2 < 0) {
      v.y *= -1;  // Invert the vertical velocity
    }

    // Ball falling below the screen
    if (center.y + size / 2 > height) {
      alive = false;  // Ball has fallen, game over
    }
  }//move

  void display() {
    fill(c);
    circle(center.x, center.y, size);
  }//display

  // Check if ball has hit the block, within the perimeter of the block
  boolean checkBlockCollision(Block block) {
    return (center.x + size / 2 > block.center.x - block.w / 2 &&
      center.x - size / 2 < block.center.x + block.w / 2 &&
      center.y + size / 2 > block.center.y - block.h / 2 &&
      center.y - size / 2 < block.center.y + block.h / 2);
  }//checkBlockCollision

  //Check if ball has hit the paddle, within the range of the paddle
  boolean checkPaddleCollision(Paddle paddle) {
    return (center.y + size / 2 > paddle.center.y - paddle.h / 2 &&
      center.x + size / 2 > paddle.center.x - paddle.w / 2 &&
      center.x - size / 2 < paddle.center.x + paddle.w / 2);
  }//checkPaddleCollision

  // Check collisions with paddle and blocks
  void checkCollisions(Paddle paddle, Block[][] blocks) {
    // Ball collision with the paddle, must be within bounds of the paddle
    if (checkPaddleCollision(paddle)) {
      bounceOffPaddle(paddle);
    }//boolean

    // Ball collision with blocks
    for (int row = 0; row < blocks.length; row++) {
      for (int col = 0; col < blocks[row].length; col++) {
        Block bk = blocks[row][col];
        if (bk.isAlive && checkBlockCollision(bk)) {
          bk.destroy();
          bounceOffBlock(bk);  // Handle bounce off block
        }
      }
    }
  }//checkCollisions

  // Handle ball bounce from the paddle
  void bounceOffPaddle(Paddle paddle) {
    // Bounce direction based on where the ball hits the paddle
    float hitPos = (center.x - paddle.center.x) / (paddle.w / 2);  // Proportional distance from the center
    v.x = hitPos * 5; // Set horizontal speed based on the hit position
    v.y *= -1;  // Reverse vertical speed (bounce upwards)
  }//bounce

  // Bounce off a block (change direction)
  void bounceOffBlock(Block block) {
    // Calculate the ball's center relative to the block
    float ballLeft = center.x - size / 2;
    float ballRight = center.x + size / 2;
    float ballTop = center.y - size / 2;
    float ballBottom = center.y + size / 2;

    float blockLeft = block.center.x - block.w / 2;
    float blockRight = block.center.x + block.w / 2;
    float blockTop = block.center.y - block.h / 2;
    float blockBottom = block.center.y + block.h / 2;

    /*
The first four conditions are true inside or along the sides of a block (aka collide
     with a block). At least one frame must have passed before a ball can bounce again. This
     avoids bouncing the ball twice when it collides with two tiles at once.
     */
    if (ballRight > blockLeft && ballLeft < blockRight &&
      ballBottom > blockTop && ballTop < blockBottom &&
      frameCount - lastCollisionFrame >= 1) {
      lastCollisionFrame = frameCount;
      v.x *= -1;
      v.y *= -1;
    }
  }//bounceOffBlock

  // Reset ball position if lost
  void reset() {
    center = new PVector(width / 2, height - 200);
    v = new PVector(3, -3);  // Reset to initial velocity
    alive = true;
  }//reset
}
