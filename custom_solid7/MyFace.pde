class MyFace {
  int npoints = 0;
  MyPoint[] points;
  color c = color(255,255,255);

  MyFace() {
    points = new MyPoint[0];
  }

  MyFace(MyPoint[] inPoints) {
    points = new MyPoint[inPoints.length];
    npoints = inPoints.length;
    for (int i=0; i<inPoints.length; i++)
      points[i] = 
        new MyPoint(inPoints[i].x, inPoints[i].y, inPoints[i].z);
  }

  void addPoint(float addX, float addY, float addZ) {
    npoints++;
    points = (MyPoint[])append(points, 
      new MyPoint(addX, addY, addZ));
  }
  
//  void setColor(color cin) {
//    c = cin;
//    setShades(c);
//    c = shadeTable[getShade()];
//  }

  void setColor(color cin) {
    c = cin;
  }
  
  void move(float xoff, float yoff, float zoff) {
    for(int i=0; i<npoints; i++)
      points[i].move(xoff, yoff, zoff);
  }
  
  void myScale(float sx, float sy, float sz, MyPoint p) {
    for(int i=0; i<npoints; i++)
      points[i].myScale(sx, sy, sz, p);
  }
  
  void rotatex(float angle, MyPoint p) {
    for(int i=0; i<npoints; i++)
      points[i].rotatex(angle, p);
  }
  
  void rotatey(float angle, MyPoint p) {
    for(int i=0; i<npoints; i++)
      points[i].rotatey(angle, p);
  }
  
  void rotatez(float angle, MyPoint p) {
    for(int i=0; i<npoints; i++)
      points[i].rotatez(angle, p);
  } 
  
  void draw3d() {
    fill(c);
    beginShape();
    for(int i=0; i<npoints; i++)
      vertex(points[i].x, points[i].y, points[i].z);
    endShape(CLOSE);
  }
  
  boolean visible() {
    float x1, y1, x2, y2, norm=0;
    int ahead1, ahead2;
    
    for(int i=0; i<npoints; i++) {
      ahead1 = i+1;
      ahead2 = i+2;
      if(i == (npoints-2)) ahead2 = 0;
      if(i == (npoints-1)) {
        ahead2 = 1;
        ahead1 = 0;
      }
      // make vector 1
      x1 = points[ahead1].xscreen() - points[i].xscreen();
      y1 = points[ahead1].yscreen() - points[i].yscreen();
      // make vector 2
      x2 = points[ahead1].xscreen() - points[ahead2].xscreen();
      y2 = points[ahead1].yscreen() - points[ahead2].yscreen();
      // cross product
      norm += (x1*y2 - y1*x2);
    }
    if(norm < 0.0) return false;   // if clockwise
    else return true;              // else counter
  }
  
  color[] shadeTable;
  void setShades(color c) {
    float r, g, b;
    r = red(c);
    g = green(c);
    b = blue(c);
    r /= 255.;
    g /= 255.;
    b /= 255.;
    shadeTable = new color[256];
    for(int i=0; i<255; i++)
      shadeTable[i] = color((int)(r*i),(int)(g*i),(int)(b*i));
  }
  
  MyVector vlight = new MyVector(1.,1.,1.);
  int getShade() {
    int shade;
    MyVector v1 = new MyVector();
    MyVector v2 = new MyVector();
    vlight.myNorm();
    v1.buildVector(points[0], points[1]).myNorm();
    v2.buildVector(points[1], points[2]).myNorm();
    v1.myCross(v2);
    //if(v1.w < 0) { shade = 0; }
    //else {
    //shade = (int)(255*v1.dot(vlight));
    //println(shade);
    shade = int(100.+(155.*v1.myDot(vlight)));
    if(shade <= 0) shade = 0;
    //}
    return shade;
  }
  
}
