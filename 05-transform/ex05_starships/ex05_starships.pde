size(400, 400);
background(0);
fill(200);
stroke(174, 174, 229 );

for (int i = 0; i < 10; i++) {
  float x = random(width);
  float y = random(height);
  float theta = random(360);

  pushMatrix();
  translate(x, y);
  rotate(radians(theta));
  
  // draw object
  strokeWeight(1);
  ellipse(0, -5, 10, 10);
  strokeWeight(3);
  line(0, 0, 0, 6);
  strokeWeight(2);
  line(0, 5, 5, 5);
  line(0, 5, -5, 5);
  line(5, 2, 5, 12);
  line(-5, 2, -5, 12);
  
  popMatrix();
}
