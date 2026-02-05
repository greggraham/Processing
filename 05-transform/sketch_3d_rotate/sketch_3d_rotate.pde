float theta = 0.0;

void setup() {
  size(200, 200, P3D);
}

void draw() {
  background(100);
  rectMode(CENTER);
  fill(51);
  stroke(255);

  translate(100, 100, 0);
  rotateX(theta);
  rect(0, 0, 100, 100);
  theta += 0.05;
}
