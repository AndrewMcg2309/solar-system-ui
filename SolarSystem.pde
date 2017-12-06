// Planets
float t, s;

float m, v, e, ma;

float ang;
float x, y;
Planet [] planet = new Planet [9]; 

int grid = 50; // change this number to 20 or 50, etc., if you want fewer grid lines


void setup()
{
  size(1500, 800, P3D);
  background(0);


  for (int i=0; i<9; i++)
  {
    float distFromSun =(i*20) + 60; 
    planet[i] = new Planet (distFromSun);
  }

  loadData();
  listData();

  // Sizes Of Sun
  s = 80;
  t = 0;
  
  m = 40;
  v = 40;
  e = 40;
  ma = 40;
}


ArrayList<Planet> planets = new ArrayList<Planet>();


//--------------------------------------------------Loading Data----------------------------------------------//

void loadData()
{
  Table table = loadTable("planets.csv", "header");
  for (TableRow row : table.rows())
  {
    Planet planet = new Planet(row);    
    planets.add(planet);
  }
}

//--------------------------------------------------Listing Data----------------------------------------------//

void listData()
{
  for (Planet planet : planets)
  {
    println(planet);
  }
}

void draw()
{
 
  background(0);
  float speedA = 20 * radians(t += (TWO_PI / 360));
//--------------------------------------------------Draw Grid-------------------------------------------------//

    stroke(255, 255, 255);
    strokeWeight(0.5);
    for (int i = 0; i < width; i+=grid) {
      line (i, 0, i, height);
    }
    for (int i = 0; i < height; i+=grid) {
      line (0, i, width, i);
    }
    
//--------------------------------------------Planets---TO SELECT-------------------------------------------------------//
  
  pushMatrix();
    
    //Mercury 
    translate(width / 9, height / 6);
    rotateY(speedA);
    noFill();
    stroke(255, 255, 0);
    strokeWeight(0.3);
    sphere(m);
    
    //Venus
    translate(0, 140);
    rotateY(speedA);
    noFill();
    stroke(255, 255, 0);
    strokeWeight(0.3);
    sphere(v);
    
    //Earth
    translate(0, 140);
    rotateY(speedA);
    noFill();
    stroke(255, 255, 0);
    strokeWeight(0.3);
    sphere(e);
    
    //Mars
    translate(0, 140);
    rotateY(speedA);
    noFill();
    stroke(255, 255, 0);
    strokeWeight(0.3);
    sphere(ma);
    
    
  popMatrix();
  

  //------------------------------------------Sun-----------------------------------------------------------------//

  pushMatrix();
    translate(width / 2, height / 2);
    rotateY(speedA);
    noFill();
    stroke(255, 255, 0);
    strokeWeight(0.3);
    sphere(s);
  popMatrix();

  //--------------------------------------------Planets---Rotating-------------------------------------------------------//

  translate(width/2, height/2);  

  pushMatrix();
  for (int i=0; i<9; i++) {
    noFill();
    stroke(255, 0, 0); 
    strokeWeight(2);
    ellipse(0, 0, (planet[i].distFromSun * 2), (planet[i].distFromSun * 2));
  } 

  for (int i=0; i<9; i++)
  {
    planet[i].render();
    planet[i].move();
  }
  popMatrix();
  
}