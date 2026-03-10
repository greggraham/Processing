// Ants v2 with array

int numAnts = 100;
Ant[] ants = new Ant[numAnts];

void setup() {
  size(600, 600);
  for (int i = 0; i < numAnts; i++) {
    ants[i] = new Ant(random(0, width), random(0, height));
  }
}

void draw() {
  background(204);
  for (int i = 0; i < numAnts; i++) {
    ants[i].draw();
    ants[i].move();
  }
}
