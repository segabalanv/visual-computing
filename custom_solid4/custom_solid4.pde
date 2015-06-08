MyPoint [] points;
MySolid solid;
MyPoint origin = new MyPoint(0,0,0);

void setup() {
  size(500,500,P3D);
  camera(70,35,120,0,0,0,0,1,0);
  int nsides = 6;
  points = new MyPoint[nsides];
  for(int i=0; i<nsides; i++)
    points[i] = new MyPoint((40.*sin((360./nsides)*i*PI/180.)),
                             40.*cos((360./nsides)*i*PI/180.),0);
  solid = new MySolid(points, 20.);
  
  for(int i=0; i<solid.nfaces; i++)
    solid.faces[i].setColor(color(random(255), 
                        random(255), random(255)));
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
