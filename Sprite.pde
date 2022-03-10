public class Sprite{ 
PImage image;
float center_x, center_y; //the coordinates of the center of an image
float change_x, change_y;
float w, h;
  public Sprite(String filename, float scale, float x, float y){
    image = loadImage(filename);
    w = image.width * scale;
    h = image.height * scale;
    center_x = x;
    center_y = y;
    change_x = 0;
    change_y = 0;
  }
  public void display(){
    image(image, center_x, center_y, w, h);//what to draw, x, y, w and h not necessary 
  }

void setLeft(float newLeft){ //we know the boundaries of one side with get and set the opposite side with set
    center_x = newLeft + w/2;
  }
  float getLeft(){ //left boundary of the image
    return center_x - w/2; //since we originally write the center position of an image (in the map?) we can find where the most left coordinate is
  }
  void setRight(float newRight){
    center_x = newRight - w/2;
  }
  float getRight(){
    return center_x + w/2;
  }
  void setTop(float newTop){
    center_y = newTop + h/2;
  }
  float getTop(){
    return center_y - h/2;
  }
  void setBottom(float newBottom){
    center_y = newBottom - h/2;
  }
  float getBottom(){
    return center_y + h/2;
  }
}
