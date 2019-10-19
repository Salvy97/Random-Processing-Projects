class Point
{
  float x;
  float y;
  float scaleX;
  float scaleY;
  
  Point(float x, float y, int scaleX, int scaleY)
  {
     this.x = x;
     this.y = y;
     this.scaleX = scaleX;
     this.scaleY = scaleY;
  }
  
  float getXPosition() { return x * scaleX + offset; }
  float getYPosition() { return height - offset - y * scaleY; }

  void show()
  {
     push();
     fill(0);
     strokeWeight(4);
     point(getXPosition(), getYPosition());
     pop();
  }
  
  public String toString() { return x + " " + y; }
}
