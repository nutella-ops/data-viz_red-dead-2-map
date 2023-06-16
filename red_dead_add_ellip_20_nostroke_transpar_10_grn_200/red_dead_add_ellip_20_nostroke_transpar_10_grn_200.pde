import java.lang.Math;

//image variables need to be declared with PImage type
PImage mapRedDead2;
int z = 5;

//circle diam multiplier
public final int mul = 4;

// Width that the image is displayed at (not necessarily the original width)
public int dispWidth;
// Height that the image is displayed at (not necessarily the original height)
public int dispHeight;

//constant stuff
void setup() 
{
  //[oreilly_visualizing-data.pdf, p. xx] = zooming in 
  size(1296, 972);

  //map_ 7200x5400
  mapRedDead2 = loadImage("../res/map_all-red-dead-2.jpg");
  image(mapRedDead2, -1 * mapRedDead2.width / 2 + width / 2, -1 * mapRedDead2.height / 2 + height / 2);
  dispWidth = mapRedDead2.width;
  dispHeight = mapRedDead2.height;
}


//non-constant stuff
void draw() 
{
  
}

/**
 * Mouse click event handler
 * @see https://processing.org/reference/mouseClicked_.html
 */
void mouseClicked()
{
    //fill(r,  g , b, transparency)
    fill(0, 200, 0, 10);
    noStroke();
    ellipse(mouseX, mouseY, 10*mul, 10*mul);
}

/**
 * Mouse wheel event handler
 * @see https://processing.org/reference/mouseWheel_.html
 */
void mouseWheel(MouseEvent ev)
{
  final float distance = ev.getCount();
  final float scaleFactor = 1 + 0.05 * distance * -1;
  
  final int newDispHeight = (int)Math.round(dispHeight * scaleFactor);
  final int newDispWidth = (int)Math.round(dispWidth * scaleFactor);
  
  // Prevent zooming out further than the size of the window
  if(newDispHeight <= height && newDispWidth <= width) return;
  
  // Prevent zooming in further than the full resolution of the image
  if(newDispHeight >= mapRedDead2.height) return;
  
  dispWidth = newDispWidth;
  dispHeight = newDispHeight;
  image(mapRedDead2, -1 * dispWidth / 2 + width / 2, -1 * dispHeight / 2 + height / 2, dispWidth, dispHeight); 
}
