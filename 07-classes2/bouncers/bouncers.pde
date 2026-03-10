// Ex 10-2

int numBs = 200;
float speedRange = 3;
Bouncer[] bs;

void setup() {
  size(640, 480);
  bs = new Bouncer[numBs];
  for (int i = 0; i < numBs; i++) {
    bs[i] = new Bouncer();
    int d = int(random(10, 20));
    bs[i].diameter = d;
    bs[i].x = random(d, width - d);
    bs[i].y = random(d, height - d);
    bs[i].radius = d/2;
    bs[i].c = color(random(256), random(256), random(256));
    bs[i].xSpeed = random(-speedRange, speedRange);
    bs[i].ySpeed = random(-speedRange, speedRange);
  }
}

void draw() {
  background(0);
  for (int i = 0; i < numBs; i++) {
    bs[i].x +=  bs[i].xSpeed;
    if (bs[i].x <  bs[i].radius ||  bs[i].x > width -  bs[i].radius) {
       bs[i].xSpeed = -bs[i].xSpeed;
    }
     bs[i].y +=  bs[i].ySpeed;
    if ( bs[i].y <  bs[i].radius ||  bs[i].y > height -  bs[i].radius) {
       bs[i].ySpeed = -bs[i].ySpeed;
    }
  }  for (int i = 0; i < numBs; i++) {
    fill(bs[i].c);
    ellipse(bs[i].x, bs[i].y, bs[i].diameter, bs[i].diameter);
  }
  
}
