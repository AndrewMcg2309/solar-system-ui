
class Planet
{
  String planet;
  float radius;
  float speed;
  float distFromSun;
  boolean habitable;
  float fullRot;
  float temp;
  int moons;
  
  PVector pos;
  PVector screenPos;
  
  Planet(TableRow row)
  {
    planet = row.getString("Planet");
    radius = row.getFloat("Radius");
    speed = row.getFloat("Speed");
    distFromSun = row.getFloat("DistFromSun");
    habitable = (row.getInt("Life") == 1);
    fullRot = row.getFloat("FullRot");
    temp = row.getFloat("Temperature");
    moons = row.getInt("Moons");
  }
  
  float x,y,w;
  float ang; 
  int i = (int) random(0,2);
  float a = random(0, 255);
  float b = random(0, 255);
  float c = random(0, 255);
  
  
  Planet (float radius){
    distFromSun = radius + 60; 
    ang = PI; 
    speed = (random(0.05, 0.1));
    w = random(15,25); 
    move();
  }
  
   void move()
  {
   
    x = cos(ang) * distFromSun; 
    y = sin(ang) * distFromSun; 
    if( i == 1)
    {
      ang += speed;
    }
    else
    {
      ang -= speed;
    }
    

  }
    
    void render()
    { 
      fill(a, b, c);      
      ellipse(x,y,w,w);
    }
  
  
  //Converts to a  stiring
  //The text at the bottom
  String toString()
  {
    return planet
      + ", RADIUS = " + radius
      + ", SPEED = " + speed
      + ", FROM SUN = " + distFromSun
      + ", LIFE? = " + habitable
      + ", ROTATION = " + fullRot
      + ", TEMPERATURE =" + temp
      + ", MOONS = " + moons
      ;
  }
}