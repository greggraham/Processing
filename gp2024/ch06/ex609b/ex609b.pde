// Ex 6-9 larger

void setup() {
  size(600, 600);
}

void draw() {
  background(204);
  translate(mouseX, mouseY);
  float scalar = mouseX / 60.0;
  scale(scalar);
  strokeWeight(1.0 / scalar);
  rect(-15, -15, 30, 30);
}
