// off-screen renderer
PGraphics pg;
// map stored in a .gif image
PImage img;
// square coordinates and size
float bx, by; int sx = 128, sy = 72;
// scaling factor
float sf = 0.5;
// dragging related variables
float xOffset = 0.0;
float yOffset = 0.0;
boolean overBox = false;
boolean locked = false;

void setup() {
  size(640,360);
  // create the space for the minimap
  pg = createGraphics(242,204);
  // load the map
  img = loadImage("map.gif");
  bx = 0; by = 0;
}

void draw() {
  background(0);
  // put the map in the main canvas it will move depending
  // on the position of a rectangle in the minimap that
  // follows the mouse pointer.
  image(img,map(bx,0,242,0,-img.width/sf),
        map(by+156,156,360,0,-img.height/sf),
        img.width/sf, img.height/sf);
  
  // test if the cursor is over the box
  if(mouseX > bx && mouseX < bx+(sx*sf) &&
     mouseY > by+156 && mouseY < by+156+(sy*sf)) {
     overBox = true;
   } else {
     overBox = false;
   }
  
  // start drawing the minimap in the lower-left corner
  pg.beginDraw();
  // load down-scaled map with a 80% reduction ratio
  pg.image(img,0,0,img.width*0.2,img.height*0.2);
  // define an empty rectangle with white borders, to represent
  // the part of the map that is actually appearing on the main
  // canvas
  pg.noFill();
  pg.stroke(255);
  pg.rect(bx,by,sx*sf,sy*sf);
  
  pg.endDraw(); 
  
  // show the minimap on the screen
  image(pg,0,156);
}

void mousePressed() {
  if(overBox) {
    locked = true;
  } else {
    locked = false;
  }
  xOffset = mouseX-bx;
  yOffset = mouseY-by;
}

void mouseDragged() {
  if(locked) {
    bx = constrain(mouseX-xOffset,0,242-(sx*sf));
    by = constrain(mouseY-yOffset,0,pg.height-(sy*sf));
  }
}

void mouseReleased() {
  locked = false;
}

void keyPressed() {
  if(key == CODED) {
    if(keyCode == UP) {
      // TODO: constrain value
      sf -= 0.1;
    }
    if(keyCode == DOWN) {
      // TODO: constrain value
      sf += 0.1;
    }
  }
}
