// Ex 10-2

int numBs = 150;
Bouncer[] bs;

void setup() {
  size(480, 120);
  bs = new Bouncer[numBs];
  for (int i = 0; i < numBs; i++) {
    int d = int(random(10, 20));
    float x = random(d, width - d);
    float y = random(d, height - d);
    bs[i] = new Bouncer(x, y, d);
  }
}

void draw() {
  for (int i = 0; i < numBs; i++) {
    bs[i].move();
  }
  for (int i = 0; i < numBs; i++) {
    bs[i].display();
  }
  
}
