class Ant {

  float x;
  float y;
  float a;
  float speed = 2.0;

  Ant(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    a = random(-PI, PI);
  }

  void draw() {
    pushMatrix();
    translate(x, y);
    rotate(a);
    fill(0);

    // Thorax and legs
    ellipse(0, 0, 2, 3);
    line(-5, -2, 5, 2);
    line(-5, 0, 5, 0);
    line(-5, 2, 5, -2);

    // Head and antennae
    ellipse(0, -3.5, 3, 4);
    line(-1, -5, -2, -7);
    line(1, -5, 2, -7);

    // Abdomen
    ellipse(0, 5, 4, 7);

    popMatrix();
  }

  void move() {
    x += speed * cos(a - PI/2);
    y += speed * sin(a - PI/2);
    if (x < 0 || x > width || y < 0 || y > width) {
      a += PI;
    } else {
      a += random(-0.2, 0.2);
    }
  }
}
