// Function call with return value example

void setup() {
  size(200, 200);
}

void draw() {
  background(100);
  float y = triple(45);
  line(0, 0, triple(mouseX), y);
}

float triple(float x) {
  return x * 3;
}
