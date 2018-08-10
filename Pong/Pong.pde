import shiffman.box2d.*;



//Other


//Ball
int ballsize;
int ballspeed;
int ballx;
int bally;
int movementx,movementy;

//Player
int playerx,playery;
int playpointx,playpointy;
int widthchar;
float currentlocation;
PShape player;
int playercenterx = 150;
int playercentery = 20;
int playercenterwidth = 400;
int playercenterheight = 20;
int playerscore = 0;

//AI
int aix,aiy;
int aipointx,aipointy;
int widthai;
PShape aiplayer;
int aicenterx = 150;
int aicentery = 20;
int aicenterwidth = 400;
int aicenterheight = 20;
int aiscore = 0;

//Ballspeed
int balltimer;


void setup(){
 size(800,800);
 playerx = width/2-150;
 playery = 0;
 widthchar = 300;
 background(0);
 
 //ball
 ballsize = 30;
 ballspeed = 5;
 movementx = 1;
 movementy = -1;
 ballx = (int) random(0,800);
 bally = height/2 - ballsize/2;
 balltimer = 0;
 
 //Ai
 aix = width/2-150;
 aiy = 760;
 widthai = 300;
  
}

void draw(){
  background(0);
  
  //Player
  //rect(playerx,playery,widthchar,40);
  player = createShape(RECT, playerx,playery,widthchar,40);
  player.setFill(color(255));
  shape(player);
  playercenterx = playerx + widthchar/2;
  playercentery = playery + 40/2;
  playerx = mouseX-widthchar/2;

  //Ai
  aiplayer = createShape(RECT, aix,aiy,widthai,40);
  aiplayer.setFill(color(255));
  shape(aiplayer);
  aicenterx = aix + widthchar/2;
  aicentery = aiy + 40/2;
  if(aiscore-playerscore >= 5){
    
    aix = ballx-(widthai)+5;
    
  } else {
    
    aix = ballx-widthai/2;
    
  }
  
  
  //Score System
  textSize(32);
  text(playerscore,10,(height/2)+40);
  text(aiscore,10,(height/2)-40);
  
  //Ball
  //balltimer += 1;
  if(balltimer == 120){
    ballspeed += 1;
    balltimer = 0;
  }
  // Hit on top size, switch y
  if(bally <= 0){
    movementy *= -1;
    bally = height/2;
    aiscore += 1;
  } else if (bally >= 770){
    movementy *= -1;
    bally = height/2;
    playerscore += 1;
  }
  //Hit on side, switch x
  if(ballx <= 0){
    movementx *= -1;
  } else if (ballx >= 770){
    movementx *= -1;
  }
  if(playerx > width-300)
  {
    playerx = width-300;
  } else if(playerx < 0){
    playerx = 0;
  }
  if(aix > width-300)
  {
    aix = width-300;
  } else if(aix < 0){
    aix = 0;
  }
  
  if (ballx + ballsize + ballspeed > playerx && 
      ballx + ballspeed < playerx + widthchar && 
      bally + ballsize > playercentery && 
      bally < playercentery + playercenterheight) {
    movementy *= -1;
    bally = bally + (ballspeed * movementy);

  }
  if (ballx + ballsize + ballspeed > aix && 
      ballx + ballspeed < aix + widthai && 
      bally + ballsize > aicentery && 
      bally < aicentery + aicenterheight) {
    movementy *= -1;
    bally = bally + (ballspeed * movementy);

  }
  bally = bally + (ballspeed * movementy);
  ballx = ballx + (ballspeed * movementx);
  rect(ballx,bally,ballsize,ballsize);
}

void keyPressed(){
 if(key == CODED){
   if(keyCode == RIGHT){
     playerx += 10;
   }
   if(keyCode == LEFT){
     playerx -= 10;
   }
 }
}
