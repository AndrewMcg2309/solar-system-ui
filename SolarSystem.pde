float r, t;

void setup()
{
  size(1500, 800, P3D);
  background(0);
  
  r = 20;       // sphere's radius
  t = 0;         // rotation accumulator
 
  loadData();
  listData();
  
  drawPlanets();
}


ArrayList<Planet> planets = new ArrayList<Planet>();

//--------------------------------------------------Loading Data----------------------------------------------//
void loadData()
{
  Table table = loadTable("planets.csv", "header");
  for(TableRow row:table.rows())
  {
    Planet planet = new Planet(row);    
    planets.add(planet);
  }
}

//--------------------------------------------------Listing Data----------------------------------------------//

void listData()
{
  for(Planet planet:planets)
  {
    println(planet);
  }
}

void draw()
{
  // Sun
  background(0);
  
  float speed = 10 * radians(t += (TWO_PI / 360));
  
  translate(width / 2, height / 2);
  rotateY(speed);
  noFill();
  stroke(255, 255, 0);
  strokeWeight(0.1);
  sphere(r);
}

void drawPlanets()
{
  background(0);
  float speed = 10 * radians(t += (TWO_PI / 360));
  
  pushMatrix();
  
  translate(120, 100);
  rotateY(speed);
  noFill();
  stroke(0,255,0);
  strokeWeight(0.5);
  sphere(r);
  
  popMatrix();
}