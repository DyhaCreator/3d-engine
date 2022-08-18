World camera = new World(125,90);
World circle = new World(200,90);
World circle2 = new World(300,150);
int drawing;
float distanse,rayX,rayY,rayR,distanse1,res;
void setup(){
  size(512,288);
  smooth(0);
  frameRate(1000);
  res=500;
  strokeWeight(width/res);
  strokeCap(SQUARE);
  circle.size=30;
  circle2.size=10;
  camera.rotate = 0;
  drawing=100;
}
void draw(){
  background(200);
  rayR=camera.rotate-1;
  while(rayR<=camera.rotate+1){
    rayX=camera.x;
    rayY=camera.y;
    distanse1=0;
    for(int i = 0; i <= drawing; i++){
      distanse=dist(rayX,rayY,circle.x,circle.y)-circle.size/2;
      distanse1+=distanse;
      /*noFill();
      circle(rayX,rayY,distanse1);
      fill(255);*/
      rayX=(distanse)*cos(rayR)+rayX;
      rayY=(distanse)*sin(rayR)+rayY;
    }
    lineDraw(4000/distanse1,rayR);
    rayR+=1/res;
  }
  //circle(camera.x,camera.y,3);
  //circle(circle.x,circle.y,circle.size);
  //save("screen.png");
  text(frameRate,0,10);
  //noLoop();
}
void lineDraw(float dist, float rayRot){
  rayRot=map(rayRot-camera.rotate,-1,1,0,width);
  //println(dist);
  //circle(rayRot,dist,10);
  line(rayRot,height/2,rayRot,dist/1.3+height/2);
  line(rayRot,height/2,rayRot,-dist+height/2);
}
void keyPressed()
{
  int speed=1;
    if (key == CODED) {
        if (keyCode == RIGHT) {
            camera.rotate+=0.1;
        } 
    else if (keyCode == LEFT) {
            camera.rotate-=0.1;
        } 
    else if (keyCode == UP) {
            camera.x+=(speed)*cos(camera.rotate);
            camera.y+=(speed)*sin(camera.rotate);
        }
    else if (keyCode == DOWN) {
            camera.x-=(speed)*cos(camera.rotate);
            camera.y-=(speed)*sin(camera.rotate);
        }
    }
} 
