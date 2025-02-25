float startAngle;
float endAngle;
float biteSize;

void setup() {
  size(410, 200);
}

void draw() {
  background(0);
  fill(255, 255, 0);
  // Update start and stop angles.
  biteSize = PI / 16; //smaller the denominator, bigger the bite
  startAngle = biteSize * sin(frameCount * 0.1) + biteSize;
  endAngle = TWO_PI - startAngle;
  // Draw the arc.
  arc(50, 50, 80, 80, startAngle, endAngle, PIE);
  
  pushMatrix();
  translate(150,50);
  rotate(radians(90));
  arc(0, 0, 80, 80, startAngle, endAngle, PIE);
  popMatrix();
  
  pushMatrix();
  translate(250,50);
  rotate(radians(180));
  arc(0, 0, 80, 80, startAngle, endAngle, PIE);
  popMatrix();

  pushMatrix();
  translate(350,50);
  rotate(radians(270));
  arc(0, 0, 80, 80, startAngle, endAngle, PIE);
  popMatrix();
}
