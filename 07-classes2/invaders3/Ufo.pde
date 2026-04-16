class Ufo {

  float x;
  float y;
  float dx;
  float dy;
  boolean alive;
  PImage img;

  Ufo(PImage tempImg) {
    x = random(width);
    dx = random(4) + 1;
    y = random(height / 3);
    dy = random(2);
    alive = true;
    img = tempImg;
  }

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

  void render() {
    if (alive) {
      image(img, x, y);
    }
  }
  
  BoundingBox bbox() {
    return new BoundingBox(x, x + img.width, y, y + img.height);
  }
}
