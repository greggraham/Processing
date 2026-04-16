class Missile {

  float missileWidth = 4;
  float missileHeight = 7;
  float x = 0;
  float y = 0;
  float speed = 5;
  boolean alive = false;

  void move() {
    if (alive) {
      y -= speed;
      if (y < -missileHeight) {
        alive = false;
      }
    }
  }

  void render() {
    if (alive) {
      ellipseMode(CORNER);
      fill(255, 94, 54);
      strokeWeight(1);
      stroke(255, 51, 0);
      ellipse(x, y, missileWidth, missileHeight);
    }
  }

  void launch(float shipX, float shipY) {
    x = shipX - missileWidth / 2;
    y = shipY - 5;
    alive = true;
  }

  BoundingBox bbox() {
    return new BoundingBox(x, x + missileWidth,
      y, y + missileHeight);
  }
  
  boolean hit(Ufo enemy) {
    if (alive && this.bbox().intersectsWith(enemy.bbox())) {
      alive = false;
      return true;
    } else {
      return false;
    }
  }
}
