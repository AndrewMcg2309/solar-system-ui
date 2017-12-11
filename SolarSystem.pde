// Planets
  float t, ang, x, y;

//PLanets - Moon
  float m, v, e, ma, j, sa, u, n, p;
  float moon = 10;

//Data From Classes
  Planet [] planet = new Planet [9];
  ArrayList<Planet> planets = new ArrayList<Planet>();
  Sun sun = new Sun(80, 20 * radians(t += (TWO_PI / 360)));

int click = 0;

void setup()
{
  size(1500, 800, P3D);
  loadData();
  listData();
  
  // For Planets - Distance From Sun + Each Other
    for (int i = 0 ; i < 9 ; i++) 
    {
      float distFromSun = ( i * 20 ) + 60; 
      planet[i] = new Planet (distFromSun);
    }

  // Mercury Venus Earth Mars
    m = 35; v = 70; e = 80; ma = 45;
  
  // Jupiter Saturn Uranus Neptune
    j = 90; sa = 70; u = 45; n = 35;
  
    t = 0;
}



// Load Data
  void loadData()
  {
    Table table = loadTable("planets.csv", "header");
    for (TableRow row : table.rows())
    {
      Planet planet = new Planet(row);    
      planets.add(planet);
    }
  }



//List Data
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
  
  //Rotation Speed
    float rotateX = 20 * radians(t += (TWO_PI / 360));

    
  //Big Planets - Left
    pushMatrix();
    
      //Mercury 
        translate(width / 9, height / 7);
        rotateY(rotateX);
        noFill();
        stroke(255, 153, 51);
        strokeWeight(0.3);
        sphere(m);
      
      //Venus
        translate(0, 175);
        rotateY(rotateX);
        noFill();
        stroke(128, 128, 128);
        strokeWeight(0.3);
        sphere(v);
      
      //Earth
        translate(0, 175);
        rotateY(rotateX);
        noFill();
        stroke(102, 255, 102);
        strokeWeight(0.3);
        sphere(e);
          
          //moon
            translate(100, -50);
            rotateY(rotateX);
            noFill();
            stroke(128, 128, 128);
            strokeWeight(0.3);
            sphere(moon);
          
      popMatrix();
      
      pushMatrix();
      
      //Mars
        translate(width / 9, height / 7 + 525);
        rotateY(rotateX);
        noFill();
        stroke(255, 51, 0);
        strokeWeight(0.3);
        sphere(ma);
    
      popMatrix();
  
  //Big Planets - Right
  
      pushMatrix();
  
    //Jupiter
      translate(width - (width / 9), height / 7);
      rotateY(rotateX);
      noFill();
      stroke(153, 102, 0);
      strokeWeight(0.3);
      sphere(j);
      
     //Saturn
      translate(0, 175);
      rotateY(rotateX);
      lights();
      noFill();
      stroke(255, 204, 102);
      strokeWeight(0.3);
      sphere(sa);
      
        //Saturn Rings
          strokeWeight(1);
          rotateX(HALF_PI-.45);
          ellipse(0, 0, 240, 240);
          ellipse(0, 0, 220, 220);
          ellipse(0, 0, 200, 200);
          ellipse(0, 0, 180, 180);
        
    popMatrix();
    
    pushMatrix();
  
     //Uranus
      translate(width - (width / 9), height / 7 + 350);
      rotateY(rotateX);
      noFill();
      stroke(0, 153, 255);
      strokeWeight(0.3);
      sphere(u);
        
        //Uranus Ring
          strokeWeight(1);
          rotateX(HALF_PI+.45);
          ellipse(0, 0, 150, 150);
        
    popMatrix();
    
    pushMatrix();
    
     //Neptune
      translate(width - (width / 9), height / 7 + (350 + 175));
      rotateY(rotateX);
      noFill();
      stroke(153, 51, 153);
      strokeWeight(0.3);
      sphere(n);
        
    popMatrix();
  

  //Sun
    pushMatrix();
      translate(width / 2, height / 2);
      rotateY(rotateX);
      noFill();
      stroke(255, 255, 0);
      strokeWeight(0.3);
      sphere(sun.sunSize);
    popMatrix();

  
  //Initial Position of Rings
    translate(width/2, height/2);  

  //Planets Rotating Around Sun
    pushMatrix();
      for (int i = 0 ; i < 9 ; i++) 
      {
        noFill();
        stroke(255, 0, 0); 
        strokeWeight(1);
        //Draw Planet
          ellipse(0, 0, (planet[i].distFromSun * 2), (planet[i].distFromSun * 2));
      } 
    
      for (int i = 0 ; i < 9 ; i++)
      {
        
        planet[i].render();
        planet[i].move();
      }
    popMatrix();
  
  
  
  
  //For Mouse Position - Floating Over Planets
  
  //Mercury
    if(mouseX >= 125 && mouseX <= 204 && mouseY >= 85 && mouseY <= 165)
    {
      m = 80;
      String merText = "Size = " + planet[0].radius;
      fill(255, 255, 255);
      text(merText, 0, 0, 100, 100);  
    }
    else
    {
      m = 35;  
    }
}

//-----------------------------------------------When clicked--------------------------------//

void mouseClicked()
{
  if( click != 50)
  {
    fill(255,255, 255);
    text(("x = " + mouseX), 400, 20);
    text(("y = " + mouseY), 400, 100);
  }
  
 
}