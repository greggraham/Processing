size(400, 400);

for (int x = 0; x < width; x++) {
  int blue = int((x * 256) / width);
  for (int y = 0; y < height; y++) {
    int green = int((y * 256) / height);
    stroke(0, green, blue);
    point(x, y);
  }
}
