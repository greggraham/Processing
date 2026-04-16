// This class represents the missiles fired by the ship. Missile objects can be
// reused by changing the alive status.

class Missile {

  float missileWidth = 4;
  float missileHeight = 7;
  float x = 0;
  float y = 0;
  float speed = 5;
  boolean alive = false;

  // Move the missile up
  void move() {
    if (alive) { // only process missiles that are alive
      y -= speed;
      
      // kill missiles when they go off the top of the screen
      if (y < -missileHeight) {
        alive = false;
      }
    }
  }

  // draws a missile
  void render() {
    if (alive) {
      ellipseMode(CORNER);
      fill(255, 94, 54);
      strokeWeight(1);
      stroke(255, 51, 0);
      ellipse(x, y, missileWidth, missileHeight);
    }
  }

  // positions the missile near the ships gun and makes it alive
  void launch(float shipX, float shipY) {
    x = shipX - missileWidth / 2;
    y = shipY - 5;
    alive = true;
  }

  // create a bounding box for collision detection
  BoundingBox bbox() {
    return new BoundingBox(x, x + missileWidth,
      y, y + missileHeight);
  }
  
  // check to see if the missile hits an enemy
  boolean hit(Ufo enemy) {
    if (alive && this.bbox().intersectsWith(enemy.bbox())) {
      alive = false; // destroy the missile if there is a hit
      return true;
    } else {
      return false;
    }
  }
}
