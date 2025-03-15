PImage ship;

size(400, 400);
background(0);
ship = loadImage("enterprise.png");
imageMode(CENTER);

for (int i = 0; i < 10; i++) {
  float x = random(width);
  float y = random(height);
  float theta = random(360);

  pushMatrix();
  translate(x, y);
  rotate(radians(theta));
  
  // draw object
  image(ship, 0, 0);
  
  popMatrix();
}
