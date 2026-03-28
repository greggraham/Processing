class Bouncer {
  float x;
  float y;
  int diameter;
  float radius;
  float speedRange = 3;
  float xSpeed;
  float ySpeed;
  color c;
  
  Bouncer() {
    int d = int(random(10, 20));
    diameter = d;
    x = random(d, width - d);
    y = random(d, height - d);
    radius = d/2;
    c = color(random(256), random(256), random(256));
    xSpeed = random(-speedRange, speedRange);
    ySpeed = random(-speedRange, speedRange);
  }
  
  void update() {
    x += xSpeed;
    if (x <  radius ||  x > width -  radius) {
       xSpeed = -xSpeed;
    }
    y += ySpeed;
    if (y < radius || y > height - radius) {
       ySpeed = -ySpeed;
    }
  }
  
  void render() {
    fill(c);
    ellipse(x, y, diameter, diameter);
  }
}
