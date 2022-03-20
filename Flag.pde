public class Flag extends Animation{
  public Flag(String img, float scale){
    super(img, scale, 0, 0);
    neutral = new PImage[3];
    neutral[0] = loadImage("Items/flagYellow.png");
    neutral[1] = loadImage("Items/flagYellow2.png");
    neutral[2] = loadImage("Items/flagYellowHanging.png");  
    state = neutral;
}

}
