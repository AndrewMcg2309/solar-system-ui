// Planets
float t, s;
float ang;
float x,y;
Planet [] planet = new Planet [9]; 

float border = 50;

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
  
  
  //----------------------------Sun---------------------------------------
  
  float speedA = 20 * radians(t += (TWO_PI / 360));
  //float speedB = (20 * radians(t += (TWO_PI / 360)) / 2);
  
  pushMatrix();
    translate(width / 2, height / 2);
    rotateY(speedA);
    noFill();
    stroke(255, 255, 0);
    strokeWeight(0.3);
    sphere(s);
  popMatrix();
  
 //-------------------------------Planets-----------------------------------
 
  translate(width/2, height/2);  
  
     
       noFill();
       stroke(0, 255, 0); 
       strokeWeight(1);
       ellipse(0, 0, (planet[0].distFromSun * 2), (planet[0].distFromSun * 2));
       
       noFill();
       stroke(255, 0, 0); 
       strokeWeight(1);
       ellipse(0, 0, (planet[1].distFromSun * 2), (planet[1].distFromSun * 2));
       
       noFill();
       stroke(0, 0, 255); 
       strokeWeight(1);
       ellipse(0, 0, (planet[2].distFromSun * 2), (planet[2].distFromSun * 2));
       
       noFill();
       stroke(255, 255, 0); 
       strokeWeight(1);
       ellipse(0, 0, (planet[3].distFromSun * 2), (planet[3].distFromSun * 2));
       
       noFill();
       stroke(255, 0, 255); 
       strokeWeight(1);
       ellipse(0, 0, (planet[4].distFromSun * 2), (planet[4].distFromSun * 2));
       
       noFill();
       stroke(0, 255, 255); 
       strokeWeight(1);
       ellipse(0, 0, (planet[5].distFromSun * 2), (planet[5].distFromSun * 2));
       
    
     
     
    for (int i=0; i<9; i++)
    {
      planet[i].render();
      
       planet[i].move(); 
       
    }

  
}