class MyFace {
  int npoints = 0;
  MyPoint[] points;

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
    beginShape(QUADS);
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
    if(norm > 0.0) return false;   // if clockwise
    else return true;              // else counter
  }
  
}
