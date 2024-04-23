// Class

class Enemies {

  // enemies var
  float enemyX;
  float enemyY;
  int enemyW;
  color enemyC;
PImage alien;
  // player speed
  int playerSpeed;


  // hitboxes
  float topBound;
  float bottomBound;
  float rightBound;
  float leftBound;

  boolean isDead = false;


  int enemylife;
  
  PImage pic;

  // constructor function
  Enemies(float tempX, float tempY, int tempW, color tempC) {
    enemyX = tempX;
    enemyY = tempY;
    enemyW = tempW;
    enemyC = tempC;
alien=loadImage("alien.png");

    playerSpeed = 4;

    enemylife = 3;

    topBound = enemyY - enemyW/2;
    bottomBound = enemyY +enemyW/2;
    leftBound = enemyX - enemyW/2;
    rightBound = enemyX + enemyW/2;
    
   
  }


  // render player
  void render() {
    fill(enemyC);
   imageMode(CENTER);
    //circle(enemyX, enemyY, enemyW);
    image(alien,enemyX,enemyY,enemyW,enemyW);
  }

  void isHit(Bullet aBullet) {
    if (aBullet.topBound > topBound) {
      if (aBullet.bottomBound < bottomBound) {
        if (aBullet.rightBound < rightBound) {
          if (aBullet. leftBound > leftBound) {
            aBullet.isDead = true;
            
            enemylife = enemylife - 1; 
          }
        }
      }
      
    }
    if (enemylife <= 0){
    isDead = true;
  }
  }
    
  


  // Following player
  void move(Player aPlayer) {
    topBound = enemyY - enemyW/2;
    bottomBound = enemyY +enemyW/2;
    leftBound = enemyX - enemyW/2;
    rightBound = enemyX + enemyW/2;

    if (aPlayer.playerY < enemyY) {
      enemyY = enemyY - playerSpeed;
    }
    if (aPlayer.playerX < enemyX) {
      enemyX = enemyX - playerSpeed;
    }

    if (aPlayer.playerY > enemyY) {
      enemyY = enemyY + playerSpeed;
    }
    if (aPlayer.playerX > enemyX) {
      enemyX = enemyX + playerSpeed;
    }
  }
}
