class MySolid {

  MyFace[] faces;
  int  nfaces;
  color c;
  
  MySolid(MyPoint[] inPoints, float h) {

    nfaces = 0;
    faces = new MyFace[inPoints.length + 2];

    //bottom
    faces[0] = new MyFace(inPoints);
    nfaces++;

    //top
    faces[nfaces] = new MyFace(inPoints);
    faces[nfaces].move(0, 0, h);
    nfaces++;


    MyPoint[] side;
    side = new MyPoint[4];
    for(int i=0; i<inPoints.length-1; i++) {
      side[0] = new MyPoint(faces[0].points[i].x,
                            faces[0].points[i].y,
                            faces[0].points[i].z);
      side[1] = new MyPoint(faces[0].points[i+1].x,
                            faces[0].points[i+1].y,
                            faces[0].points[i+1].z);
      side[2] = new MyPoint(faces[1].points[i+1].x,
                            faces[1].points[i+1].y,
                            faces[1].points[i+1].z);
      side[3] = new MyPoint(faces[1].points[i].x,
                            faces[1].points[i].y,
                            faces[1].points[i].z);
      faces[ nfaces] = new MyFace(side);
      nfaces++;
    }

    // last side face
    int last = inPoints.length-1;
    side[0] = new MyPoint(faces[0].points[last].x,
                          faces[0].points[last].y,
                          faces[0].points[last].z);
    side[1] = new MyPoint(faces[0].points[0].x,
                          faces[0].points[0].y,
                          faces[0].points[0].z);
    side[2] = new MyPoint(faces[1].points[0].x,
                          faces[1].points[0].y,
                          faces[1].points[0].z);
    side[3] = new MyPoint(faces[1].points[last].x,
                          faces[1].points[last].y,
                          faces[1].points[last].z);
    faces[ nfaces] = new MyFace(side);
    nfaces++;


    // reverse the order of the bottom face
    MyPoint[] revPoints;
    revPoints = new MyPoint[inPoints.length];
    for(int i=0; i<inPoints.length; i++) {
      revPoints[i] = new MyPoint(inPoints[inPoints.length-1-i].x,
      inPoints[inPoints.length-1-i].y,
      inPoints[inPoints.length-1-i].z);
    }
    faces[0] = new MyFace(revPoints);

  }

  void draw3d() {
    for(int i=0; i< nfaces; i++)
      if(faces[i].visible()) faces[i].draw3d();
  }

  void rotatex (float angle, MyPoint p) {
    for(int i=0; i< nfaces; i++)
      faces[i].rotatex(angle, p);
  }

  void rotatey (float angle, MyPoint p) {
    for(int i=0; i< nfaces; i++)
      faces[i].rotatey(angle, p);
  }

  void rotatez (float angle, MyPoint p) {
    for(int i=0; i< nfaces; i++)
      faces[i].rotatez(angle, p);
  }

  void myScale(float xs, float ys, float zs, MyPoint p) {
    for(int i=0; i< nfaces; i++)
      faces[i].myScale(xs, ys, zs, p);
  }

  void move(float xoff, float yoff, float zoff){
    for(int i=0; i< nfaces; i++)
      faces[i].move(xoff, yoff, zoff);
  }
  
  void setColor(color cin) {
    for(int i=0; i<nfaces; i++)
      faces[i].setColor(cin);
  }

}
