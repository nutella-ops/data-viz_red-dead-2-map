//image variables need to be declared with PImage type
PImage mapRedDead2;
int z = 5;

//circle diam multiplier
final int mul = 4;

//constant stuff
void setup() 
{
  //[oreilly_visualizing-data.pdf, p. xx] = zooming in 
  size(700, 600);

  //map_ 7200x5400
  mapRedDead2 = loadImage("../res/map_all-red-dead-2.jpg");
  image(mapRedDead2, -560*(z-2), -70*(z+7), 720*(z+0.5), 540*(z+0.5));
}


//non-constant stuff
void draw() 
{
  
}

// Mouse click event handler
void mouseClicked()
{
    //fill(r,  g , b, transparency)
    fill(0, 200, 0, 10);
    noStroke();
    ellipse(mouseX, mouseY, 10*mul, 10*mul);
}
