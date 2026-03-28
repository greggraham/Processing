// Ants phase 1, by Mr. Graham

float a1x = 100;
float a1y = 100;
float a1angle = 0;
float a2x = 200;
float a2y = 200;
float a2angle = 0;
float a3x = 300;
float a3y = 300;
float a3angle = 0;

float speed = 2;

void drawAnt(float x, float y, float a) {
  // Transform
  pushMatrix();
  translate(x, y);
  rotate(a);
  fill(0);

  // Thorax and legs
  ellipse(0, 0, 2, 3);
  line(-5, -2, 5, 2);
  line(-5, 0, 5, 0);
  line(-5, 2, 5, -2);

  // Head and antennae
  ellipse(0, -3.5, 3, 4);
  line(-1, -5, -2, -7);
  line(1, -5, 2, -7);

  // Abdomen
  ellipse(0, 5, 4, 7);

  popMatrix();
}

void setup() {
  size(600, 600);
}

void draw() {
  background(204);
  drawAnt(a1x, a1y, a1angle);
  drawAnt(a2x, a2y, a2angle);
  drawAnt(a3x, a3y, a3angle);

  a1x += speed * cos(a1angle - PI/2);
  a1y += speed * sin(a1angle - PI/2);
  if (a1x < 0 || a1x > width || a1y < 0 || a1y > width) {
    a1angle += PI;
  } else {
    a1angle += random(-0.2, 0.2);
  }

  a2x += speed * cos(a2angle - PI/2);
  a2y += speed * sin(a2angle - PI/2);
  if (a2x < 0 || a2x > width || a2y < 0 || a2y > width) {
    a2angle += PI;
  } else {
    a2angle += random(-0.2, 0.2);
  }

  a3x += speed * cos(a3angle - PI/2);
  a3y += speed * sin(a3angle - PI/2);
  if (a3x < 0 || a3x > width || a3y < 0 || a3y > width) {
    a3angle += PI;
  } else {
    a3angle += random(-0.2, 0.2);
  }
}
