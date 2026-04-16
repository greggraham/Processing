// This class represents the player's ship.

class Ship {

  int numMissiles = 4;
  PImage img;
  Missile missiles[];
  int nextMissile = 0;
  float xPos;
  float yPos = 350;

  // The constructor creates the ship object and a set of missiles.
  // Note that the finite size of the missiles array indicates the number of missiles that
  // can be sustained in flight. Shooting more missiles will cause the destruction of earlier
  // missiles. This keeps the player from filling the screen with missiles.
  Ship(PImage tempImg) {
    img = tempImg;
    missiles = new Missile[4];
    for (int i = 0; i < numMissiles; i++) {
      missiles[i] = new Missile();
    }
  }

  // Move the ship and all of the missiles.
  void move() {
    xPos = mouseX;
    for (int i = 0; i < numMissiles; i++) {
      missiles[i].move();
    }
  }

  // Render the ship and all of the missiles.
  void render() {
    image(img, xPos, yPos);
    for (int i = 0; i < numMissiles; i++) {
      missiles[i].render();
    }
  }

  // Launch a missile. Note that it cycles through the missile array.
  void launch() {
    missiles[nextMissile].launch(xPos, yPos);
    nextMissile++;
    if (nextMissile >= numMissiles) {
      nextMissile = 0;
    }
  }

  // Check to see if any of the missiles hit a particular enemy.
  boolean hit(Ufo enemy) {
    for (int i = 0; i < numMissiles; i++) {
      if (missiles[i].hit(enemy)) {
        return true;
      }
    }
    return false;
  }
}
