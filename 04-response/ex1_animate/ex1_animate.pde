// Animation basics
int x = 0;

void setup() {
  size(600, 100);
  println("Starting...");
  frameRate(1);
}

void draw() {
  println("Drawing", frameCount);
  background(200);
  circle(x, height/2, 50);
  x += 10;
}
