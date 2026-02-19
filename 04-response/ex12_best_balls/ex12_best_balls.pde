float ball1X;
float ball2X;
float ball3X;

float ball1Y;
float ball2Y;
float ball3Y;

float minR = 15;
float maxR = 50;
float ball1R;
float ball2R;
float ball3R;

float ball1VX;
float ball1VY;
float ball2VX;
float ball2VY;
float ball3VX;
float ball3VY;

// Returns {vx1', vy1', vx2', vy2'} after elastic collision.
// Mass is proportional to r^2 (area), so bigger balls deflect less.
float[] elasticCollision(float x1, float y1, float r1, float vx1, float vy1,
                          float x2, float y2, float r2, float vx2, float vy2) {
  float m1 = r1 * r1;
  float m2 = r2 * r2;
  float d = dist(x1, y1, x2, y2);
  float nx = (x2 - x1) / d;
  float ny = (y2 - y1) / d;

  // Relative velocity along collision normal (positive = approaching)
  float dvn = (vx1 - vx2) * nx + (vy1 - vy2) * ny;

  // Skip if balls are already separating
  if (dvn <= 0) return new float[] {vx1, vy1, vx2, vy2};

  float impulse = 2 * m1 * m2 / (m1 + m2) * dvn;

  return new float[] {
    vx1 - impulse / m1 * nx,
    vy1 - impulse / m1 * ny,
    vx2 + impulse / m2 * nx,
    vy2 + impulse / m2 * ny
  };
}

boolean detectCollision(float x1, float y1, float r1, float x2, float y2, float r2) {
  return dist(x1, y1, x2, y2) < (r1 + r2);
}

float newX(float oldX, float vx) {
  float x = oldX + vx;
  if (x > width) {
    x -= width;
  } else if (x < 0) {
    x += width;
  }
  return x;
}

float newY(float oldY, float vy) {
  float y = oldY + vy;
  if (y > height) {
    y -= height;
  } else if (y < 0) {
    y += height;
  }
  return y;
}

void setup() {
  size(400, 400);
  ellipseMode(RADIUS);
  ball1X = random(width);
  ball2X = random(width);
  ball3X = random(width);

  ball1Y = random(height);
  ball2Y = random(height);
  ball3Y = random(height);

  ball1R = random(minR, maxR);
  ball2R = random(minR, maxR);
  ball3R = random(minR, maxR);

  float initSpeed = 5;
  float a1 = random(TWO_PI);
  float a2 = random(TWO_PI);
  float a3 = random(TWO_PI);
  ball1VX = initSpeed * cos(a1);
  ball1VY = initSpeed * sin(a1);
  ball2VX = initSpeed * cos(a2);
  ball2VY = initSpeed * sin(a2);
  ball3VX = initSpeed * cos(a3);
  ball3VY = initSpeed * sin(a3);

  fill(255);
  stroke(255);

  frameRate(30);
}

void draw() {

  // Draw screen
  background(0);
  circle(ball1X, ball1Y, ball1R);
  circle(ball2X, ball2Y, ball2R);
  circle(ball3X, ball3Y, ball3R);

  // Update positions
  ball1X = newX(ball1X, ball1VX);
  ball1Y = newY(ball1Y, ball1VY);
  ball2X = newX(ball2X, ball2VX);
  ball2Y = newY(ball2Y, ball2VY);
  ball3X = newX(ball3X, ball3VX);
  ball3Y = newY(ball3Y, ball3VY);

  // Resolve collisions
  float[] v;
  if (detectCollision(ball1X, ball1Y, ball1R, ball2X, ball2Y, ball2R)) {
    v = elasticCollision(ball1X, ball1Y, ball1R, ball1VX, ball1VY,
                         ball2X, ball2Y, ball2R, ball2VX, ball2VY);
    ball1VX = v[0]; ball1VY = v[1];
    ball2VX = v[2]; ball2VY = v[3];
  }
  if (detectCollision(ball1X, ball1Y, ball1R, ball3X, ball3Y, ball3R)) {
    v = elasticCollision(ball1X, ball1Y, ball1R, ball1VX, ball1VY,
                         ball3X, ball3Y, ball3R, ball3VX, ball3VY);
    ball1VX = v[0]; ball1VY = v[1];
    ball3VX = v[2]; ball3VY = v[3];
  }
  if (detectCollision(ball2X, ball2Y, ball2R, ball3X, ball3Y, ball3R)) {
    v = elasticCollision(ball2X, ball2Y, ball2R, ball2VX, ball2VY,
                         ball3X, ball3Y, ball3R, ball3VX, ball3VY);
    ball2VX = v[0]; ball2VY = v[1];
    ball3VX = v[2]; ball3VY = v[3];
  }

}
