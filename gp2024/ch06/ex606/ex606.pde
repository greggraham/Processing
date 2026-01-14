// Ex 6-6

float angle = 0;

void setup() {
  size(120, 120);
}

void draw() {
  rotate(angle);
  translate(mouseX, mouseY);
  rect(-15, -15, 30, 30);
  angle += 0.1;
}
