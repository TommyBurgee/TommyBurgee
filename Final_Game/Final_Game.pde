import processing.sound.*;


PImage backgroundImage;
PImage boss;
PImage one;
PImage two;
PImage lose;
PImage win;
PImage three;





// Classes
Player player;
Enemies enemies;
Bullet bullet;
King king;

// declaring sound var
SoundFile pewSound;
SoundFile soundTrack;

ArrayList<Bullet> bulletList;

ArrayList<Enemies> enemyList;


int state;




void setup() {
  size(800, 800);
backgroundImage = loadImage("start.jpeg");
  backgroundImage.resize(800, 800);
  size(backgroundImage.width, backgroundImage.height);
  //
    boss = loadImage("boss.jpeg");
  boss.resize(800, 800);
  size(boss.width, boss.height);
  //

    one = loadImage("1st.jpeg");
  one.resize(800, 800);
  size(one.width, one.height);
//
 two = loadImage("2nd.jpeg");
  two.resize(800, 800);
  size(two.width, two.height);
//
lose=loadImage("lose.jpeg");
lose.resize(800, 800);
size(lose.width, lose.height);
//
 win = loadImage("win.jpeg");
  win.resize(800, 800);
  size(win.width, win.height);
  //
  three = loadImage("three.png");
  three.resize(800, 800);
  size(three.width, three.height);
  //

  pewSound = new SoundFile(this, "pew.wav");
  soundTrack = new SoundFile(this, "SNDT.mp3");
 
  




  player = new Player (50, height/2, 50, color(255));
  
  king = new King (500, 600, 120, color(255,0,0));

  enemies = new Enemies (500, 600, 50, color(255,0,0));
  Enemies e1 = new Enemies (300, 500, 50, color(255,0,0));
  Enemies e2 = new Enemies (600, 400, 50, color(255,0,0));
  Enemies e3 = new Enemies (700, 100, 50, color(255,0,0));
  Enemies e4 = new Enemies (400, 200, 50, color(255,0,0));


  bulletList = new ArrayList<Bullet>();

  enemyList = new ArrayList<Enemies>();
  if (enemyList.size() <= 4) {
    enemyList.add(e1);
    enemyList.add(e2);
    enemyList.add(e3);
    enemyList.add(e4);
    enemyList.add((enemies));
  }
}

void draw() {
  println(king.kinglife);

  switch(state) {
  case 0:
   background(backgroundImage);

    textSize(30);
    fill(0, 0, 0);
    text("Press 'r' To Start", (width-200)/2, 550);
    textSize(25);
        text("Press Arrow Keys To shoot Aliens", (width-300)/2, 600);
    text("Press 'wasd' To Avoid the Aliens ", (width-300)/2, 650);

if(soundTrack.isPlaying() == false){
    soundTrack.play();
    }
     soundTrack.amp(.2);
pewSound.amp(1);
    break;

  
    
  case 1:
    background (one);
    textSize(35);
        text(player.lives+"HP", 650, 750);

    text("Press '4' to HyperJump to next system ", 50, 50);

    player.move();
player.render();
   
    for (Enemies anEnemy : enemyList) {
      if (!anEnemy.isDead) {
        anEnemy.render();
        anEnemy.move(player);
        player.collision(anEnemy);
        for (Bullet aBullet : bulletList) {
          anEnemy.isHit(aBullet);
        }
      }
    }

    for (Bullet aBullet : bulletList) {
      aBullet.render();
      aBullet.move();
    }

    for (int i = enemyList.size()-1; i>=0; i--) {
      if (enemyList.get(i).isDead == true) {
        enemyList.remove(i);

      }
    }

    for (int i = bulletList.size()-1; i>=0; i--) {
      if (bulletList.get(i).isDead == true) {
        bulletList.remove(i);

      }
    }

    break;

  case 2:
    background (two);
        text(player.lives+"HP", 650, 750);

        textSize(35);
    text("Press '7' to HyperJump to next system", 50, 50);
       
    player.render();
    player.move();

    for (Enemies anEnemy : enemyList) {
      if (!anEnemy.isDead) {
        anEnemy.render();
        anEnemy.move(player);
        player.collision(anEnemy);

        for (Bullet aBullet : bulletList) {
          anEnemy.isHit(aBullet);
        }
      }
    }

    for (Bullet aBullet : bulletList) {
      aBullet.render();
      aBullet.move();
    }

    for (int i = enemyList.size()-1; i>=0; i--) {
      if (enemyList.get(i).isDead == true) {
        enemyList.remove(i);
      }
    }
    for (int i = bulletList.size()-1; i>=0; i--) {
      if (bulletList.get(i).isDead == true) {
        bulletList.remove(i);

      }
    }

    break;

  case 3:
    background (three);
        text(player.lives+"HP", 650, 750);

        textSize(35);
    text("Press '9' to Enter The Kings Planet ", 50, 50);
    player.render();
    player.move();
   enemies.playerSpeed = 6;

    for (Enemies anEnemy : enemyList) {
      if (!anEnemy.isDead) {
        anEnemy.render();
        anEnemy.move(player);
        player.collision(anEnemy);
        for (Bullet aBullet : bulletList) {
          anEnemy.isHit(aBullet);
        }
      }
    }

    for (Bullet aBullet : bulletList) {
      aBullet.render();
      aBullet.move();
    }

    for (int i = enemyList.size()-1; i>=0; i--) {
      if (enemyList.get(i).isDead == true) {
        enemyList.remove(i);
      }
    }
    for (int i = bulletList.size()-1; i>=0; i--) {
      if (bulletList.get(i).isDead == true) {
        bulletList.remove(i);

      }
    }
    break;

  case 4:
      background (boss);
        text(player.lives+"HP", 650, 750);
        text(king.kinglife+"HP", 100, 100);

    player.render();
    player.move();

    if (!king.isDead) {
      king.render();
      king.move(player);
      player.collision(king);

      for (Bullet aBullet : bulletList) {
        king.isHit(aBullet);

      }
    }
    for (Bullet aBullet : bulletList) {
      aBullet.render();
      aBullet.move();
    }
  
    
    for (int i = bulletList.size()-1; i>=0; i--) {
      if (bulletList.get(i).isDead == true) {
        bulletList.remove(i);
      }
    }
    
      
       
       
      

    break;

  case 5:

    for (Enemies anEnemy : enemyList) {
      if (!anEnemy.isDead) {
        anEnemy.render();
        anEnemy.move(player);
        player.collision(anEnemy);
      }
    }
    fill(255, 255, 255);
  background (lose);

    textSize(100);
    text("You FAILED!", 200, 300);
    textSize(50);
    text("Press 'r' To Restart", 200, 700);
        text("Press 'h' To Go Home", 200, 400);

    break;
    
    case 6:
      
background (win);   
textSize(100);
    text("You Saved Earth!", 100, 300);
    textSize(50);
    text("Press 'r' To Restart", 50, 600);
        text("Press 'h' To Go Home", 50, 400);

    
    break;
  }
}



void keyPressed() {


  if (key=='r') {
    setup();
    state = 1;
  }
  if (key == '4') {
    setup();
    state = 2;
  }
  if (key == '7') {
    setup();
    state = 3;
  }
  if (key == '9') {
    setup();
    state = 4;
  }
    if (key == 'h') {
    setup();
    state = 0;
  }
  if (key == 'w') {
    player.isUp = true;
  } else if (key == 'a') {
    player.isLeft = true;
  } else if (key == 's') {
    player.isDown = true;
  } else if (key == 'd') {
    player.isRight = true;
  }

  if (keyCode == UP) {
    bulletList.add(new Bullet(player.playerX, player.playerY, 10, color(255), true, false, false, false));
    pewSound.play();
  } else if (keyCode == LEFT) {
    bulletList.add(new Bullet(player.playerX, player.playerY, 10, color(255), false, false, false, true));
    pewSound.play();
  } else if (keyCode == DOWN) {
    bulletList.add(new Bullet(player.playerX, player.playerY, 10, color(255), false, true, false, false));
    pewSound.play();
  } else if (keyCode == RIGHT) {
    bulletList.add(new Bullet(player.playerX, player.playerY, 10, color(255), false, false, true, false));
    pewSound.play();
  }
 }
  void keyReleased() {
  if (key == 'w') {
    player.isUp = false;
  } else if (key == 'a') {
    player.isLeft = false;
  } else if (key == 's') {
    player.isDown = false;
  } else if (key == 'd') {
    player.isRight = false;
  }
}
