/* @pjs preload="1.jpg,2.JPG,3.JPG" */
PImage[] img = new PImage[3];
int AIchoice, Playerchoice = int(random(3));
int state = 0;
int[][] win = new int[][]{ {0, -1, 1}, {1, 0, -1}, {-1, 1, 0} };
int[] count = new int[] {0, 0, 0};
void setup(){
  size(600,600); 
  img[0] = loadImage("1.JPG");
  img[1] = loadImage("2.JPG");
  img[2] = loadImage("3.JPG");
}
void draw(){
  background(255);
  if(state == 0){
    image(img[0],20,360);
    image(img[1],220,360);
    image(img[2],420,360);
  }
  else{
    image(img[Playerchoice],70,220);
    image(img[AIchoice],370,220);
    if(win[Playerchoice][AIchoice] == 1){
      textSize(96);
      fill(0);
      text("You Win", 125, 100);
    }
    else if(win[Playerchoice][AIchoice] == 0){
      textSize(96);
      fill(0);
      text("Draw", 150, 100);
    }
    else if(win[Playerchoice][AIchoice] == -1){
      textSize(96);
      fill(0);
      text("You Lose", 120, 100);
    }
  }
}
boolean PointInRect(float px, float py, float rx, float ry, float rw, float rh){
  return px >= rx && px <= rx + rw && py >=ry && py <= ry + rh;
}





int AIMove() {
  if (random(2) < 1) {
    float a = random(1);
    float scissorProb = (float)count[1] / (float)(count[0] + count[1] + count[2]);
    float paperProb = (float)count[0] / (float)(count[0] + count[1] + count[2]);
    if (a < scissorProb) return 0;
    else if (a < scissorProb + paperProb) return 2;
    else return 1;
  } 
  else {
    float a = random(1);
    float scissorProb = (float)count[2] / (float)(count[0] + count[1] + count[2]);
    float paperProb = (float)count[1] / (float)(count[0] + count[1] + count[2]);
    if (a < scissorProb) return 0;
    else if (a < scissorProb + paperProb) return 2;
    else return 1;
  }
}
//int AIMove() {
//  return Playerchoice;
//}
  
  



void mouseClicked(){
  if(state == 1){
    state = 0;
  }
  else if(PointInRect(mouseX, mouseY, 20,360,160,160)){
    count[0]++;
    state = 1; AIchoice = AIMove(); Playerchoice = 0;
  }
  else if(PointInRect(mouseX, mouseY, 220,360,160,160)){
    count[1]++;
    state = 1; AIchoice = AIMove(); Playerchoice = 1;
  }
  else if(PointInRect(mouseX, mouseY, 420,360,160,160)){
    count[2]++;
    state = 1; AIchoice = AIMove(); Playerchoice = 2;
  }
}

  
  
  
