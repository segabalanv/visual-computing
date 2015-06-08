class MyVector {
  float u, v, w;
  
  MyVector() {
    u=0; v=0; w=0;
  }
  
  MyVector(float uin, float vin, float win) {
    u = uin;
    v = vin;
    w = win;
  }
  
  MyVector buildVector(MyPoint vert1, MyPoint vert2) {
    u = vert2.x - vert1.x;
    v = vert2.y - vert1.y;
    w = vert2.z - vert1.z;
    return this;
  }
  
  void myNorm() {
    float t = sqrt(u*u + v*v + w*w);
    u = u/t;
    v = v/t;
    w = w/t;
  }
  
  void myCross(MyVector v1) {
    MyVector temp = new MyVector(0,0,0);
    temp.u = v*v1.w - w*v1.v;
    temp.v = w*v1.v - u*v1.w;
    temp.w = u*v1.u - v*v1.v;
    u = temp.u;
    v = temp.v;
    w = temp.w;
  }
  
  float myDot(MyVector v1) {
    return v1.u*u + v1.v*v + v1.w*w;
  }
  
}
