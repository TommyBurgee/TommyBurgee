// Class

class King{
  
  
   // enemies var
  int kingX;
  int kingY;
  int kingW;
  color kingC;

  // player speed
  int kingSpeed;
PImage king;

  // hitboxes
  int topBound;
  int bottomBound;
  int rightBound;
  int leftBound;
  
  
    boolean isDead = false;

  
    PImage pic;
    
      int kinglife;
      
      


  
  // contructor
  
  King(int tempX, int tempY, int tempW, color tempC) {
    kingX = tempX;
    kingY = tempY;
    kingW = tempW;
    kingC = tempC;
    
    
    kingSpeed = 7;
    
    
    kinglife = 100;
    imageMode(CENTER);
    king=loadImage("king.png");
    topBound = kingY - kingW/2;
    bottomBound = kingY +kingW/2;
    leftBound = kingX - kingW/2;
    rightBound = kingX + kingW/2;
    
 
  }
  
  // render king
  void render() {
    fill(kingC);
    //circle(kingX, kingY, kingW);
    image(king,kingX, kingY, kingW,kingW);
  }
  
  void isHit(Bullet aBullet) {
    if (aBullet.topBound > topBound) {
      if (aBullet.bottomBound < bottomBound) {
        if (aBullet.rightBound < rightBound) {
          if (aBullet. leftBound > leftBound) {
              

             kinglife = kinglife - 1; 
               aBullet.isDead = true;


          }
        }
      }
    }
    if (kinglife <= 0){
    isDead = true;
    state = 6;
    }
  }
  
  
  // Following player
  void move(Player aPlayer) {
    topBound = kingY - kingW/2;
    bottomBound = kingY +kingW/2;
    leftBound = kingX - kingW/2;
    rightBound = kingX + kingW/2;

    if (aPlayer.playerY < kingY) {
      kingY = kingY - kingSpeed;
    }
    if (aPlayer.playerX < kingX) {
      kingX = kingX - kingSpeed;
    }

    if (aPlayer.playerY > kingY) {
      kingY = kingY + kingSpeed;
    }
    if (aPlayer.playerX > kingX) {
      kingX = kingX + kingSpeed;
    }
  }
  
 
}
