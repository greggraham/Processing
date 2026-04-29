class Shape {
  BlockPattern[] patterns = new BlockPattern[4];
  int numPatterns = 0;
  int currentPattern = 0;
  int blockSize;

  Shape(int blockSize) {
    this.blockSize = blockSize;
  }

  void addPattern(BlockPattern p) {
    patterns[numPatterns] = p;
    numPatterns++;
  }

  void randomSpin() {
    currentPattern = (int) random(numPatterns);
  }

  void rotateLeft() {
    currentPattern--;
    if (currentPattern < 0) {
      currentPattern = numPatterns - 1;
    }
  }

  void rotateRight() {
    currentPattern++;
    if (currentPattern >= numPatterns) {
      currentPattern = 0;
    }
  }

  void render(int x, int y) {
    Point[] ps = patterns[currentPattern].getPoints();
    for (int i = 0; i < 4; i++) {
      square((x + ps[i].x) * blockSize, (y + ps[i].y) * blockSize, blockSize);
    }
  }
}
