int blockSize = 20;
int bx = 0;
int by = 0;
int maxX;
int maxY;

Shape square = new Shape(blockSize);
Shape bar = new Shape(blockSize);
//Shape el = new Shape(blockSize);

Shape moving;

void setup() {
  size(400, 400);
  maxX = (int) width / blockSize - 4;
  maxY = (int) height / blockSize - 4;
  
  BlockPattern square1 = new BlockPattern(new Point(0, 0), new Point(0, 1), new Point(1, 0), new Point(1, 1));
  square.addPattern(square1);

  BlockPattern bar1 = new BlockPattern(new Point(0, 1), new Point(1, 1), new Point(2, 1), new Point(3, 1));
  bar.addPattern(bar1);
  BlockPattern bar2 = new BlockPattern(new Point(2, 0), new Point(2, 1), new Point(2, 2), new Point(2, 3));
  bar.addPattern(bar2);
  BlockPattern bar3 = new BlockPattern(new Point(0, 2), new Point(1, 2), new Point(2, 2), new Point(3, 2));
  bar.addPattern(bar3);
  BlockPattern bar4 = new BlockPattern(new Point(1, 0), new Point(1, 1), new Point(1, 2), new Point(1, 3));
  bar.addPattern(bar4);
  
  moving = bar;
  moving.randomSpin();
}

void draw() {
  background(#A0F8FF);
  moving.render(bx, by);
}

void keyPressed() {
  if (key == 'w') {
    by--;
    if (by < 0) {
      by = 0;
    }
  } else if (key == 'a') {
    bx--;
    if (bx < 0) {
      bx = 0;
    }
  } else if (key == 's') {
    by++;
    if (by > maxY) {
      by = maxY;
    }
  } else if (key == 'd') {
    bx++;
    if (bx > maxX) {
      bx = maxX;
    }
  } else if (key == CODED) {
    if (keyCode == LEFT) {
      moving.rotateLeft();
    } else if (keyCode == RIGHT) {
      moving.rotateRight();
    }
  }
}
