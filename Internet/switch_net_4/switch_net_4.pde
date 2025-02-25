final class SWNet4 {
  final int vecLen;
  final int depth;
  final float scale;
  final float[] params;
  final float[] flips;
  SWNet4(int vecLen, int depth) {
    this.vecLen = vecLen;
    this.depth = depth;
    scale = 1f / sqrt(vecLen);
    params = new float[8 * vecLen * depth];
    flips = new float[vecLen];
    for (int i = 0; i < vecLen; i++) {
      flips[i] = sin(i * 1.895) < 0 ? -scale : scale;
    }
    for (int i = 0, j=0; i < params.length; i += 8) {
      params[i+j] = scale;
      params[i+j + 4] = scale;
      j=(j+1)&3;
    }
  }
  void recall(float[] result, float[] input) {
    for (int i = 0; i < vecLen; i++) {
      result[i] = input[i] * flips[i];
    }
    int paIdx = 0;
    for (int i = 0; i < depth; i++) {
      wht(result);
      for (int j = 0; j < vecLen; j += 4) {
        float x, a, b, c, d;
        x= result[j];
        if (x < 0) {
          a = x * this.params[paIdx];
          b = x * this.params[paIdx + 1];
          c = x * this.params[paIdx + 2];
          d = x * this.params[paIdx + 3];
        } else {
          a = x * this.params[paIdx + 4];
          b = x * this.params[paIdx + 5];
          c = x * this.params[paIdx + 6];
          d = x * this.params[paIdx + 7];
        }
        paIdx += 8;
        x = result[j + 1];
        if (x < 0) {
          a += x * this.params[paIdx];
          b += x * this.params[paIdx + 1];
          c += x * this.params[paIdx + 2];
          d += x * this.params[paIdx + 3];
        } else {
          a += x * this.params[paIdx + 4];
          b += x * this.params[paIdx + 5];
          c += x * this.params[paIdx + 6];
          d += x * this.params[paIdx + 7];
        }
        paIdx += 8;
        x = result[j + 2];
        if (x < 0) {
          a += x * this.params[paIdx];
          b += x * this.params[paIdx + 1];
          c += x * this.params[paIdx + 2];
          d += x * this.params[paIdx + 3];
        } else {
          a += x * this.params[paIdx + 4];
          b += x * this.params[paIdx + 5];
          c += x * this.params[paIdx + 6];
          d += x * this.params[paIdx + 7];
        }
        paIdx += 8;
        x = result[j + 3];
        if (x < 0) {
          a += x * this.params[paIdx];
          b += x * this.params[paIdx + 1];
          c += x * this.params[paIdx + 2];
          d += x * this.params[paIdx + 3];
        } else {
          a += x * this.params[paIdx + 4];
          b += x * this.params[paIdx + 5];
          c += x * this.params[paIdx + 6];
          d += x * this.params[paIdx + 7];
        }
        paIdx += 8;
        result[j] = a;
        result[j + 1] = b;
        result[j + 2] = c;
        result[j + 3] = d;
      }
    }
    wht(result);
  }
}
// Fast Walsh Hadamard Transform
void wht(float[] vec) {
  final int n = vec.length;
  for (int i=0; i<n; i+=8) {
    float a=vec[i];
    float b=vec[i+1];
    float c=vec[i+2];
    float d=vec[i+3];
    float e=vec[i+4];
    float f=vec[i+5];
    float g=vec[i+6];
    float h=vec[i+7];
    float t=a;
    a=a+b;
    b=t-b;
    t=c;
    c=c+d;
    d=t-d;
    t=a;
    a=a+c;
    c=t-c;
    t=b;
    b=b+d;
    d=t-d;
    t=e;
    e=e+f;
    f=t-f;
    t=g;
    g=g+h;
    h=t-h;
    t=e;
    e=e+g;
    g=t-g;
    t=f;
    f=f+h;
    h=t-h;
    t=a;
    a=a+e;
    e=t-e;
    t=b;
    b=b+f;
    f=t-f;
    t=c;
    c=c+g;
    g=t-g;
    t=d;
    d=d+h;
    h=t-h;
    vec[i]=a;
    vec[i+1]=b;
    vec[i+2]=c;
    vec[i+3]=d;
    vec[i+4]=e;
    vec[i+5]=f;
    vec[i+6]=g;
    vec[i+7]=h;
  }
  int hs = 8;
  while (hs < n) {
    int i = 0;
    while (i < n) {
      final int j = i + hs;  // final here is good hint to hotspot
      while (i < j) {
        float a = vec[i];
        float b = vec[i + hs];
        vec[i] = a + b;
        vec[i + hs] = a - b;
        i += 1;
      }
      i += hs;
    }
    hs += hs;
  }
}

// Sum of squared difference cost
float costL2(float[] vec, float[] tar) {
  float cost = 0;
  for (int i = 0; i < vec.length; i++) {
    float e = vec[i] - tar[i];
    cost += e * e;
  }
  return cost;
}

class Mutator {
  float[] previous;
  int[] pIdx;
  float limit;
  Rnd256 rng;

  Mutator(int size, float limit) {
    previous = new float[size];
    pIdx = new int[size];
    this.limit = limit;
    rng=new Rnd256();
  }
  void mutate(float[] vec) {
    for (int i = 0; i < previous.length; i++) {
      int rpos = rng.nextIntEx(vec.length);
      float v = vec[rpos];
      pIdx[i] = rpos;
      previous[i] = v;
      float m = limit * rng.mutate();
      float vm = v + m;
      if (vm >= this.limit) vm = v;
      if (vm <= -this.limit) vm = v;
      vec[rpos] = vm;
    }
  }
  void undo(float[] vec) {
    for (int i = previous.length - 1; i >= 0; i--) {
      vec[pIdx[i]] = previous[i];
    }
  }
}

final class Rnd256 {
  final long PHI = 0x9E3779B97F4A7C15L;
  private long s0, s1, s2, s3;
  Rnd256() {
    this(System.nanoTime());
  }
  Rnd256(long seed) {
    s0=staffordMix13(seed+PHI);
    s1=staffordMix13(seed+2*PHI);
    s2=staffordMix13(seed+3*PHI);
    s3=staffordMix13(seed+4*PHI);
  }
  long nextLong() {
    long result = s1;
    result = Long.rotateLeft(result + (result << 2), 7);
    result += result << 3;
    final long t = s1 << 17;
    s2 ^= s0;
    s3 ^= s1;
    s1 ^= s2;
    s0 ^= s3;
    s2 ^= t;
    s3 = Long.rotateLeft(s3, 45);
    return result;
  }
  float nextFloat() {
    return (nextLong() >>> 40) * 0x1.0p-24f;
  }
  boolean nextBoolean() {
    return nextLong() < 0;
  }
  int nextIntEx(int ex) {
    long r=(nextLong()>>>32)*ex;
    return (int)(r>>>32);
  }
  int nextIntInc(int inc) {
    long r=(nextLong()>>>32)*(inc+1L);
    return (int)(r>>>32);
  }
  float mutate() {
    int r=(int)nextLong();
    r &=0xbfff_ffff;
    r |=0x3000_0000;
    return Float.intBitsToFloat(r);
  }
  long staffordMix13(long z) {
    z = (z ^ (z >>> 30)) * 0xBF58476D1CE4E5B9L;
    z = (z ^ (z >>> 27)) * 0x94D049BB133111EBL;
    return z ^ (z >>> 31);
  }
}

// Test with Lissajous curves
color c1;
float[][] ex;
float[] work = new float[256];
float parentCost = Float.POSITIVE_INFINITY;
SWNet4 parentNet;
Mutator mut;

void setup() {
  size(400, 400);
  parentNet = new SWNet4(256, 4);
  mut = new Mutator(15, parentNet.scale);
  c1 = color(0xff,0xd7,00);
  ex=new float[8][256];
  for (int i = 0; i < 127; i++) {
    // Training data
    float t = (i * 2 * PI) / 127;
    ex[0][2 * i] = sin(t);
    ex[0][2 * i + 1] = sin(2 * t);
    ex[1][2 * i] = sin(2 * t);
    ex[1][2 * i + 1] = sin(t);
    ex[2][2 * i] = sin(2 * t);
    ex[2][2 * i + 1] = sin(3 * t);
    ex[3][2 * i] = sin(3 * t);
    ex[3][2 * i + 1] = sin(2 * t);
    ex[4][2 * i] = sin(3 * t);
    ex[4][2 * i + 1] = sin(4 * t);
    ex[5][2 * i] = sin(4 * t);
    ex[5][2 * i + 1] = sin(3 * t);
    ex[6][2 * i] = sin(2 * t);
    ex[6][2 * i + 1] = sin(5 * t);
    ex[7][2 * i] = sin(5 * t);
    ex[7][2 * i + 1] = sin(2 * t);
  }
  textSize(16);
}

void draw() {
  background(0);
  loadPixels();
  for (int i = 0; i < 100; i++) {
    mut.mutate(parentNet.params);
    float cost = 0;
    for (int j = 0; j < 8; j++) {
      parentNet.recall(work, ex[j]);
      cost += costL2(work, ex[j]); // autoassociate
    }
    if (cost < parentCost) {
      parentCost = cost;
    } else {
      mut.undo(parentNet.params);
    }
  }
  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 255; j += 2) {
      set(25 + i * 40 + int(18 * ex[i][j]), 44 + int(18 * ex[i][j + 1]),c1);
    }
  }
  for (int i = 0; i < 8; i++) {
    parentNet.recall(work, ex[i]);
    for (int j = 0; j < 255; j += 2) {
      set(25 + i * 40 +int( 18 * work[j]), 104 + int(18 * work[j + 1]),c1);
    }
  }
  //updatePixels();
  text("Training Data", 5, 20);
  text("Autoassociative recall", 5, 80);
  text("Iterations: " + frameCount, 5, 150);
  text("Cost: " + parentCost, 5, 170);
}
