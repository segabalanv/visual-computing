import remixlab.proscene.*;
import remixlab.dandelion.core.*;
import remixlab.dandelion.geom.*;

PrintWriter output;

String[] lines;
PShape pointCloud, pointCloud2, pointCloud3, pointCloud4;

Scene scene;
InteractiveFrame iFrame, iFrame2, iFrame3, iFrame4;
int[][] colors1, colors2, colors3, colors4;

public void setup() {
  size(600,600,P3D);
  output = createWriter("assembled.off");
  output.println("COFF");  
  lines = loadStrings("Im93_mod.off");
  String[] pfl = splitTokens(lines[1]);
  int size = int(pfl[0]);
  colors1 = new int[size][3];
  pointCloud = createShape();
  pointCloud.beginShape(POINTS);
  for(int i=0; i<size; i++) {
    String[] pointz = splitTokens(lines[2+i]);
    if(pointz.length != 6)
      continue;
    colors1[i][0] = int(pointz[3]);
    colors1[i][1] = int(pointz[4]);
    colors1[i][2] = int(pointz[5]);
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
  colors2 = new int[size][3];
  pointCloud2 = createShape();
  pointCloud2.beginShape(POINTS);
  for(int i=0; i<size; i++) {
    String[] pointz = splitTokens(lines[2+i]);
    if(pointz.length != 6)
      continue;
    colors2[i][0] = int(pointz[3]);
    colors2[i][1] = int(pointz[4]);
    colors2[i][2] = int(pointz[5]);
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
  colors3 = new int[size][3];
  pointCloud3 = createShape();
  pointCloud3.beginShape(POINTS);
  for(int i=0; i<size; i++) {
    String[] pointz = splitTokens(lines[2+i]);
    if(pointz.length != 6)
      continue;
    colors3[i][0] = int(pointz[3]);
    colors3[i][1] = int(pointz[4]);
    colors3[i][2] = int(pointz[5]);
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
  colors4 = new int[size][3];
  pointCloud4 = createShape();
  pointCloud4.beginShape(POINTS);
  for(int i=0; i<size; i++) {
    String[] pointz = splitTokens(lines[2+i]);
    if(pointz.length != 6)
      continue;
    colors4[i][0] = int(pointz[3]);
    colors4[i][1] = int(pointz[4]);
    colors4[i][2] = int(pointz[5]);
    pointCloud4.stroke(float(pointz[3]),float(pointz[4]),
                      float(pointz[5]));
    pointCloud4.vertex((float(pointz[0])*400)+30, 
                      (float(pointz[1])*400)-80,
                      (float(pointz[2])*400)-370);
  }
  pointCloud4.endShape();
  
  scene = new Scene(this);
  scene.setAxesVisualHint(true);
  scene.setCameraType(Camera.Type.ORTHOGRAPHIC);
  scene.setRadius(160);
  scene.showAll();
  iFrame = new InteractiveFrame(scene);
  iFrame.setGrabsInputThreshold(100);
  iFrame2 = new InteractiveFrame(scene);
  iFrame2.setGrabsInputThreshold(100);
  iFrame3 = new InteractiveFrame(scene);
  iFrame3.setGrabsInputThreshold(100);
  iFrame4 = new InteractiveFrame(scene);
  iFrame4.setGrabsInputThreshold(100);
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

void keyPressed() {
  if (key == 'q') {
    float xcoord, ycoord, zcoord;
    int size1 = pointCloud.getVertexCount();
    int size2 = pointCloud2.getVertexCount();
    int size3 = pointCloud3.getVertexCount();
    int size4 = pointCloud4.getVertexCount();
    Vec tor = new Vec();
    output.println((size1+size2+size3+size3)+"\t0\t0");
    for(int i=0; i<size1; i++) {
      xcoord = pointCloud.getVertex(i).x + iFrame.position().x();
      ycoord = pointCloud.getVertex(i).y + iFrame.position().y();
      zcoord = pointCloud.getVertex(i).z + iFrame.position().z();
      tor.setX(xcoord); tor.setY(ycoord); tor.setZ(zcoord);
      tor = Quat.multiply((Quat)iFrame.orientation(), tor);
      output.println(tor.x()+"\t"+tor.y()+"\t"+tor.z()+"\t"+
                     colors1[i][0]+"\t"+colors1[i][1]+"\t"+
                     colors1[i][2]);
    }
    for(int i=0; i<size2; i++) {
      xcoord = pointCloud2.getVertex(i).x + iFrame2.position().x();
      ycoord = pointCloud2.getVertex(i).y + iFrame2.position().y();
      zcoord = pointCloud2.getVertex(i).z + iFrame2.position().z();
      tor.setX(xcoord); tor.setY(ycoord); tor.setZ(zcoord);
      tor = Quat.multiply((Quat)iFrame2.orientation(), tor);
      output.println(tor.x()+"\t"+tor.y()+"\t"+tor.z()+"\t"+
                     colors2[i][0]+"\t"+colors2[i][1]+"\t"+
                     colors2[i][2]);
    }
    for(int i=0; i<size3; i++) {
      xcoord = pointCloud3.getVertex(i).x + iFrame3.position().x();
      ycoord = pointCloud3.getVertex(i).y + iFrame3.position().y();
      zcoord = pointCloud3.getVertex(i).z + iFrame3.position().z();
      tor.setX(xcoord); tor.setY(ycoord); tor.setZ(zcoord);
      tor = Quat.multiply((Quat)iFrame3.orientation(), tor);
      output.println(tor.x()+"\t"+tor.y()+"\t"+tor.z()+"\t"+
                     colors3[i][0]+"\t"+colors3[i][1]+"\t"+
                     colors3[i][2]);
    }
    for(int i=0; i<size4; i++) {
      xcoord = pointCloud4.getVertex(i).x + iFrame4.position().x();
      ycoord = pointCloud4.getVertex(i).y + iFrame4.position().y();
      zcoord = pointCloud4.getVertex(i).z + iFrame4.position().z();
      tor.setX(xcoord); tor.setY(ycoord); tor.setZ(zcoord);
      tor = Quat.multiply((Quat)iFrame4.orientation(), tor);
      output.println(tor.x()+"\t"+tor.y()+"\t"+tor.z()+"\t"+
                     colors4[i][0]+"\t"+colors4[i][1]+"\t"+
                     colors4[i][2]);
    }
//    Vec test = new Vec(pointCloud.getVertex(0).x,
//                       pointCloud.getVertex(0).y,
//                       pointCloud.getVertex(0).z);
//    Quat thisQuat = (Quat)iFrame.orientation();
//    test = Quat.multiply(thisQuat, test);
//    println(test);
    output.flush(); output.close();
    println("success!");
  }
}
