//image variables need to be declared with PImage type
PImage mapRedDead2;
int z = 5;

//constant stuff
void setup() 
{
//[oreilly_visualizing-data.pdf, p. xx] = zooming in 
size(700, 600);

//map_ 7200x5400
mapRedDead2 = loadImage("map_all-red-dead-2.jpg");
image(mapRedDead2, -560*(z-2), -70*(z+7), 720*(z+0.5), 540*(z+0.5));
}


//non-constant stuff
void draw() 
{
  if (mousePressed == true)  
    {
    ellipse(mouseX, mouseY, 10, 10);
    }
}
