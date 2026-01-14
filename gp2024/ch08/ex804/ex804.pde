// Ex 8-4 Wrap around

int radius = 40;
float x = -radius;
float speed = 0.5;

void setup() {
  size(240, 150);
  ellipseMode(RADIUS);
}

void draw() {
  background(0);
  x += speed;
  if (x > width+radius) {
    x = -radius;
  }
  arc(x, 60, radius, radius, 0.52, 5.76);
}
