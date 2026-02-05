// Lines

void setup() {
  size(480, 480);
  strokeWeight(10);
  stroke(0, 102);
  frameRate(5);
}

void draw() {
  background(210);
  line(mouseX, mouseY, pmouseX, pmouseY);
}
