void setup()
{
  size(1500, 800);
  background(0);
 
  loadData();
  listData();
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
}