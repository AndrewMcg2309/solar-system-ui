//Image
PImage bk;

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
  bk = loadImage("space.jpg");
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
    j = 90; sa = 70; u = 45; n = 35; p = 20;
  
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
  background(bk);
  drawGrid();
  
  //Rotation Speed
    float rotateX = 20 * radians(t += (TWO_PI / 360));

    
  //Big Planets - Left
    pushMatrix();
    
      //Mercury 
        translate(width / 9, height / 7);
        rotateY(rotateX);
        noFill();
        stroke(255, 153, 51);
        strokeWeight(0.6);
        sphere(m);
      
      //Venus
        translate(0, 175);
        rotateY(rotateX);
        noFill();
        stroke(128, 128, 128);
        strokeWeight(0.6);
        sphere(v);
      
      //Earth
        translate(0, 175);
        rotateY(rotateX);
        noFill();
        stroke(102, 255, 102);
        strokeWeight(0.6);
        sphere(e);
          
          //moon
            translate(100, -50);
            rotateY(rotateX);
            noFill();
            stroke(128, 128, 128);
            strokeWeight(0.4);
            sphere(moon);
          
      popMatrix();
      
      pushMatrix();
      
      //Mars
        translate(width / 9, height / 7 + 525);
        rotateY(rotateX);
        noFill();
        stroke(255, 51, 0);
        strokeWeight(0.6);
        sphere(ma);
    
      popMatrix();
  
  //Big Planets - Right
  
      pushMatrix();
  
    //Jupiter
      translate(width - (width / 9), height / 5);
      rotateY(rotateX);
      noFill();
      stroke(153, 102, 0);
      strokeWeight(0.6);
      sphere(j);
      
     //Saturn
      translate(0, 190);
      rotateY(rotateX);
      lights();
      noFill();
      stroke(255, 204, 102);
      strokeWeight(0.6);
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
      translate(width - (width / 9), height / 7 + 400);
      rotateY(rotateX);
      noFill();
      stroke(0, 153, 255);
      strokeWeight(0.6);
      sphere(u);
        
        //Uranus Ring
          strokeWeight(1);
          rotateX(HALF_PI+.45);
          ellipse(0, 0, 150, 150);
        
    popMatrix();
    
    pushMatrix();
    
     //Neptune
      translate(width - (width / 9), height / 7 + (350 + 200));
      rotateY(rotateX);
      noFill();
      stroke(153, 51, 153);
      strokeWeight(0.6);
      sphere(n);
        
    popMatrix();
    
    pushMatrix();
    
    //Pluto
      translate(width / 2, 755);
      rotateY(rotateX);
      noFill();
      stroke(153, 102, 0);
      strokeWeight(0.4);
      sphere(p);
        
    popMatrix();


  //Sun
    pushMatrix();
      translate(width / 2, height / 2);
      rotateY(rotateX);
      noFill();
      stroke(255, 255, 0);
      strokeWeight(0.6);
      sphere(sun.sunSize);
    popMatrix();
    
    

  
  //Initial Position of Rings
    translate(width/2, height/2);  

  //Planets Rotating Around Sun
    pushMatrix();
      for (int i = 0 ; i < 9 ; i++) 
      {
        noFill();
        stroke(0, 153, 255); 
        strokeWeight(2);
        //Draw Planet
          ellipse(0, 0, (planet[i].distFromSun * 2), (planet[i].distFromSun * 2));
      } 
    
      for (int i = 0 ; i < 9 ; i++)
      {
        
        planet[i].render();
        planet[i].move();
      }
    popMatrix();
  
  
  
  
  //For Mouse Position - Floating Over Planets - Left Planets
  
  //Mercury
    if(mouseX >= 125 && mouseX <= 204 && mouseY >= 85 && mouseY <= 165)
    {
      m = 80;
      String merText = "MERCURY     RADIUS = 2440.0,    SPEED = 47.87,      FROM SUN = 57.9,      LIFE? = false,      ROTATION = 0.238,     TEMPERATURE =452.0,     MOONS = 0";
      fill(255, 255, 255);
      stroke(255, 255, 255);
      textSize(18);
      textAlign(CENTER, TOP);
      text(merText, -350, -400, 700, 100);  
    }
    else
    {
      m = 35;  
    }
    
  //Venus
    if(mouseX >= 67 && mouseX <= 253 && mouseY >= 217 && mouseY <= 360)
    {
      v = 90;
      String venText = "VENUS       RADIUS = 6052.0,    SPEED = 35.02,    FROM SUN = 108.2,     LIFE? = false,     ROTATION = 0.615,     TEMPERATURE =726.0,    MOONS = 0";
      fill(255, 255, 255);
      stroke(255, 255, 255);
      textSize(18);
      textAlign(CENTER, TOP);
      text(venText, -350, -400, 700, 100);  
    }
    else
    {
      v = 70;  
    }
    
  //Earth
    if(mouseX >= 51 && mouseX <= 268 && mouseY >= 382 && mouseY <= 546)
    {
      e = 95;
      String earText = "EARTH       RADIUS = 6371.0,     SPEED = 29.78,      FROM SUN = 149.6,      LIFE? = true,     ROTATION = 1.0,     TEMPERATURE =270.0,     MOONS = 1";
      fill(255, 255, 255);
      stroke(255, 255, 255);
      textSize(18);
      textAlign(CENTER, TOP);
      text(earText, -350, -400, 700, 100);   
    }
    else
    {
      e = 80;  
    }
    
  //Mars
    if(mouseX >= 103 && mouseX <= 227 && mouseY >= 594 && mouseY <= 687)
    {
      ma = 80;
      String marText = "MARS       RADIUS = 3390.0,      SPEED = 24.07,        FROM SUN = 227.9,      LIFE? = false,      ROTATION = 1.88,      TEMPERATURE =200.0,      MOONS = 2";
      fill(255, 255, 255);
      stroke(255, 255, 255);
      textSize(18);
      textAlign(CENTER, TOP);
      text(marText, -350, -400, 700, 100);   
    }
    else
    {
      ma = 45;  
    }
    
    
    
  //For Mouse Position - Floating Over Planets - Right Planets
  
  //Jupiter
    if(mouseX >= 1225 && mouseX <= 1462 && mouseY >= 59 && mouseY <= 251)
    {
      j = 100;
      String jupText = "JUPITER      RADIUS = 69911.0,      SPEED = 13.07,      FROM SUN = 778.3,     LIFE? = false,      ROTATION = 11.862,      TEMPERATURE =120.0,      MOONS = 67";
      fill(255, 255, 255);
      stroke(255, 255, 255);
      textSize(18);
      textAlign(CENTER, TOP);
      text(jupText, -350, -400, 700, 100);   
    }
    else
    {
      j = 90;  
    }
    
  //Saturn
    if(mouseX >= 1246 && mouseX <= 1432 && mouseY >= 274 && mouseY <= 420)
    {
      sa = 90;
      String satText = "SATURN       RADIUS = 58382.0,     SPEED = 9.69,       FROM SUN = 1427.0,      LIFE? = false,      ROTATION = 29.456,       TEMPERATURE =88.0,      MOONS = 62";
      fill(255, 255, 255);
      stroke(255, 255, 255);
      textSize(18);
      textAlign(CENTER, TOP);
      text(satText, -350, -400, 700, 100);  
    }
    else
    {
      sa = 70;  
    }
    
  //Uranus
    if(mouseX >= 1277 && mouseX <= 1395 && mouseY >= 469 && mouseY <= 561)
    {
      u = 70;
      String uraText = "URANUS       RADIUS = 25362.0,     SPEED = 6.81,      FROM SUN = 2871.0,      LIFE? = false,      ROTATION = 84.07,      TEMPERATURE =59.0,     MOONS = 27";
      fill(255, 255, 255);
      stroke(255, 255, 255);
      textSize(18);
      textAlign(CENTER, TOP);
      text(uraText, -350, -400, 700, 100);   
    }
    else
    {
      u = 45;  
    }
    
  //Neptune
    if(mouseX >= 1289 && mouseX <= 1380 && mouseY >= 625 && mouseY <= 702)
    {
      n = 65;
      String nepText = "NEPTUNE        RADIUS = 24622.0,      SPEED = 5.43,      FROM SUN = 4497.1,      LIFE? = false,     ROTATION = 164.81,      TEMPERATURE =48.0,      MOONS = 13";
      fill(255, 255, 255);
      stroke(255, 255, 255);
      textSize(18);
      textAlign(CENTER, TOP);
      text(nepText, -350, -400, 700, 100);   
    }
    else
    {
      n = 35;  
    }
    
   //Pluto
    if(mouseX >= 735 && mouseX <= 764 && mouseY >= 737 && mouseY <= 770)
    {
      p = 30;
      String pluText = "PLUTO     NOT A PLANET :)";
      fill(255, 255, 255);
      stroke(255, 255, 255);
      textSize(18);
      textAlign(CENTER, TOP);
      text(pluText, -350, -400, 700, 100);   
    }
    else
    {
      p = 20;  
    }
    
    
  //Sun
    if(mouseX >= 667 && mouseX <= 830 && mouseY >= 322 && mouseY <= 477)
    {
      
      sun.sunSize = 270;
      String sunText = "It's Very Big";
      fill(255, 255, 255);
      stroke(255, 255, 255);
      textSize(18);
      textAlign(CENTER, TOP);
      text(sunText, -350, -400, 700, 100);   
    }
    else
    {
      sun.sunSize = 80;  
    }
    
    
}





void mouseClicked()
{
  if( click != 50)
  {
    fill(255,255, 255);
    text(("x = " + mouseX), 400, 20);
    text(("y = " + mouseY), 400, 100);
  }
  
 
}


void drawGrid()
{
  //For Left
    noFill();
    stroke(153, 51, 153);
    strokeWeight(2);
    ellipse(250, 30, 15, 15);
    
    line(250, 30, 250, 60);
    line(250, 60, 310, 100);
    ellipse(310, 100, 15, 15);
    
    ellipse(310, 700, 15, 15);
    line(310, 100, 310, 700);
    line(310, 700, 250, 740);
    
    line(250, 740, 250, 770);
    ellipse(250, 770, 15, 15);
    
  //For Right
     ellipse(width - 250, 30, 15, 15);
    
    line(width - 250, 30, width - 250, 60);
    line(width - 250, 60, width - 310, 100);
    ellipse(width - 310, 100, 15, 15);
    
    ellipse(width -310, 700, 15, 15);
    line(width - 310, 100, width - 310, 700);
    line(width - 310, 700, width - 250, 740);
    
    line(width - 250, 740, width - 250, 770);
    ellipse(width - 250, 770, 15, 15);
    
  
  //For Top Middle  
    ellipse(375, 30, 15, 15);
    line(375, 30, 405, 90);
    ellipse(405, 90, 15, 15);
   
    line(405, 90, width - 405, 90);
   
    ellipse(width - 375, 30, 15, 15);
    line(width - 375, 30, width - 405, 90);
    ellipse(width - 405, 90, 15, 15);
    
  //For Bottom Middle  
    ellipse(375, height - 30, 15, 15);
    line(375, height - 30, 405, height - 90);
    ellipse(405, height - 90, 15, 15);
   
    line(405, height - 90, width - 405, height - 90);
   
    ellipse(width - 375, height - 30, 15, 15);
    line(width - 375, height - 30, width - 405, height - 90);
    ellipse(width - 405, height - 90, 15, 15);
  
}