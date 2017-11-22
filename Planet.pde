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
    
    /*pos = new PVector(
      row.getFloat("Xg")
      ,row.getFloat("Yg") 
      ,row.getFloat("Zg")
      );
   screenPos = new PVector(
    map(pos.x, -5, 5, border, width - border)
    , map(pos.y, -5, 5, border, height - border)
    );*/
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