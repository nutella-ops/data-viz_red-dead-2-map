import java.lang.Math;

//image variables need to be declared with PImage type
PImage mapRedDead2;
int z = 5;

//circle diam multiplier
public final int mul = 4;

public int dispWidth;
public int dispHeight;

//constant stuff
void setup() 
{
  //[oreilly_visualizing-data.pdf, p. xx] = zooming in 
  size(1296, 972);

  //map_ 7200x5400
  mapRedDead2 = loadImage("../res/map_all-red-dead-2.jpg");
  //image(mapRedDead2, -560*(z-2), -70*(z+7), 720*(z+0.5), 540*(z+0.5));
  dispWidth = mapRedDead2.width;
  dispHeight = mapRedDead2.height;
  image(mapRedDead2, 0, 0);
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

void mouseWheel(MouseEvent ev)
{
  final float distance = ev.getCount();
  final float scaleFactor = 1 + 0.05 * distance * -1;
  
  final int newDispHeight = (int)(dispHeight * scaleFactor);
  final int newDispWidth = (int)(dispWidth * scaleFactor);
  
  // Prevent zooming out further than the size of the window
  if(newDispHeight <= height && newDispWidth <= width) return;
  
  // Prevent zooming in further than the full resolution of the image
  if(newDispHeight >= mapRedDead2.height) return;
  
  dispWidth = newDispWidth;
  dispHeight = newDispHeight;
  image(mapRedDead2, 0, 0, dispWidth, dispHeight); 
}
