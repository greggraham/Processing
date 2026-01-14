class Laser {
  int timer = 0;

  void fire() {
    timer = 10;
  }

  boolean active() {
    return timer > 0;
  }

  void draw(float laserX) {
    timer--;
    if (active()) {
      strokeWeight(5);
      stroke(255, 0, 0);
      line(laserX, 300, laserX, 0);
    }
  }

  boolean checkHit(float laserX, Ufo target) {
    if (active()) {
      return abs(target.getX() - laserX) < 16;
    } else {
      return false;
    }
  }
}
