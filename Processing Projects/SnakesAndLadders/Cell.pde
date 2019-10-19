class Cell
{
  int row;
  int column;
  int w;
  float x;
  float y;
  int direction;
  PVector rectColor;
  int cellNumber;
  
  Cell(int row, int column, int w, PVector rectColor)
  {
    this.row = row;
    this.column = column;
    this.w = w;
    x = column * w;
    y = row * w;
    this.rectColor = rectColor;
  }
  
  void show()
  {
    strokeWeight(4);
    fill(rectColor.x, rectColor.y, rectColor.z);
    rect(x, y, w, w); 
    textSize(32);
    fill(0);
    text("" + cellNumber, x + 20, y + 50);
  }
}
