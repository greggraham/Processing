class Ship {
  
  int numMissiles = 4;
  PImage img;
  Missile missiles[];
  int nextMissile = 0;
  float xPos;
  float yPos = 350;
  
  Ship(PImage tempImg) {
    img = tempImg;
    missiles = new Missile[4];
    for (int i = 0; i < numMissiles; i++) {
      missiles[i] = new Missile();
    }
  }
  
  void move() {
    xPos = mouseX;
    for (int i = 0; i < numMissiles; i++) {
      missiles[i].move();
    }
  }
  
  void render() {
    image(img, xPos, yPos);
     for (int i = 0; i < numMissiles; i++) {
      missiles[i].render();
    }   
  }
  
  void launch() {
    missiles[nextMissile].launch(xPos, yPos);
    nextMissile++;
    if (nextMissile >= numMissiles) {
      nextMissile = 0;
    }
  }
}
