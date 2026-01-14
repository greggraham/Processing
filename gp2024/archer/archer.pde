size(1000, 1000);
int x = 125;
int y = 125;
while (y <= 900) {
  while (x <= 900) {
    circle(x, y, 50);
    x += 50;
    x += 300/9;
  }
//  x = 125;
  y += 50;
  y += 300/9;
}
