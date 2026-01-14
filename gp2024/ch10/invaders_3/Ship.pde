class Ship {
  PImage ship_img;

  Ship() {
    ship_img = loadImage("ship.png");
  }

  void draw() {
    imageMode(CENTER);
    image(ship_img, mouseX, 350);
  }
}
