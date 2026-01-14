size(1200, 1200);
int x = 100;
int y = 100;
while (x < 1200) {
  while (y < 1200) {
    circle(x, y, 25);
    y += 100;
  }
  y = 100;
  x += 100;
}
