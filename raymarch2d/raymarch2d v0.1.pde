class World{
  String type;
  int x,y;
  float r;
  public World(String typ, int xo, int yo){
    type=typ;
    x=xo;
    y=yo;
  }
}

World circle = new World("circle",400,250);
World camera = new World("camera",240,250);
int distans,colray,i;
float rayx,rayy,j;

void setup(){
  frameRate(50);
  size(500,500);
  circle.r=50;
  camera.r=0;
  circle(circle.x,circle.y,circle.r);
  circle(camera.x,camera.y,3);
}

void draw(){
  camera.r+=0.01;
  colray=8;
  //j=mouseX;
  //j=j/80;
  //println(j);
  //camera.r=j;
  background(200);
  fill(255);
  //camera.x=mouseX;
  //camera.y=mouseY;
  circle(circle.x,circle.y,circle.r);
  circle(camera.x,camera.y,3);
  rayx=camera.x;
  rayy=camera.y;
  for(i=0;i<=colray;i++){
    distans = round(dist(rayx,rayy,circle.x,circle.y)-circle.r/2)*2;
    noFill();
    circle(rayx,rayy,distans);
    fill(255);
    circle(rayx,rayy,1);
    rayx=(distans/2)*cos(camera.r)+rayx;
    rayy=(distans/2)*sin(camera.r)+rayy;
  }
}
