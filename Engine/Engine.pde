PVector camera = new PVector(100,100,0);
PVector ray = new PVector(0,0,0);
float dist[] = new float[2];
float drawing,engle,distance,min_dist,max_dist,scl;
float wid;
void setup(){
  frameRate(1000);
  size(640,360);
  fullScreen();
  drawing=100;
  ray.z=camera.z-engle/2;
  engle=1;
  min_dist=0.1;
  max_dist=500;
  scl=width;
}
void draw(){
  float rot = mouseX;
  camera.z = rot/100;
  background(200);
  //fill(#00C800);
  //rect(0,height/2,width,height/2);
  for(ray.z=camera.z-engle/2;ray.z<camera.z+engle/2;ray.z+=1/scl){
    ray.x=camera.x;
    ray.y=camera.y;
    distance=0;
    for(int i=0;i<drawing;i++){
      dist[0]=dCircle(ray,new PVector(200,80),new PVector(30,1),#FF0000);
      //#FF7F00 #0000FF
      dist[1]=dBox(ray,new PVector(200,120),new PVector(30,30,1),#00FF00);
      distance+=min(dist);
      if(min(dist)<min_dist){break;}
      ray.x+=min(dist)*cos(ray.z);
      ray.y+=min(dist)*sin(ray.z);
    }
    render();
  }
  fill(255);
  text(frameRate,0,10);
}
float dCircle(PVector r,PVector circle,PVector size,color col){
  float dist;
  dist=dist(r.x,r.y,circle.x,circle.y)-size.x/2;
  if(dist<min_dist){
    col=getLight(col);
    stroke(col);
    wid=size.y;
  }
  return dist;
}
float dBox(PVector r,PVector box,PVector size,color col){
  float dist;
  dist=dist(r.x,r.y,(max(abs(r.x-box.x)-size.x/2,0.0))+ray.x,(max(abs(r.y-box.y)-size.y/2,0.0))+ray.y);;
  if(dist<min_dist){
    col=getLight(col);
    stroke(col);
    wid=size.z;
  }
  return dist;
}

color getLight(color col){
  float black=distance/1.5;
  col=color(red(col)-black,green(col)-black,blue(col)-black);
  return col;
}

void render(){
  float rayE;
  if(distance<max_dist){
    strokeWeight(width/scl);
    strokeCap(SQUARE);
    rayE=map(ray.z,-engle/2+camera.z,engle/2+camera.z,0,width);
    distance=width*20/distance;
    line(rayE,height/2-distance*wid,rayE,distance*0.7+height/2);
    stroke(50);
  }
}
