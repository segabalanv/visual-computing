MyPoint [] points;
MySolid solid;
MyPoint origin = new MyPoint(0,0,0);
void setup(){
  size(200, 200, P3D);
  camera(70.0, 35.0, 120.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0);
  noFill();
  points = new MyPoint[4];
  points[0] = new MyPoint( 50, 50, 0);
  points[1] = new MyPoint(-50, 50, 0);
  points[2] = new MyPoint(-50, -50, 0);
  points[3] = new MyPoint( 50, -50, 0);
  solid = new MySolid(points, 20.);
  hint(DISABLE_DEPTH_TEST);
}
int xf, yf;
void draw(){
  background(255);
  solid.rotatex((mouseX - xf) * PI/180.,origin);
  solid.rotatey((mouseY - yf) * PI/180.,origin);
  solid.draw3d();
  xf = mouseX;
  yf = mouseY;
}

