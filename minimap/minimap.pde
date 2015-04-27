// off-screen renderer
PGraphics pg;
// map stored in a .gif image
PImage img;

void setup() {
  size(640,360);
  // create the space for the minimap
  pg = createGraphics(242,204);
  // load the map
  img = loadImage("map.gif");
}

void draw() {
  background(0);
  // put the map in the main canvas it will move depending
  // on the position of a rectangle in the minimap that
  // follows the mouse pointer.
  image(img,map(mouseX,0,242,0,-1212),map(mouseY,156,360,0,-1022));
  
  // start drawing the minimap in the lower-left corner
  pg.beginDraw();
  // load down-scaled map with a 80% reduction ratio
  pg.image(img,0,0,img.width*0.2,img.height*0.2);
  // define an empty rectangle with white borders, to represent
  // the part of the map that is actually appearing on the main
  // canvas
  pg.noFill();
  pg.stroke(255);
  pg.rect(mouseX,mouseY-156,128,72);
  
  pg.endDraw(); 
  
  // show the minimap on the screen
  image(pg,0,156);
}
