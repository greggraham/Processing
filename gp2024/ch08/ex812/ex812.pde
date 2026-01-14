// Ex 8-12 Sine values

float angle = 0;

void draw() {
  float sinval = sin(angle);
  println(angle, sinval);
  float gray = map(sinval, -1, 1, 0, 255);
  background(gray);
  angle += 0.1;
}
