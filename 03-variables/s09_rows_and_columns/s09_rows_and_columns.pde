// Rows and columns

size(480, 120);
background(0);
noStroke();
for (int y = 0; y <= height; y += 40) {
  fill(255, 140);
  ellipse(0, y, 40, 40);
}
for (int x = 0; x <= width; x += 40) {
  fill(255, 140);
  ellipse(x, 0, 40, 40);
}
