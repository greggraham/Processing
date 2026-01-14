// Cheese pizza 1

size(1000, 1000);
int diameter = 100;
int radius = diameter/2;
float deg = 0.70710678118 ;

background(#C1A639);
for (int x = 5; x < 1500; x += diameter*1.5) {
  for (int y = 5; y < 1500; y +=diameter*1.5) {
    color c = color(#AB6D24);
    fill(c);
    circle (x, y, diameter*1.2);
    c = color(#F9D63E);
    fill(c);
    circle ( x, y, diameter ) ;
    //slice code
    line(x-(diameter/2), y, x+(diameter/2), y);
    line(x+(radius*cos(45)), y - radius*sin(45) , x-(radius*cos(225)), y-(radius*sin(225)));
    line(x-(radius*deg), y - radius*deg, x+(radius*deg), y + radius*deg);
  }
}
