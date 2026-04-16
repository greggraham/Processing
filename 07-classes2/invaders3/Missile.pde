class Missile {
  
  float x = 0;
  float y = 0;
  float speed = 2;
  boolean alive = false;
  
  void move() {
    if (alive) {
      y -= speed;
    }
  }
  
  void render() {
    if (alive) {
      ellipseMode(CENTER);
      stroke(255, 0, 0);
      fill(255, 0, 0);
      ellipse(x, y, 2, 3);
    }
  }
  
  void launch(float shipX, float shipY) {
    x = shipX;
    y = shipY + 5;
    alive = true;
  }
}
