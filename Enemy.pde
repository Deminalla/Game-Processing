public class Enemy extends Animation{
  float leftBoundary, rightBoundary;
public Enemy(String img, float scale, float leftB, float rightB){
    super (img, scale, 0, 0);
    moveLeft = new PImage[2];
    moveLeft[0] = loadImage("Enemies/flyFly1.png");
    moveLeft[1] = loadImage("Enemies/flyFly2.png");  
    moveRight = new PImage[2];
    moveRight[0] = loadImage("Enemies/flyFly3.png");
    moveRight[1] = loadImage("Enemies/flyFly4.png");  
    currentImages = moveRight; 
    direction = FACE_RIGHT;
    leftBoundary = leftB;
    rightBoundary = rightB;
    change_x = 2; //+2 because right
}
void update(){
  center_x += change_x;
  center_y += change_y;
  if(getLeft() <= leftBoundary){
    setLeft(leftBoundary);
    change_x = -change_x; //change direction
  }
  else if(getRight() >= rightBoundary){
    setRight(rightBoundary);
    change_x = -change_x;
  }
}
}
