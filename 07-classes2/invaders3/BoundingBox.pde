// This class is used for collision detection. The objects to be checked
// create bounding boxes based on their position and size, and this checks
// to see if they intersect.

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
    // The boxes intersect if there is an overlap on both the X and Y axes.
    // We check if Box A is NOT entirely to the left, right, above, or below Box B.
    return (this.x1 < other.x2 &&
      this.x2 > other.x1 &&
      this.y1 < other.y2 &&
      this.y2 > other.y1);
  }
}
