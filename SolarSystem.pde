// Planets
float t, s;

float m, v, e, ma;

float moon = 10;

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
  
  m = 70;
  v = 70;
  e = 70;
  ma = 70;
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

    /*stroke(255, 255, 255);
    strokeWeight(0.5);
    for (int i = 0; i < width; i+=grid) {
      line (i, 0, i, height);
    }
    for (int i = 0; i < height; i+=grid) {
      line (0, i, width, i);
    }*/
    
//--------------------------------------------Planets---TO SELECT---LEFT----------------------------------------------------//
  
  pushMatrix();
    
    //Mercury 
    translate(width / 9, height / 7);
    rotateY(speedA);
    noFill();
    stroke(255, 153, 51);
    strokeWeight(0.3);
    sphere(m);
    
    //Venus
    translate(0, 175);
    rotateY(speedA);
    noFill();
    stroke(128, 128, 128);
    strokeWeight(0.3);
    sphere(v);
    
    //Earth
    translate(0, 175);
    rotateY(speedA);
    noFill();
    stroke(102, 255, 102);
    strokeWeight(0.3);
    sphere(e);
        
        //moon
        translate(70, -50);
        rotateY(speedA);
        fill(255,255,255);
        stroke(102, 255, 102);
        strokeWeight(0.3);
        sphere(moon);
        
        
    popMatrix();
    
    pushMatrix();
    
    //Mars
    translate(width / 9, height / 7 + 525);
    rotateY(speedA);
    noFill();
    stroke(255, 51, 0);
    strokeWeight(0.3);
    sphere(ma);
    
    
  popMatrix();
  
//--------------------------------------------Planets---TO SELECT---RIGHT----------------------------------------------------//
  
  pushMatrix();
  
  //Jupiter
    translate(width - (width / 9), height / 7);
    rotateY(speedA);
    noFill();
    stroke(153, 102, 0);
    strokeWeight(0.3);
    sphere(v);
    
   //Saturn
    translate(0, 175);
    rotateY(speedA);
    lights();
    noFill();
    stroke(255, 204, 102);
    strokeWeight(0.3);
    sphere(m);
    strokeWeight(1);
    rotateX(HALF_PI-.45);
    ellipse(0,0,240,240);
  popMatrix();
  
  pushMatrix();

   //Uranus
    translate(width - (width / 9), height / 7 + 350);
    rotateY(speedA);
    noFill();
    stroke(0, 153, 255);
    strokeWeight(0.3);
    sphere(e);
    
   //Neptune
    translate(0, 175);
    rotateY(speedA);
    noFill();
    stroke(153, 51, 153);
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