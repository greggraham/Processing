class Ship {
  
  PImage img;
  
  Ship(PImage tempImg) {
    img = tempImg;
  }
  
  void render() {
    image(img, mouseX, 350);
  }
}
