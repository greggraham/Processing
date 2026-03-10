// Ants phase 2, by Mr. Graham

int numAnts = 100;

float[] xs = new float[numAnts];
float[] ys = new float[numAnts];
float[] angles = new float[numAnts];

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
  for (int i = 0; i < numAnts; i++) {
    xs[i] = random(0, width);
    ys[i] = random(0, height);
    angles[i] = random(-PI, PI);
  }
}

void draw() {
  background(204);
  for (int i = 0; i < numAnts; i++) {
    drawAnt(xs[i], ys[i], angles[i]);

    xs[i] += speed * cos(angles[i] - PI/2);
    ys[i] += speed * sin(angles[i] - PI/2);
    if (xs[i] < 0 || xs[i] > width || ys[i] < 0 || ys[i] > width) {
      angles[i] += PI;
    } else {
      angles[i] += random(-0.2, 0.2);
    }
  }
}
