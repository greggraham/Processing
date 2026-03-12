// Ants phase 3, by Mr. Graham

int numAnts = 100;

Ant[] ants = new Ant[numAnts];

float speed = 2;

void drawAnt(Ant a) {
  // Transform
  pushMatrix();
  translate(a.x, a.y);
  rotate(a.angle);
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

void moveAnt(Ant a) {
    a.x += speed * cos(a.angle - PI/2);
    a.y += speed * sin(a.angle - PI/2);
    if (a.x < 0 || a.x > width || a.y < 0 || a.y > width) {
      a.angle += PI;
    } else {
      a.angle += random(-0.2, 0.2);
    }
}

void setup() {
  size(600, 600);
  for (int i = 0; i < numAnts; i++) {
    ants[i] = new Ant();
    Ant a = ants[i];
    a.x = random(0, width);
    a.y = random(0, height);
    a.angle = random(-PI, PI);
  }
}

void draw() {
  background(204);
  for (int i = 0; i < numAnts; i++) {
    moveAnt(ants[i]);
    drawAnt(ants[i]);
  }
}
