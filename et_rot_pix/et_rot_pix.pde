import ch.bildspur.postfx.builder.*;
import ch.bildspur.postfx.pass.*;
import ch.bildspur.postfx.*;

PostFX fx;
PVector t;

PShape shp;

void setup() {
  //size(1280, 720, P3D);
  fullScreen(P3D);
  frameRate(60);
  smooth(8);

  fx = new PostFX(this);
  t = new PVector();

  shp = loadShape("shapes/inner_cube.obj");
  shp.disableStyle();

  recording = false;
  background(0);
}

void draw() {
  t.x += 0.01 * (sin(frameCount * 0.01) > 0.8 ? -1 : 1);
  t.y += 0.01 * (sin(frameCount * 0.012) > 0.9 ? -1 : 1);
  t.z += 0.01 * (cos(frameCount * 0.00957) > -0.8 ? -1 : 1);

  lum();
  persp();

  push();
  translate(width/2, height/2);
  rotateX(t.x * 1.02);
  rotateY(t.y * 1.00);
  rotateZ(t.z * 0.984);
  scale(150);

  stroke(255);
  noFill();
  fill(255);

  shape(shp);
  pop();

  perspective();
  fx.render()
    .pixelate(300)
    .bloom(0.2, 30, 10)
    .chromaticAberration()
    .noise(0.05, 0.05)
    .compose();

  record();
}
