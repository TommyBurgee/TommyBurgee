// class

class Bullet {

  // vars for bullets

  int bulletX;
  int bulletY;
  int bulletD;
PImage pew;
  color bulletC;

  // speed of bullet
  int bulletSpeed;

  // hitbox vars
  int topBound;
  int bottomBound;
  int leftBound;
  int rightBound;

  boolean isMovingUp;
  boolean isMovingDown;
  boolean isMovingRight;
  boolean isMovingLeft;
  
  
  
    boolean isDead = false;


  // constructor function
  Bullet (int tempX, int tempY, int tempD, color tempC, boolean tempisMovingUp, boolean tempisMovingDown, boolean tempisMovingRight, boolean tempisMovingLeft) {
    bulletX = tempX;
    bulletY = tempY;
    bulletD = tempD;
    bulletC = (#FF1C00);

    isMovingUp = tempisMovingUp;
    isMovingDown = tempisMovingDown;
    isMovingRight = tempisMovingRight;
    isMovingLeft = tempisMovingLeft;
//pew= loadImage ("laz.png");
    bulletSpeed = 10;
    
    topBound = bulletY - bulletD/2;
    bottomBound = bulletY +bulletD/2;
    leftBound = bulletX - bulletD/2;
    rightBound = bulletX + bulletD/2;
  }

  void render() {
    fill(bulletC);
   circle(bulletX, bulletY, bulletD);
    
   //image(pew,bulletX, bulletY, bulletD,bulletD);
  }

  void move() {
    topBound = bulletY - bulletD/2;
    bottomBound = bulletY +bulletD/2;
    leftBound = bulletX - bulletD/2;
    rightBound = bulletX + bulletD/2;
    
    if (isMovingUp == true) {
      bulletY = bulletY - bulletSpeed;
    }
    if (isMovingDown == true) {
      bulletY = bulletY + bulletSpeed;
    }
    if (isMovingRight == true) {
      bulletX = bulletX + bulletSpeed;
    }
    if (isMovingLeft == true) {
      bulletX = bulletX - bulletSpeed;
    }
  }
  
  
  
}
