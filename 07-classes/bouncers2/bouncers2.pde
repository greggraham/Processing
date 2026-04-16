// Bouncers with methods

int numBs = 200;
float speedRange = 3;
Bouncer[] bs;

void setup() {
  size(640, 480);
  bs = new Bouncer[numBs];
  for (int i = 0; i < numBs; i++) {
    bs[i] = new Bouncer();
  }
}

void draw() {
  background(0);
  for (int i = 0; i < numBs; i++) {
    bs[i].update();
  }
  for (int i = 0; i < numBs; i++) {
    bs[i].render();
  }
  
}
