[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/2bl0h1Mb)
# NeXtCS Project 01
### Name0: Tsz Hang Ko
### Name1: Brian Chen
---

### Overview
Your mission is create either:
- Life-like cellular automata [life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life), [life-like](https://en.wikipedia.org/wiki/Life-like_cellular_automaton), [demo](https://www.netlogoweb.org/launch#https://www.netlogoweb.org/assets/modelslib/Sample%20Models/Computer%20Science/Cellular%20Automata/Life.nlogo).
- Breakout/Arkanoid [demo 0](https://elgoog.im/breakout/)  [demo 1](https://www.crazygames.com/game/atari-breakout)
- Space Invaders/Galaga

This project will be completed in phases. The first phase will be to work on this document. Use markdown formatting. For more markdown help [click here](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) or [here](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)


---

## Phase 0: Selection, Analysis & Plan

#### Selected Project: Breakout/Arkanoid

### Necessary Features

Ball: The ball should bounce around the screen, interact with blocks

Paddle (Plate): A movable paddle controlled by the player that interacts with the ball to keep it in play.

Blocks: A set of blocks arranged in a 2D grid that the ball destroys upon collision.

Bounce Direction: The ball should change direction after bouncing off the paddle, blocks, or edges of the screen.

Tile System: A 2D array for block positions and their state (e.g., alive or dead).

Ball's Alive State: The ball should remain alive until it falls below the screen (losing condition).

Game Over Mechanism: A condition to end the game when the ball is lost (falls off the screen).

### Extra Features
Bounce(additional): Ball bounces with based on the where it hits the paddle

Powerups: Powerups should drop from destroyed blocks, providing the player with abilities like wider paddles, extra balls, faster balls, etc.

Score System: Display a score showing how many blocks have been destroyed or how long the game has lasted.

Lives: The player has a limited number of lives (balls), and once all lives are lost, the game ends.

Pause and play Button: A button to either stop or resume gameplay


### Array Usage
How will you be using arrays in this project?

1D Array:
Used to store the current score and the number of lives remaining.
A 1D array for powerup states or types might be used.

2D Array:
Used to store the positions of blocks
Used to store the position of the ball
Could also be used to track tile positions for boost powerups and paddle powerups.

### Controls
How will your program be controlled? List all keyboard commands and mouse interactions.

Keyboard Commands:
Space bar: Pause/Resume game

Mouse Control:
- Mouse Movement: Control the paddle’s position horizontally based on the mouse's x-axis position.


### Classes
What classes will you be creating for this project? Include the instance variables and methods that you believe you will need. You will be required to create at least 2 different classes. If you are going to use classes similar to those we've made for previous assignments, you will have to add new features to them.

CLASS Ball
- Instance variables:
  - position (x, y): The current position of the ball.
  - velocity (vx, vy): The speed and direction of the ball.
  - alive (boolean): Tracks if the ball is still in play.
- METHODS
  - move(): Updates the ball's position based on velocity.
  - checkCollision(): Checks for collisions with blocks, paddle, or walls.
  - bounce(): Changes the direction of the ball after hitting a block, paddle, or wall.
  - bounce(paddle):
     - When the ball hits the paddle, the bounce angle is determined by the ball's position on the paddle:
     - The bounce angle is calculated based on the distance from the ball’s x-position to the paddle's left edge.
     - The further the ball hits from the center, the steeper the angle of reflection.
     - The angle is used to adjust the ball’s velocity in both the x and y directions, so that the ball reflects 
       at the correct angle (straight up if in the center, and more angled if near the edges).
  - reset(): Resets ball position if it goes out of bounds (game over).
  - display(): Draws the ball on the screen.


CLASS Paddle (Plate)
- Instance variables:
  - x: The current x position of the paddle (controlled by the mouse).
  - y: The fixed y position of the paddle (usually at the bottom of the screen).
  - width: The width of the paddle.
  - height: The height of the paddle (fixed).
- METHODS
  - moveWithMouse(mouseX):
    Moves the paddle horizontally based on the x-position of the mouse. The paddle’s position will be centered 
    on the mouse’s x-coordinate.

  - getBounceDistance(ballX):
    Calculates the distance between the ball’s current x position and the left edge of the paddle. This distance 
    will be used in the bounce calculation.

  - diaply():
    Draws the paddle at its current position on the screen.


 
CLASS Block
- Instance variables:
  - x, y: The position of the block.
  - width, height: The dimensions of the block.
  - isAlive: Boolean to track if the block is alive or destroyed.
- METHODS
  - checkHit(ball):
    Checks if the ball has hit the block (ball’s position intersects with block’s position). If the ball hits 
    the block, the block is destroyed.

  - destroy():
    Marks the block as destroyed (e.g., changing isAlive to False).

  - diaplay():
    Draws the block at its current position on the screen.

Class Powerup
- Instance Variables:
  - type: The type of powerup (e.g., extra ball, wider paddle, faster ball).
  - position (x, y): Position of the powerup on the screen.
- Methods:
  - activate(): Activates the powerup effect (e.g., change paddle size).
  - move(): Moves the powerup down the screen.
  - display(): Draws the powerup on the screen.

 Driver file 
 1. Ball and Tile (Block) Interaction
    * Ball and Block Collision:
    * When the ball collides with a block (tile), the block is destroyed.
    * If the block has a boost, a power-up item is spawned and falls toward the paddle.
 2. Tile and Boost Interaction
    * Tile Boost Activation:
    * Some blocks are boost blocks and generate a power-up when hit by the ball.
    * Power-ups may include effects like wider paddle, faster ball, extra life, etc.
 3. Boost and Plate (Paddle) Interaction
    * Boost Pickup:
    * The paddle (plate) catches the falling power-up generated by a boost block.
    * The collected power-up applies an effect to the paddle (e.g., wider, faster, sticky).
 4. Plate (Paddle) and Ball Interaction
    * Ball and Paddle Collision:
    * The ball collides with the paddle (plate) and bounces off.
    * The bounce angle is based on where the ball hits the paddle (center vs. edges).
    * The paddle's size and behavior may be altered if a boost has been applied (e.g., wider paddle, faster movement).
