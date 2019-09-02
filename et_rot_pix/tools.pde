void lum() {
  ambientLight(20, 0, 40);
  
  PVector dir = new PVector(-0.3, 0.1, 0.1);
  directionalLight(5, 255, 240, dir.x, dir.y, dir.z);
  directionalLight(221, 3, 255, -dir.x, dir.y, dir.z);
}

void persp() {
  float fov = PI/map(sin(frameCount * 0.01), -1, 1, 3.0, 2.5);
  float cameraZ = (height/2.0) / tan(fov/2.0);
  perspective(fov, float(width)/float(height), 
    cameraZ/10.0, cameraZ*10.0);
}
