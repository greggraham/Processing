// This class represents an enemy UFO.

class Ufo {

  float x;
  float y;
  float dx;
  float dy;
  boolean alive;
  PImage img;

  // Create a UFO with random position and velocity.
  Ufo(PImage tempImg) {
    x = random(width);
    dx = random(4) + 1;
    y = random(height / 3);
    dy = random(2);
    alive = true;
    img = tempImg;
  }

  // Move the UFO if alive.
  void move() {
    x += dx;
    if (x < 0 || x > width) {
      dx = -dx;
    }
    y += dy;
    if (y < 0 || y > height/2) {
      dy = -dy;
    }
  }

  // Render the UFO if alive.
  void render() {
    if (alive) {
      image(img, x, y);
    }
  }

  BoundingBox bbox() {
    return new BoundingBox(x - img.width / 2, x + img.width / 2, y - img.height / 2, y + img.height / 2);
  }
}
