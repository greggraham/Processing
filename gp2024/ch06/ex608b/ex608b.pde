// Ex 6-9 larger

void setup() {
  size(600, 600);
}

void draw() {
  background(204);
  translate(mouseX, mouseY);
  scale(mouseX / 60.0);
  rect(-15, -15, 30, 30);
}
