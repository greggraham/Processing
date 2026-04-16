class Ufo {
  float x;
  float y;
  float dx;
  float dy;
  boolean alive;
  PImage ufoImg;

  Ufo() {
    ufoImg = loadImage("saucer.png");
    x = random(width);
    dx = random(4) + 1;
    y = random(height / 3);
    dy = random(2);
    alive = true;
  }

  void update() {
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
    image(ufoImg, x, y);
  }
}
