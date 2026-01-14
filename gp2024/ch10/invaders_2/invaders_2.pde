// Invaders for Processing Java, version 2
// by Mr. Graham

PImage bg;
PImage ship_img;
PImage ufo_img;
float ufo_x, ufo_y, ufo_dx, ufo_dy;
boolean finished = false;
PFont font;
int laserTime = 0;

void setup() {
  size(639, 426);
  bg = loadImage("stars.jpg");
  ship_img = loadImage("ship.png");
  ufo_img = loadImage("saucer.png");
  ufo_x = width / 2;
  ufo_dx = 5;
  ufo_y = 50;
  ufo_dy = 1;
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
    image(ship_img, mouseX, 350);

    // move ufo
    ufo_x += ufo_dx;
    if (ufo_x < 0 || ufo_x > width) {
      ufo_dx = -ufo_dx;
    }
    ufo_y += ufo_dy;
    if (ufo_y < 0 || ufo_y > height/2) {
      ufo_dy = -ufo_dy;
    }
    
    // random teleport ufo
    if (random(100) < 1) {
      ufo_x = random(width);
      ufo_y = random(height/2);
    }
    
    // draw ufo
    image(ufo_img, ufo_x, ufo_y);
    
    // draw laser
    if (laserTime > 0) {
      strokeWeight(5);
      stroke(255, 0, 0);
      line(mouseX, 300, mouseX, 0);
      if (abs(ufo_x - mouseX) < 16) {
        finished = true;
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
