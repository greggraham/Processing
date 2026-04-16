// Invaders with methods
// by Mr. Graham

PImage bg;
PImage shipImg;
int numAliens = 8;
Ufo aliens[];
boolean finished = false;
PFont font;
int laserTime = 0;

void setup() {
  size(639, 426);
  bg = loadImage("stars.jpg");
  shipImg = loadImage("ship.png");
  aliens = new Ufo[numAliens];
  for (int i = 0; i < numAliens; i++) {
    aliens[i] = new Ufo();
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
    // draw ship
    image(shipImg, mouseX, 350);

    // move ufos
    int aliveCount = 0;
    for (int i = 0; i < numAliens; i++) {
      if (aliens[i].alive) {
        aliveCount++;
        aliens[i].update();
      }
    }
    if (aliveCount <= 0) {
      finished = true;
    }

    // draw ufos
    for (int i = 0; i < numAliens; i++) {
      if (aliens[i].alive) {
        aliens[i].render();
      }
    }
    
    // draw laser
    if (laserTime > 0) {
      strokeWeight(5);
      stroke(255, 0, 0);
      line(mouseX, 335, mouseX, 0);
      
      // check for collisions
      for (int i = 0; i < numAliens; i++) {
        if (abs(aliens[i].x - mouseX) < 16) {
          aliens[i].alive = false;
        }
      }
      laserTime--;
    }
  }
}


void mousePressed() {
  if (!finished) {
    laserTime = 5;
  }
}
