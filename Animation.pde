public class Animation extends Sprite{
  PImage[] currentImages;
  PImage[] neutral;
  PImage[] moveLeft;
  PImage[] moveRight;
  int direction, i, frame;
  public Animation(String img, float scale, float x, float y){
    super(img, scale, x, y); 
    i = 0;
    frame = 0;
  }
  public void updateAnimation(){
    frame++;
    if(frame%5==0){ //update every 5 frame
      directionLeftRight();
      getCurrentImages(); //which array to pick
      nextImage();
    }
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
      currentImages = moveRight;
    }
    else if(direction==FACE_LEFT){
      currentImages = moveLeft;
    }
  }
  public void nextImage(){
    i++; //cycle through the array
    if (i >= currentImages.length){ //if i reach the end of array
    i = 0; //so it can loop back later  
  }
    image = currentImages[i];
  }
}
