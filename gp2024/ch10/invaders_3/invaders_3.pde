// Invaders for Processing Java, version 3
// by Mr. Graham

PImage bg;
Ship ship;
Ufo ufo;
Laser laser;
boolean finished = false;
PFont font;

void setup() {
  size(639, 426);
  ship = new Ship();
  ufo = new Ufo();
  laser = new Laser();
  bg = loadImage("stars.jpg");
  font = loadFont("BritannicBold-48.vlw");
}

void draw() {
  background(0);
  imageMode(CORNER);
  image(bg, 0, 0);

  if (finished && !laser.active()) {
    // game over screen
    fill(0, 255, 0);
    textFont(font);
    text("Game Over", 209, 204);
  } else {
    ship.draw();
    float laserX = mouseX;
    laser.draw(laserX);
    if (!finished) {
      finished = laser.checkHit(laserX, ufo);
      ufo.move();
      ufo.draw();
    }
  }
}


void mousePressed() {
  if (!finished) {
    laser.fire();
  }
}
