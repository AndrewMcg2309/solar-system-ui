class Sun
{
  float sunSize;
  float rotate;

  
  Sun(float s, float r)
  {
    sunSize = s;
    rotate = r;
  }
  
  void update(){
    sunSize = 80;
    rotate= 20 * radians(t += (TWO_PI / 360));
    
    rotateY(rotate);
    sphere(sunSize);
  }
}