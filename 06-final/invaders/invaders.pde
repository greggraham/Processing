// Invaders for Processing Java, version 2
// by Mr. Graham

PImage bg;
PImage shipImg;
PImage ufoImg;
int numAliens = 8;
Ufo aliens[];
boolean finished = false;
PFont font;
int laserTime = 0;

void setup() {
  size(639, 426);
  bg = loadImage("stars.jpg");
  shipImg = loadImage("ship.png");
  ufoImg = loadImage("saucer.png");
  aliens = new Ufo[numAliens];
  for (int i = 0; i < numAliens; i++) {
    aliens[i] = new Ufo();
    aliens[i].x = random(width);
    aliens[i].dx = random(4) + 1;
    aliens[i].y = random(height / 3);
    aliens[i].dy = random(2);
    aliens[i].alive = true;
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
        aliens[i].x += aliens[i].dx;
        if (aliens[i].x < 0 || aliens[i].x > width) {
          aliens[i].dx = -aliens[i].dx;
        }
        aliens[i].y += aliens[i].dy;
        if (aliens[i].y < 0 || aliens[i].y > height/2) {
          aliens[i].dy = -aliens[i].dy;
        }
      }
    }
    if (aliveCount <= 0) {
      finished = true;
    }

    // draw ufos
    for (int i = 0; i < numAliens; i++) {
      if (aliens[i].alive) {
        image(ufoImg, aliens[i].x, aliens[i].y);
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
