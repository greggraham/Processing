// Invaders for Processing Java, version 3
// by Mr. Graham

PImage bg;
int numAliens = 8;
Ship ship;
Ufo aliens[];
boolean finished = false;
PFont font;
int laserTime = 0;

void setup() {
  size(639, 426);
  bg = loadImage("stars.jpg");
  PImage shipImg = loadImage("ship.png");
  PImage ufoImg = loadImage("saucer.png");
  ship = new Ship(shipImg);
  aliens = new Ufo[numAliens];
  for (int i = 0; i < numAliens; i++) {
    aliens[i] = new Ufo(ufoImg);
  }
  font = loadFont("BritannicBold-48.vlw");
}

void draw() {
  background(0);
  imageMode(CORNER);
  image(bg, 0, 0);

  imageMode(CENTER);
  if (finished && laserTime == 0) {
    // game over screen
    fill(0, 255, 0);
    textFont(font);
    text("Game Over", 209, 204);
  } else {

    // move ship
    ship.move();

    // move ufos
    int aliveCount = 0;
    for (int i = 0; i < numAliens; i++) {
      if (aliens[i].alive) {
        aliveCount++;
        aliens[i].move();
      }
    }
    if (aliveCount <= 0) {
      finished = true;
    }

    // draw ship
    ship.render();

    // draw ufos
    for (int i = 0; i < numAliens; i++) {
      aliens[i].render();
    }
  }
}


void mousePressed() {
  if (!finished) {
    ship.launch();
  }
}
