float ball1X;
float ball2X;
float ball3X;

float ball1Y;
float ball2Y;
float ball3Y;

float ball1R;
float ball2R;
float ball3R;

float ball1A;
float ball2A;
float ball3A;

float ball1S = 10;
float ball2S = 10;
float ball3S = 10;

float newAngle() {
  return random(-PI, PI);
}

float newSpeed(float oldSpeed) {
  float speed = oldSpeed + random(-0.5, 0.5);
  speed = constrain(speed, 0.1, 25.0);
  return speed;
}

float newX(float oldX, float angle, float speed) {
  float x = oldX + speed * cos(angle); //<>//
  if (x > width) {
    x -= width;
  } else if (x < 0) {
    x += width;
  }
  return x;
}

float newY(float oldY, float angle, float speed) {
  float y = oldY + speed * sin(angle); //<>//
  if (y > height) {
    y -= height;
  } else if (y < 0) {
    y += height;
  }
  return y;
}

boolean detectCollision(float x1, float y1, float r1, float x2, float y2, float r2) {
  return dist(x1, y1, x2, y2) < (r1 + r2) / 2;
}

void setup() {
  size(400, 400);
  ball1X = random(width);
  ball2X = random(width);
  ball3X = random(width);

  ball1Y = random(width);
  ball2Y = random(width);
  ball3Y = random(width);

  ball1R = random(10, 30);
  ball2R = random(10, 30);
  ball3R = random(10, 30);

  ball1A = newAngle();
  ball2A = newAngle();
  ball3A = newAngle();

  ball1S = newSpeed(ball1S);
  ball2S = newSpeed(ball2S);
  ball3S = newSpeed(ball3S);
  
  fill(255);
  stroke(255);
  
  frameRate(30);
}

void draw() {

  // Draw screen
  background(0);
  println(ball1X, ball1Y, ball1S, ball1A);
  circle(ball1X, ball1Y, ball1R); //<>//
  circle(ball2X, ball2Y, ball2R);
  circle(ball3X, ball3Y, ball3R);

  // Update model
  ball1X = newX(ball1X, ball1A, ball1S);
  ball1Y = newY(ball1Y, ball1A, ball1S);
  ball2X = newX(ball2X, ball2A, ball2S);
  ball2Y = newY(ball2Y, ball2A, ball2S);
  ball3X = newX(ball3X, ball3A, ball3S);
  ball3Y = newY(ball3Y, ball3A, ball3S);
  
  if (detectCollision(ball1X, ball1Y, ball1R, ball2X, ball2Y, ball2R)) {
    ball1A = newAngle();
    ball2A = newAngle();
    ball1S = newSpeed(ball1S);
    ball2S = newSpeed(ball2S);
  }
  if (detectCollision(ball1X, ball1Y, ball1R, ball3X, ball3Y, ball3R)) {
    ball1A = newAngle();
    ball3A = newAngle();
    ball1S = newSpeed(ball1S);
    ball3S = newSpeed(ball2S);
  }
  if (detectCollision(ball3X, ball3Y, ball3R, ball2X, ball2Y, ball2R)) {
    ball3A = newAngle();
    ball2A = newAngle();
    ball3S = newSpeed(ball1S);
    ball2S = newSpeed(ball2S);
  }
  
}
