# NeXtCS Project 01
### Period: 10
### Name0: Tsz Hang Ko
### Name1: Brian Chen
#### Selected Game: Breakout/Arkanoid
---

### How To Play
Explain how to play your game. Include any keyboard and/or mouse commands, game objectives, etc.


---

### Features
List all the game features you were able to implelment.


---

### Changes
What changed about your game after the design phase? Separate changes that occured after the feedback round and changes that occured during programming.

V1:
During our initial version of the game, we incorporated all the necessary components to make the game playable.
 - Changes to Ball Class from feedback round
   - Everything in the Ball class was implemented as said in the README file
   - Expansions:
      - bounce function was split up into multiple smaller functions and also named to be more telling of the process performed by the helper functions
      - (checkBlockCollision(Block block), checkPaddleCollision(Paddle paddle), checkCollisions(Paddle paddle, Block[][] blocks), bounceOffPaddle(Paddle paddle), bounceOffBlock(Block block))

