public class Player extends Animation{
  boolean onPlatform, standStill;
  PImage[] standLeft;
  PImage[] standRight;
  PImage[] jumpLeft;
  PImage[] jumpRight;
  public Player(String img, float scale, float x, float y){
    super(img, scale, x, y);
    direction = FACE_RIGHT;
    standStill = true; 
    standRight = new PImage[1];
    standRight[0] = loadImage("Player/idle_right.png");
    standLeft = new PImage[1];
    standLeft[0] = loadImage("Player/idle_left.png");
    jumpRight = new PImage[1]; 
    jumpRight[0] = loadImage("Player/Jump (14).png");
    jumpLeft = new PImage[1];
    jumpLeft[0] = loadImage("Player/Jump_left (14).png");
    moveRight = new PImage[5]; 
    moveRight[0] = loadImage("Player/Walk (3).png");
    moveRight[1] = loadImage("Player/Walk (6).png");
    moveRight[2] = loadImage("Player/Walk (9).png");
    moveRight[3] = loadImage("Player/Walk (12).png");
    moveRight[4] = loadImage("Player/Walk (15).png");
    moveLeft = new PImage[5];
    moveLeft[0] = loadImage("Player/Walk_left (3).png");
    moveLeft[1] = loadImage("Player/Walk_left (6).png");
    moveLeft[2] = loadImage("Player/Walk_left (9).png");
    moveLeft[3] = loadImage("Player/Walk_left (12).png");
    moveLeft[4] = loadImage("Player/Walk_left (15).png");
    currentImages = standRight;
  }
  public void updateAnimation(){
    onPlatform = isOnPlatform(this, platforms);
    standStill = change_x==0 && change_y==0; //not moving
    //v or write super.updateAnimation(); v
    frame++;
    if(frame%5==0){ 
      directionLeftRight();
      getCurrentImages(); 
      nextImage();
    }
    //^ or write super.updateAnimation(); ^
  }
  public void directionLeftRight(){
    if(change_x>0){ //if im going right
    direction = FACE_RIGHT;
    }
    else if(change_x<0){ //if im going left
    direction = FACE_LEFT;
    }
  }
  public void getCurrentImages(){
    if(direction==FACE_RIGHT){
      if(standStill){
        currentImages = standRight;
      }
      else if (!onPlatform){
        currentImages = jumpRight;
      }
      else {
        currentImages = moveRight;
      }
    }
    else if(direction==FACE_LEFT){
      if(standStill){
        currentImages = standLeft;
      }
      else if (!onPlatform){
        currentImages = jumpLeft;
      }
      else {
        currentImages = moveLeft;
      }
    }
  }
}
