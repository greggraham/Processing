PFont impactFont;
int starCount = 200;
float speed = 0.5;
float xs[] = new float[starCount];
float ys[] = new float[starCount];
float dx[] = new float[starCount];
float dy[] = new float[starCount];
float ax[] = new float[starCount];
float ay[] = new float[starCount];
float cx, cy;
float spawnOffset = 50;
float accel = 0.1;
float size = 1.0;

void setup() {
  size(600, 600);
  impactFont = loadFont("Impact-48.vlw");
  cx = width / 2;
  cy = height / 2;
  for (int i = 0; i < starCount; i++) {
    xs[i] = random(0, width);
    ys[i] = random(0, height);
    float d = dist(xs[i], ys[i], cx, cy);
    dx[i] = speed * (xs[i] - cx) / d;
    dy[i] = speed * (ys[i] - cy) / d;
    ax[i] = dx[i] * accel;
    ay[i] = dy[i] * accel;
  }

}

void draw() {
  background(0);
  stroke(255);
  fill(255);
  for (int i = 0; i < starCount; i++) {
    ellipse(xs[i], ys[i], size * dx[i], size * dy[i]);
    xs[i] += dx[i];
    ys[i] += dy[i];
    dx[i] += ax[i];
    dy[i] += ay[i];
    if (xs[i] > width || xs[i] < 0 || ys[i] > height || ys[i] < 0) {
      xs[i] = random(cx - spawnOffset, cx + spawnOffset);
      ys[i] = random(cy - spawnOffset, cy + spawnOffset);
      float d = dist(xs[i], ys[i], cx, cy);
      dx[i] = speed * (xs[i] - cx) / d;
      dy[i] = speed * (ys[i] - cy) / d;
      ax[i] = dx[i] * accel;
      ay[i] = dy[i] * accel;
    }
  }
  fill(#51D4FA);
  textFont(impactFont);
  text("To boldly go where", 30, 260);
  text("no man has gone before.", 30, 340);
}
