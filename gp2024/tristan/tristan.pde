size(100, 100);
int x = 5;
int y = 5;
while (y < 105) {
  while (x < 105) {
    circle(x, y, 10);
    x += 10;
  }
  if (x == 105) {
    x -= 100;
    y += 10;
  }
}
