class Ufo {
  PImage ufo_img;
  float x, y, dx, dy;

  Ufo() {
    ufo_img = loadImage("saucer.png");
    x = width / 2;
    dx = 5;
    y = 50;
    dy = 1;
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

    // random teleport ufo
    if (random(100) < 0.5) {
      x = random(width);
      y = random(height/2);
    }
  }

  void draw() {
    imageMode(CENTER);
    image(ufo_img, x, y);
  }

  float getX() {
    return x;
  }
}
