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
  
}
