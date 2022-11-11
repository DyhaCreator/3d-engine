void keyPressed()
{
  int speed=1;
  switch (key) {
      case 'w':
        camera.x+=(speed)*cos(camera.z);
        camera.y+=(speed)*sin(camera.z);
        break;
      case 's':
        camera.x-=(speed)*cos(camera.z);
        camera.y-=(speed)*sin(camera.z);
        break;
      case 'd':
        camera.x-=(speed)*cos(camera.z+(PI*3)/2);
        camera.y-=(speed)*sin(camera.z+(PI*3)/2);
        break;
      case 'a':
        camera.x-=(speed)*cos(camera.z-(PI*3)/2);
        camera.y-=(speed)*sin(camera.z-(PI*3)/2);
        break;
    }
}
