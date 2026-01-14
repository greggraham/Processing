size(100, 100);
int x = 0;
int z = 0;
int y = 0;
int a = 0;
while (x < 10) {
  while (z < 10) {
    circle(y, a, 1);
    y += 1;
    z += 1;
  }
  a += 1;
  x += 1;
  y -= 9;
}
