// Simple Breakout

float paddleH = 50;
float paddleW = 5;
float targetH = 50;
float targetW = 10;
float ballHW = 5;

float paddleX = 10;
float paddleY;
float ballX = 100;
float ballY = 100;
float targetX = 350;
float target1Y = 50;
float target2Y = 100;
float target3Y = 150;

float ballXSpeed = 2.8;
float ballYSpeed = -1.0;

boolean target1Hit = false;
boolean target2Hit = false;
boolean target3Hit = false;

int ballCount = 3;

boolean detect_collision(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2) {
  return abs(x1 - x2) <= (w1 + w2) / 2.0 && abs(y1 - y2) <= (h1 + h2) / 2.0;
}

void setup() {
  size(400, 200);
  fill(255);
  stroke(255);
  rectMode(CENTER);
}

void draw() {
  if (ballCount <= 0 || (target1Hit && target2Hit && target3Hit)) {
    //
    // Game Over
    //
    background(0);
    text("Game Over", 175, 100);
  } else {
    //
    // Update model
    //
    ballX += ballXSpeed;
    ballY += ballYSpeed;
    paddleY = mouseY;

    // Check paddle
    if (detect_collision(ballX, ballY, ballHW, ballHW, paddleX, paddleY, paddleW, paddleH)) {
      ballXSpeed *= -1;
    }

    // Check targets
    if (!target1Hit && detect_collision(ballX, ballY, ballHW, ballHW, targetX, target1Y, targetW, targetH)) {
      ballXSpeed *= -1;
      target1Hit = true;
    }
    if (!target2Hit && detect_collision(ballX, ballY, ballHW, ballHW, targetX, target2Y, targetW, targetH)) {
      ballXSpeed *= -1;
      target2Hit = true;
    }
    if (!target3Hit && detect_collision(ballX, ballY, ballHW, ballHW, targetX, target3Y, targetW, targetH)) {
      ballXSpeed *= -1;
      target3Hit = true;
    }

    // Check walls
    if (ballX > width - ballHW/2) {
      ballXSpeed *= -1;
    } else if (ballX < -ballHW/2) {
      ballCount--;
      if (ballCount > 0) {
        ballX = 200;
      }
    }
    if (ballY > height - ballHW/2 || ballY < ballHW/2) {
      ballYSpeed *= -1;
    }


    //
    // Draw screen
    //
    background(0);

    // paddle
    rect(paddleX, paddleY, paddleW, paddleH);

    // ball
    rect(ballX, ballY, ballHW, ballHW);

    // targets
    if (!target1Hit) {
      rect(targetX, target1Y, targetW, targetH);
    }
    if (!target2Hit) {
      rect(targetX, target2Y, targetW, targetH);
    }
    if (!target3Hit) {
      rect(targetX, target3Y, targetW, targetH);
    }
  }
}
