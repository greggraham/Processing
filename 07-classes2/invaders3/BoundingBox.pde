class BoundingBox {
  float x1;
  float x2;
  float y1;
  float y2;


  BoundingBox(float tx1, float tx2, float ty1, float ty2) {
    x1 = tx1;
    x2 = tx2;
    y1 = ty1;
    y2 = ty2;
  }
  
  boolean intersectsWith(BoundingBox other) {
    return false;
  }
}
