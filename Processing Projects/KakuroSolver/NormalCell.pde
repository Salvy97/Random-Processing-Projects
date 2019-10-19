class NormalCell extends Cell
{
  NormalCell(int row, int column, int w)
  {
    super(row, column, w, 0); 
  }
  
  void show()
  {
    push();
    rect(x, y, w, w);
    textSize(32);
    fill(0);
    if (value != 0) text("" + value, x + 15, y + w / 2 + 10);
    pop();
  } 
}
