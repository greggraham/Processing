Shape square = new Shape();
Shape bar = new Shape();
Shape el = new Shape();

void setup() {
  BlockPattern square1 = new BlockPattern(new Point(0, 0), new Point(0, 1), new Point(1, 0), new Point(1, 1));
  square.addPattern(square1);

  BlockPattern bar1 = new BlockPattern(new Point(0, 1), new Point(1, 1), new Point(2, 1), new Point(3, 1));
  bar.addPattern(bar1);
  BlockPattern bar2 = new BlockPattern(new Point(2, 0), new Point(2, 1), new Point(2, 2), new Point(2, 3));
  bar.addPattern(bar2);
  BlockPattern bar3 = new BlockPattern(new Point(0, 2), new Point(1, 2), new Point(2, 2), new Point(3, 2));
  bar.addPattern(bar3);
  BlockPattern bar4 = new BlockPattern(new Point(1, 0), new Point(1, 1), new Point(1, 2), new Point(1, 3));
  bar.addPattern(bar4);
}
