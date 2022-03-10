public class Flag extends Animation{
  public Flag(String img, float scale){
    super(img, scale, 0, 0);
    neutral = new PImage[3];
    neutral[0] = loadImage("Platformer Art Complete Pack/Base pack/Items/flagYellow.png");
    neutral[1] = loadImage("Platformer Art Complete Pack/Base pack/Items/flagYellow2.png");
    neutral[2] = loadImage("Platformer Art Complete Pack/Base pack/Items/flagYellowHanging.png");  
    currentImages = neutral;
}

}
