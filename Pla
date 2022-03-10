final static float MOVE_SPEED = 4; //4 pixels per frame
final static float SPRITE_SCALE = 1.0;
final static float SPRITE_SIZE = 70;
final static float GRAVITY = 0.6;
final static float JUMP_SPEED = 13;

final static float RIGHT_SCREEN_EDGE = 400;
final static float LEFT_SCREEN_EDGE = 100;

final static int FACE_RIGHT = 1; 
final static int FACE_LEFT = 2; 

int flagReached = -1, beginLevel = 0;
int timeLeft = 21*60;

Player player;
Enemy fly;
float view_x = 0, view_y = 0;
ArrayList <Sprite> platforms;
ArrayList <Sprite> flags;
String[] SpriteNames = {"Tiles/choco.png", "Tiles/chocoCenter.png", "Tiles/chocoHalfAlt.png", "Tiles/chocoHalfAltBig.png"};
String flag = "Platformer Art Complete Pack/Base pack/Items/flagYellow.png";
String ifly = "Platformer Art Complete Pack/Base pack/Enemies/flyFly3.png";
String p = "Player/idle_right.png";

void setup(){      //runs once
size(1200, 760);   //width, height, size of window
}

void draw(){     //loops infinitely 60 times a second to create animation
  if (flagReached == -1) {
    startScreen(); 
  } 
  else if (flagReached == 0) {
    Level1();
    beginLevel = 1; //so it doesnt keep reloading the level on repeat like a madman
  } 
  else if (flagReached == 1){
     Level2();
     beginLevel = 2;
}
  else if (flagReached == 2){
     Level3();
     beginLevel = 3;
  }
  else if (flagReached == 3){
    textSize(100);
    fill(152,116,86);
    text("YAY", 600, 300);
  }
  if (flagReached >= 0){
  if (player.getBottom()>760 || checkCollision(player, fly)){ //reset level
  player.center_x = 100;
  player.center_y = 700;
  if (flagReached == 2){
    timeLeft = 21*60;
  }
  }}
}

void begining(String filename){
imageMode(CENTER); //so basically, it moves the picture not by dragging it from its top left corner but from the center
player = new Player(p, 1.0, 100, 700); 
platforms = new ArrayList<Sprite>();
flags = new ArrayList<Sprite>();
createPlatforms(filename);
}

void startScreen(){
background(161, 206, 198);
textAlign(CENTER);
textSize(100);
fill(152,116,86);
text("Welcome to my game", 600, 300);
int lButton = 530, rButton = 730, tButton = 400, bButton = 500; //edges of the button
rect (lButton, tButton, 200, 100);
fill(161, 206, 198);
textSize(50);
text("Play", 625, 470);
  
if (mousePressed == true && mouseX > lButton && mouseX < rButton && mouseY > tButton && mouseY < bButton){
begining("Map/map.csv");
flagReached = 0;
}
}

void Level1() {
background(161, 206, 198);
textSize(30);
fill(0);
text("Level 1", 80, 50);
scroll();
player.display();
player.updateAnimation();
resolvePlatformCollisions(player, platforms);

for(Sprite s: platforms){ //for each s in platforms arraylist
s.display();
}
for(Sprite f: flags){ 
f.display();
((Animation)f).updateAnimation(); //casting?????
if (checkCollision(player, f)){
  flagReached = 1;
}}

fly.display();
fly.update();
fly.updateAnimation();
}
void Level2() { 
if(beginLevel!=2){
begining("Map/map2.csv");}
background(161, 206, 198);
text("Level 2", 80, 50);
scroll();
player.display();
player.updateAnimation();
resolvePlatformCollisions(player, platforms);

for(Sprite s: platforms){ 
s.display();
}
for(Sprite f: flags){ 
f.display();
((Animation)f).updateAnimation();
if (checkCollision(player, f)){
  flagReached = 2;
}}

fly.display();
fly.update();
fly.updateAnimation();
}
void Level3() {
if(beginLevel!=3){
begining("Map/map3.csv");}
background(161, 206, 198);
text("Level 3", 80, 50);
text("Time left: " +timeLeft/60, 250, 50);
timeLeft --;
scroll();
player.display();
player.updateAnimation();
resolvePlatformCollisions(player, platforms);

for(Sprite s: platforms){ 
s.display();
}
for(Sprite f: flags){ 
f.display();
((Animation)f).updateAnimation();
if (checkCollision(player, f)){
  flagReached = 3;
}}

fly.display();
fly.update();
fly.updateAnimation();

if (timeLeft/60 == 0){
  begining("Map/map3.csv");
  timeLeft = 20*60;
  Level3();
}

}
void scroll(){
  float right_boundary = view_x + width - RIGHT_SCREEN_EDGE; //width = of the screen
  if(player.center_x > right_boundary){ //if we go outside the right boundary    alternative  player.getRight() > right_boundary  then  view_x = view_x + player.getRight() - right_boundary
  view_x = view_x + player.center_x - right_boundary; //add player's right bound - with our section's set boundary difference to compensate accordingly
  }
  float left_boundary = view_x + LEFT_SCREEN_EDGE;
  if(player.center_x < left_boundary){
  view_x = view_x - (left_boundary - player.center_x); //if we go left we subtract
  }
  translate(-view_x, -view_y); //tranlsate displases objects
}
public boolean isOnPlatform(Sprite s, ArrayList<Sprite> objects){ //maybe write Sprite p instead of s because we are looking at player, objects is an arraylist ive created with Sprite
  s.center_y = s.center_y + 1; //lets say we move our character down, we want to check if there will be any collision
  ArrayList<Sprite> coll_list = checkCollisionList(s, objects);
  s.center_y = s.center_y - 1; //restore it to its original position
  if (coll_list.size()>0){ //if the array is not empty, then we are on a platform, because its colliding with smth
  return true;  
}
else return false;
}

public void resolvePlatformCollisions(Sprite s, ArrayList<Sprite> objects){
  s.change_y = s.change_y + GRAVITY; 
  
  s.center_y = s.center_y + s.change_y;
  ArrayList<Sprite> coll_list = checkCollisionList(s, objects); 
  if(coll_list.size()>0){ //if we collided with smth while moving in y direction
  Sprite collided = coll_list.get(0); //get the first platform that we collide with
  if(s.change_y>0){ //if we are falling down
    s.setBottom(collided.getTop()); //get the top part of the platform and equal it to the bottom of the player
  }
  else if (s.change_y<0){ //if we are jumping
  s.setTop(collided.getBottom());
  }
  s.change_y = 0; //stop movement if we collided with smth
}

  s.center_x = s.center_x + s.change_x;
  coll_list = checkCollisionList(s, objects);
  if(coll_list.size()>0){
  Sprite collided = coll_list.get(0); 
  if(s.change_x>0){ 
    s.setRight(collided.getLeft()); 
  }
  else if (s.change_x<0){
  s.setLeft(collided.getRight());
  }
  s.change_x = 0; 
}
}

boolean checkCollision(Sprite s1, Sprite s2){
  boolean noXOverlap = s1.getRight() <= s2.getLeft() || s1.getLeft() >= s2.getRight(); //not colliding horizontally
  boolean noYOverlap = s1.getBottom() <= s2.getTop() || s1.getTop() >= s2.getBottom();
  if(noXOverlap || noYOverlap){
    return false;
  }
  else{
    return true;
  }
}
public ArrayList<Sprite> checkCollisionList(Sprite s, ArrayList<Sprite> list){
  ArrayList<Sprite> collision_list = new ArrayList<Sprite>();
  for(Sprite t: list){ 
    if(checkCollision(s, t)) //if there is collision
      collision_list.add(t); //an array of things t colides with
  }
  return collision_list;
}

void createPlatforms(String filename){ 
  String[] lines = loadStrings(filename); //loads the csv file into lines 
  for(int row=0; row<lines.length; row++){
    String[] values = split(lines[row], ","); //splits according to commas??? so how many elements in each line/row
    for (int col=0; col<values.length; col++){ 
    if(values[col].equals("1")){ //if its equal to 1 we create a specific sprite parameters
      Sprite s = new Sprite(SpriteNames[0], SPRITE_SCALE, 0, 0); 
      s.center_x = SPRITE_SIZE/2 + col * SPRITE_SIZE;
      s.center_y = SPRITE_SIZE/2 + row * SPRITE_SIZE;
      platforms.add(s); //add all the new data to the array s
    }
    else if(values[col].equals("2")){ 
      Sprite s = new Sprite(SpriteNames[1], SPRITE_SCALE, 0, 0); 
      s.center_x = SPRITE_SIZE/2 + col * SPRITE_SIZE;
      s.center_y = SPRITE_SIZE/2 + row * SPRITE_SIZE;
      platforms.add(s); 
    }
    else if(values[col].equals("3")){ 
      float leftB = col * SPRITE_SIZE;
      float rightB = leftB + 4 * SPRITE_SIZE; //4 is the amount of tiles it can move to the right
      fly = new Enemy(ifly, SPRITE_SCALE, leftB, rightB); 
      fly.center_x = SPRITE_SIZE/2 + col * SPRITE_SIZE;
      fly.center_y = SPRITE_SIZE/2 + row * SPRITE_SIZE; 
    }
    else if(values[col].equals("4")){ 
      Sprite s = new Sprite(SpriteNames[2], SPRITE_SCALE, 0, 0); 
      s.center_x = SPRITE_SIZE/2 + col * SPRITE_SIZE;
      s.center_y = SPRITE_SIZE/2 + row * SPRITE_SIZE;
      platforms.add(s); 
    }
    else if(values[col].equals("5")){ 
      Flag f = new Flag(flag, SPRITE_SCALE); 
      f.center_x = SPRITE_SIZE/2 + col * SPRITE_SIZE;
      f.center_y = SPRITE_SIZE/2 + row * SPRITE_SIZE;
      flags.add(f); 
    }
    else if(values[col].equals("6")){ 
      Sprite s = new Sprite(SpriteNames[3], SPRITE_SCALE, 0, 0); 
      s.center_x = SPRITE_SIZE/2 + col * SPRITE_SIZE;
      s.center_y = SPRITE_SIZE/2 + row * SPRITE_SIZE;
      platforms.add(s); 
    }
  }
  }
}

void keyPressed(){ //calls method whenever a key is pressed
  if(keyCode == RIGHT){ 
  player.change_x = MOVE_SPEED;
  }
  else if(keyCode == LEFT){ 
  player.change_x = -MOVE_SPEED;
  }
  if(keyCode == UP && isOnPlatform(player, platforms)){  
  player.change_y = -JUMP_SPEED; //negative because for messed up reasons +y is down and -y is up
  }
}
void keyReleased(){ //calls method whenever a key is released
  if(keyCode == RIGHT){ 
  player.change_x = 0;
  }
  else if(keyCode == LEFT){ 
  player.change_x = 0;
  }
}
