MyPoint[] points;
MyGroup group;
MyPoint origin = new MyPoint(0,0,0);
void setup() {
  size(500,500,P3D);
  camera(70,35,120,0,0,0,0,1,0);
  int nsides = 6;
  points = new MyPoint[nsides];
  for(int i=0; i<nsides; i++)
    points[i] = new MyPoint((40.*sin((360./nsides)*i*PI/180.)),
                            (40.*cos((360./nsides)*i*PI/180.)),0);
  group = new MyGroup();
  color col;
  for(int i=0; i<10; i++) {
    group.addSolids(points, 20.);
    col = color(random(255),random(255),random(255));
    group.solids[i].setColor(col);
    //group.solids[i].myScale(.3,.3,.3,origin);
    group.solids[i].move(0.,50.,i*30);
  }
  hint(DISABLE_DEPTH_TEST);
  noStroke();
}

int xf, yf;
void draw() {
  background(255);
  lights();
  group.rotatex((mouseX-xf)*PI/180., origin);
  group.rotatey((mouseY-yf)*PI/180., origin);
  group.draw3d();
  xf = mouseX;
  yf = mouseY;
}
