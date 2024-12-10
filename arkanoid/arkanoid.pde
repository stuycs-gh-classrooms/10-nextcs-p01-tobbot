int NUM_ROWS = 6;
int NUM_COLS = 8;
int BALL_SIZE = 20;
int BLOCK_WIDTH;
int BLOCK_HEIGHT;

int lives = 3;
boolean alive;
int numFrame = 60;
int time;

PShape grayHeart;
PShape redHeart;

Ball ball;
Paddle paddle;
Block[][] blocks;
Life hearts;

void setup() {
  size(600, 500);
  frameRate(numFrame); //temp

  //load shapes to indicate lives
  grayHeart = loadShape("images/gray_heart.svg");
  redHeart = loadShape("images/red_heart.svg");


  BLOCK_WIDTH = width / NUM_COLS;
  BLOCK_HEIGHT = height / 10;

  // Create the ball
  ball = new Ball(new PVector(width / 2, height - 200), new PVector(3, -3), color(255, 0, 0), BALL_SIZE);

  // Create the paddle
  paddle = new Paddle(new PVector(width / 2, height - 20), 100, 10, color(0, 255, 0));

  // Create the hearts
  hearts = new Life(lives);

  // Initialize blocks
  blocks = new Block[NUM_ROWS][NUM_COLS];
  for (int row = 0; row < NUM_ROWS; row++) {
    for (int col = 0; col < NUM_COLS; col++) {
      blocks[row][col] = new Block(new PVector(col * BLOCK_WIDTH + BLOCK_WIDTH / 2, row * BLOCK_HEIGHT + BLOCK_HEIGHT / 2), BLOCK_WIDTH, BLOCK_HEIGHT);
    }//for loop, col
  }//for loop, row
}//setup

void draw() {
  background(0); // Clear screen

  // Move the paddle with the mouse
  paddle.moveWithMouse();
  paddle.display();

  // Move and display the ball
  if (alive) {
    ball.move();
    ball.display();

    // Check for collisions with paddle, blocks, and walls
    ball.checkCollisions(paddle, blocks);
  } //boolean

  // Display and check collisions with blocks
  for (int row = 0; row < NUM_ROWS; row++) {
    for (int col = 0; col < NUM_COLS; col++) {
      Block block = blocks[row][col];
      if (block.isAlive) {
        block.display();
        ball.checkBlockCollision(block);  // Check if the ball hits this block
      } //boolean
    }
  }

  if (!alive) {
    // Game over condition if the ball falls off the screen
    if (lives > 1) {
      ball.reset();
      lives--;
    } //boolean
    else {
      textSize(50);
      fill(255);
      textAlign(CENTER, CENTER);
      text("Game Over", width / 2, height / 2);
    }
  }
}//draw
