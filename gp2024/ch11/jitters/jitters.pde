// Ex 10-2

int numJbs = 50;
JitterBug[] jbs;

void setup() {
  size(480, 120);
  jbs = new JitterBug[numJbs];
  for (int i = 0; i < numJbs; i++) {
    float x = random(width);
    float y = random(height);
    int d = int(random(10, 20));
    jbs[i] = new JitterBug(x, y, d);
  }
}

void draw() {
  for (int i = 0; i < numJbs; i++) {
    jbs[i].move();
  }
  for (int i = 0; i < numJbs; i++) {
    jbs[i].display();
  }
  
}
