class MyPoint {
  float x, y, z;
  MyPoint(float xin, float yin, float zin) {
    x = xin;
    y = yin;
    z = zin;
  }
  
  void move(float xoff, float yoff, float zoff) {
    x += xoff;
    y += yoff;
    z += zoff;
  }
  
  void myScale(float sx, float sy, float sz, MyPoint p) {
    x = (x-p.x)*sx + p.x;
    y = (y-p.y)*sy + p.y;
    z = (z-p.z)*sz + p.z;
  }
  
  void rotatez(float angle, MyPoint p) {
    float tempx = (x-p.x)*cos(angle) - (y-p.y)*sin(angle) + p.x;
    float tempy = (y-p.y)*cos(angle) + (x-p.x)*sin(angle) + p.y;
    x = tempx;
    y = tempy;
  }
  
  void rotatex(float angle, MyPoint p) {
    float tempy = (y-p.y)*cos(angle) - (z-p.z)*sin(angle) + p.y;
    float tempz = (z-p.z)*cos(angle) + (y-p.y)*sin(angle) + p.z;
    y = tempy;
    z = tempz;
  }
  
  void rotatey(float angle, MyPoint p) {
    float tempx = (x-p.x)*cos(angle) - (z-p.z)*sin(angle) + p.x;
    float tempz = (z-p.z)*cos(angle) + (x-p.x)*sin(angle) + p.z;
    x = tempx;
    z = tempz;
  }
  
  float xscreen() {
    float sx = screenX(x,y,z);
    return sx;
  }
  
  float yscreen() {
    float sy = screenY(x, y, z);
    return sy;
  }
  
}
