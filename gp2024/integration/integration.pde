int valueCount = 100;

float[] xsAbove = new float[valueCount];
float[] ysAbove = new float[valueCount];
float[] xsBelow = new float[valueCount];
float[] ysBelow = new float[valueCount];

int aboveIndex = 0;
int belowIndex = 0;

void setup() {
  for (int i = 0; i < valueCount; i++) {
    float x = random(100);
    float y = random(100);
    if (y > 50) {
      xsAbove[aboveIndex] = x;
      ysAbove[aboveIndex] = y;
      aboveIndex++;
    } else {
      xsBelow[belowIndex] = x;
      ysBelow[belowIndex] = y;
      belowIndex++;
    }
  }

  println("Above points");
  for (int i = 0; i < aboveIndex; i++) {
    println(xsAbove[i], ysAbove[i]);
  }

  println("Below points");
  for (int i = 0; i < belowIndex; i++) {
    println(xsBelow[i], ysBelow[i]);
  }
}
