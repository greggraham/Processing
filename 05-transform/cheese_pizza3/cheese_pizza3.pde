// Cheese Pizza 3

int diameter = 100;
int radius = diameter/2;
float deg = 0.70710678118 ;

void setup() {
  size(600, 600);
  noCursor();
}

void draw() {
  background(#C1A639);
  translate(mouseX, mouseY);
  color c = color(#AB6D24);
  fill (c);
  circle(0, 0, diameter*1.2);
  c = color(#F9D63E);
  fill (c);
  circle (0, 0, diameter ) ;
  //slice code
  line(-diameter/2, 0, diameter/2, 0);
  line(radius*cos(45), -radius*sin(45), -radius*cos(225), -radius*sin(225));
  line(-radius*deg, -radius*deg, radius*deg, radius*deg);
}
