public class Animation extends Sprite{
  PImage[] state;
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
    if(frame%5==0){       //update every 5 frame
      directionLeftRight();
      getState(); //which array to pick
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
  public void getState(){
    if(direction==FACE_RIGHT){
      state = moveRight;
    }
    else if(direction==FACE_LEFT){
      state = moveLeft;
    }
  }
  public void nextImage(){
    i++; //cycle through the array
    if (i >= state.length){ //if i reach the end of array
    i = 0; //so it can loop back later  
  }
    image = state[i];
  }
}
