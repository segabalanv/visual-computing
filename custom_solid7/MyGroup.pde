class MyGroup {
  MySolid[] solids;
  int nsolids;
  
  MyGroup () {
    solids = new MySolid[0];
  }
  
  void addSolids(MyPoint[] points, float hite) {
    nsolids++;
    solids = (MySolid[])append(solids, new MySolid(points, hite));
  }
  
  void draw3d() {
    painter();
    for(int i=0; i<nsolids; i++)
      solids[i].draw3d();
  }
  
  void rotatex(float angle, MyPoint p) {
    for(int i=0; i<nsolids; i++)
      solids[i].rotatex(angle, p);
  }
  
  void rotatey(float angle, MyPoint p) {
    for(int i=0; i<nsolids; i++)
      solids[i].rotatey(angle, p);
  }
  
  void rotatez(float angle, MyPoint p) {
    for(int i=0; i<nsolids; i++)
      solids[i].rotatez(angle, p);
  }
  
  void myScale(float xs, float ys, float zs, MyPoint p) {
    for(int i=0; i<nsolids; i++)
      solids[i].myScale(xs, ys, zs, p);
  }
  
  void move(float xoff, float yoff, float zoff) {
    for(int i=0; i<nsolids; i++)
      solids[i].move(xoff, yoff, zoff);
  }
  
  void painter() {
    float[] zc;
    zc = new float[nsolids];
    int knt;
    int centerz;
    
    for(int i=0; i<nsolids; i++) {
      centerz = 0;
      knt = 0;
      for(int j=0; j<solids[i].nfaces;j++) {
        for(int k=0; k<solids[i].faces[j].npoints; k++) {
          centerz += solids[i].faces[j].points[k].z;
          knt++;
        }
      }
      zc[i] = centerz/knt;
    }
    
    for(int i=0; i<nsolids; i++) {
      for(int j=0; j<nsolids; j++) {
        if(zc[i] < zc[j]) {
          MySolid tobj = solids[i];
          solids[i] = solids[j];
          solids[j] = tobj;
          float temp = zc[i];
          zc[i] = zc[j];
          zc[j] = temp;
        }
      }
    }
  }
  
}
