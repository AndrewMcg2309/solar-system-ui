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
  background(bk);
  
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
        stroke(255, 0, 0); 
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
      String merText = "Size = " + planet[0].radius;
      fill(255, 255, 255);
      text(merText, 0, 0, 100, 100);  
    }
    else
    {
      m = 35;  
    }
    
  //Venus
    if(mouseX >= 67 && mouseX <= 253 && mouseY >= 217 && mouseY <= 360)
    {
      v = 90;
      String merText = "Size = " + planet[0].radius;
      fill(255, 255, 255);
      text(merText, 0, 0, 100, 100);  
    }
    else
    {
      v = 70;  
    }
    
  //Earth
    if(mouseX >= 51 && mouseX <= 268 && mouseY >= 382 && mouseY <= 546)
    {
      e = 95;
      String merText = "Size = " + planet[0].radius;
      fill(255, 255, 255);
      text(merText, 0, 0, 100, 100);  
    }
    else
    {
      e = 80;  
    }
    
  //Mars
    if(mouseX >= 103 && mouseX <= 227 && mouseY >= 594 && mouseY <= 687)
    {
      ma = 80;
      String merText = "Size = " + planet[0].radius;
      fill(255, 255, 255);
      text(merText, 0, 0, 100, 100);  
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
      String merText = "Size = " + planet[0].radius;
      fill(255, 255, 255);
      text(merText, 0, 0, 100, 100);  
    }
    else
    {
      j = 90;  
    }
    
  //Saturn
    if(mouseX >= 1246 && mouseX <= 1432 && mouseY >= 274 && mouseY <= 420)
    {
      sa = 90;
      String merText = "Size = " + planet[0].radius;
      fill(255, 255, 255);
      text(merText, 0, 0, 100, 100);  
    }
    else
    {
      sa = 70;  
    }
    
  //Uranus
    if(mouseX >= 1277 && mouseX <= 1395 && mouseY >= 469 && mouseY <= 561)
    {
      u = 70;
      String merText = "Size = " + planet[0].radius;
      fill(255, 255, 255);
      text(merText, 0, 0, 100, 100);  
    }
    else
    {
      u = 45;  
    }
    
  //Neptune
    if(mouseX >= 1289 && mouseX <= 1380 && mouseY >= 625 && mouseY <= 702)
    {
      n = 65;
      String merText = "Size = " + planet[0].radius;
      fill(255, 255, 255);
      text(merText, 0, 0, 100, 100);  
    }
    else
    {
      n = 35;  
    }
    
    
  //Sun
    if(mouseX >= 667 && mouseX <= 830 && mouseY >= 322 && mouseY <= 477)
    {
      sun.sunSize = 270;
      String merText = "Size = " + planet[0].radius;
      fill(255, 255, 255);
      text(merText, 0, 0, 100, 100);  
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