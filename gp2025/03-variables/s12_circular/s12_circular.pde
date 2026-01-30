size(480, 480);
float radius = 100.0;
fill(0);
for (float angle = 0; angle < 360; angle += 30) {
  float x = cos(radians(angle)) * radius + width/2;
  float y = sin(radians(angle)) * radius + height/2;
  ellipse(x, y, 40, 40);
}
