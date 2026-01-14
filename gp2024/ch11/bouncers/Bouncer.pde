class Bouncer {
  float x;
  float y;
  int diameter;
  float radius;
  float speedRange = 3;
  float xSpeed;
  float ySpeed;
  color c;

  Bouncer(float tempX, float tempY, int tempDiameter) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
    radius = diameter/2;
    c = color(random(256), random(256), random(256));
    xSpeed = random(-speedRange, speedRange);
    ySpeed = random(-speedRange, speedRange);
  }

  void move() {
    x += xSpeed;
    if (x < radius || x > width - radius) {
      xSpeed = -xSpeed;
    }
    y += ySpeed;
    if (y < radius || y > height - radius) {
      ySpeed = -ySpeed;
    }
  }

  void display() {
    fill(c);
    ellipse(x, y, diameter, diameter);
  }
}
