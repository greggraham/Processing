float[] xs;
float[] ys;
float dx;
float dy;
int numStars = 1000;

void setup() {
  size(1000, 800);
  xs = new float[numStars];
  ys = new float[numStars];
  for (int i = 0; i < numStars; i++) {
    xs[i] = random(0, width);
    ys[i] = random(0, height);
  }
  dx = random(-5, 5);
  dy = random(-5, 5);
  stroke(255);
}

void draw() {
  background(0);
  for (int i = 0; i < numStars; i++) {
    // Draw a star
    circle(xs[i], ys[i], 3);
    
    // Move the star
    xs[i] += dx;
    ys[i] += dy;
    
    // Wrap around
    if (xs[i] > width) {
      xs[i] = 0;
    } else if (xs[i] < 0) {
      xs[i] = width;
    }
    if (ys[i] > height) {
      ys[i] = 0;
    } else if (ys[i] < 0) {
      ys[i] = height;
    }
  }
}

void mouseClicked() {
  dx = random(-5, 5);
  dy = random(-5, 5);
}
