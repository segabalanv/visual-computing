import remixlab.proscene.*;
import remixlab.dandelion.core.*;
import remixlab.dandelion.geom.*;

String[] lines;
PShape pointCloud;
PShape pointCloud2;
PShape pointCloud3;
PShape pointCloud4;

Scene scene;
InteractiveFrame iFrame;
InteractiveFrame iFrame2;
InteractiveFrame iFrame3;
InteractiveFrame iFrame4;


public void setup() {
  size(600,600,P3D);
  
  lines = loadStrings("Im93_mod.off");
  String[] pfl = splitTokens(lines[1]);
  int size = int(pfl[0]);
  pointCloud = createShape();
  pointCloud.beginShape(POINTS);
  for(int i=0; i<size; i++) {
    String[] pointz = splitTokens(lines[2+i]);
    if(pointz.length != 6)
      continue;
    pointCloud.stroke(float(pointz[3]),float(pointz[4]),
                      float(pointz[5]));
    pointCloud.vertex((float(pointz[0])*400)+30, 
                      (float(pointz[1])*400)-80,
                      (float(pointz[2])*400)-370);
  }
  pointCloud.endShape();
  
  lines = loadStrings("Im92_mod.off");
  pfl = splitTokens(lines[1]);
  size = int(pfl[0]);
  pointCloud2 = createShape();
  pointCloud2.beginShape(POINTS);
  for(int i=0; i<size; i++) {
    String[] pointz = splitTokens(lines[2+i]);
    if(pointz.length != 6)
      continue;
    pointCloud2.stroke(float(pointz[3]),float(pointz[4]),
                      float(pointz[5]));
    pointCloud2.vertex((float(pointz[0])*400)+30, 
                      (float(pointz[1])*400)-80,
                      (float(pointz[2])*400)-370);
  }
  pointCloud2.endShape();
  
  lines = loadStrings("Im91_mod.off");
  pfl = splitTokens(lines[1]);
  size = int(pfl[0]);
  pointCloud3 = createShape();
  pointCloud3.beginShape(POINTS);
  for(int i=0; i<size; i++) {
    String[] pointz = splitTokens(lines[2+i]);
    if(pointz.length != 6)
      continue;
    pointCloud3.stroke(float(pointz[3]),float(pointz[4]),
                      float(pointz[5]));
    pointCloud3.vertex((float(pointz[0])*400)+30, 
                      (float(pointz[1])*400)-80,
                      (float(pointz[2])*400)-370);
  }
  pointCloud3.endShape();
  
  lines = loadStrings("Im90_mod.off");
  pfl = splitTokens(lines[1]);
  size = int(pfl[0]);
  pointCloud4 = createShape();
  pointCloud4.beginShape(POINTS);
  for(int i=0; i<size; i++) {
    String[] pointz = splitTokens(lines[2+i]);
    if(pointz.length != 6)
      continue;
    pointCloud4.stroke(float(pointz[3]),float(pointz[4]),
                      float(pointz[5]));
    pointCloud4.vertex((float(pointz[0])*400)+30, 
                      (float(pointz[1])*400)-80,
                      (float(pointz[2])*400)-370);
  }
  pointCloud4.endShape();
  
  scene = new Scene(this);
  scene.setAxesVisualHint(false);
  scene.setCameraType(Camera.Type.ORTHOGRAPHIC);
  scene.setRadius(160);
  scene.showAll();
  iFrame = new InteractiveFrame(scene);
  iFrame2 = new InteractiveFrame(scene);
  iFrame3 = new InteractiveFrame(scene);
  iFrame4 = new InteractiveFrame(scene);
}

public void draw() {
  background(0);
  stroke(0);
  pushMatrix();
  iFrame.applyTransformation(scene);
  scene.drawAxes(50);
  shape(pointCloud);
  popMatrix();
  pushMatrix();
  iFrame2.applyTransformation(scene);
  scene.drawAxes(50);
  shape(pointCloud2);
  popMatrix();
  pushMatrix();
  iFrame3.applyTransformation(scene);
  scene.drawAxes(50);
  shape(pointCloud3);
  popMatrix();
  pushMatrix();
  iFrame4.applyTransformation(scene);
  scene.drawAxes(50);
  shape(pointCloud4);
  popMatrix();
}
