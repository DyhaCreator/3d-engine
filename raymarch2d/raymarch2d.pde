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

World camera = new World("camera",200,200);
World circle = new World("circle",350,250);
World cube = new World("cube",400,150);

int[] distanse = new int[2];

int distans,colray,i,pixel,h,d,low;
float rayx,rayy,j;

void setup(){
  low=10;
  frameRate(50);
  size(500,500);
  circle.r=50;
  cube.r=50;
  camera.r=-1;
  circle(camera.x,camera.y,3);
  circle(circle.x,circle.y,circle.r);
  rect(cube.x-cube.r/2,cube.y-cube.r/2,cube.r,cube.r);
}

void draw(){
  if(camera.r>=1){camera.r=-1;}
  camera.r+=0.001;
  colray=5;
  background(200);
  fill(255);
  //camera.x=mouseX;
  //camera.y=mouseY;
  circle(camera.x,camera.y,3);
  circle(circle.x,circle.y,circle.r);
  rect(cube.x-cube.r/2,cube.y-cube.r/2,cube.r,cube.r);
  rayx=camera.x;
  rayy=camera.y;
  for(i=0;i<=colray;i++){
    distans = round(dist(rayx,rayy,(max(abs(rayx-cube.x)-cube.r/2,0.0))+rayx,(max(abs(rayy-cube.y)-cube.r/2,0.0))+rayy))*2;
    distanse[1] = distans;
    distans = round(dist(rayx,rayy,circle.x,circle.y)-circle.r/2)*2;
    distanse[0] = distans;
    if(distanse[0]<distanse[1]){distans=distanse[0];}
    else{distans=distanse[1];}
    noFill();
    circle(rayx,rayy,distans);
    fill(255);
    circle(rayx,rayy,1);
    rayx=(distans/2)*cos(camera.r)+rayx;
    rayy=(distans/2)*sin(camera.r)+rayy;
  }
}
