// Ant, by Mr. Graham

float x = 100;
float y = 100;
float angle = 0;
float speed = 2;

void setup() {
  size(600, 600);
}

void draw() {
  background(204);
  
  // Transforms
  pushMatrix();
  translate(x, y);
  rotate(angle);
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

  // Move
  x += speed * cos(angle - PI/2);
  y += speed * sin(angle - PI/2);
  if (x < 0 || x > width || y < 0 || y > width) {
    angle += PI;
  } else {
    angle += random(-0.2, 0.2);
  }
}
