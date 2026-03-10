// Ants

Ant a1 = new Ant(100, 100);
Ant a2 = new Ant(200, 200);
Ant a3 = new Ant(300, 300);


void setup() {
  size(600, 600);
}

void draw() {
  background(204);
  a1.draw();
  a2.draw();
  a3.draw();
  a1.move();
  a2.move();
  a3.move();

}
