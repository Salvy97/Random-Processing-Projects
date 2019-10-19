class Bloodstain
{
  float x;
  float y;
  int w;
  int h;
  
  Bloodstain(float x, float y, int w, int h)
  {
     this.x = x;
     this.y = y;
     this.w = w;
     this.h = h;
  }

  void show()
  {
    push();
    beginShape();
    fill(255, 0, 0);
    vertex(this.x, this.y + h);
    vertex(this.x + 2, this.y + h + 3);
    vertex(this.x + 3, this.y + h + 4);
    vertex(this.x + 4, this.y + h + 5);
    vertex(this.x + 6, this.y + h + 8);
    vertex(this.x + 8, this.y + h + 10);
    vertex(this.x + 10, this.y + h + 10);
    vertex(this.x + 12, this.y + h + 20);
    vertex(this.x + 16, this.y + h + 20);
    vertex(this.x + 19, this.y + h + 20);
    vertex(this.x + w, this.y + h);
    endShape();
    pop();
  }
}
