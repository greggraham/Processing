class JitterBug {
  float x;
  float y;
  int diameter;
  float speed = 2.5;
  color c;

  JitterBug(float tempX, float tempY, int tempDiameter) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
    c = color(random(256), random(256), random(256));
  }

  void move() {
    x += random(-speed, speed);
    x = constrain(x, 0-diameter, width+diameter);
    y += random(-speed, speed);
    y = constrain(y, 0-diameter, height+diameter);
  }

  void display() {
    fill(c);
    ellipse(x, y, diameter, diameter);
  }
}
