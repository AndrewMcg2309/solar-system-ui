
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
  
  Planet (float radius){
    distFromSun = radius + 60; 
    ang = PI; 
    speed = (random(0.02, 0.03));
    w = 15; 
    move();
  }
  
   void move()
  {
    x = cos(ang) * distFromSun; 
    y = sin(ang) * distFromSun; 
    ang += speed; 

  }
    
    void render()
    { 
      fill(255, 255, 255);      
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