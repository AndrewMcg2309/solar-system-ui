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
    distFromSun = radius; 
    ang = PI; 
    speed = random( -.02 , .02 );
    w = 20; 
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
      + ", " + radius
      + ", " + speed
      + ", " + distFromSun
      + ", " + habitable
      + ", " + fullRot
      + ", " + temp
      + ", " + moons
      ;
  }
}