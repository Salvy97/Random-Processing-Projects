class Cell
{
  int row;
  int column;
  int blockR;
  int blockC;
  float x;
  float y;
  int w;
  int value;
  boolean prechosen;

  Cell(int row, int column, int blockR, int blockC, int w, int value)
  {
    this.row = row;
    this.column = column;
    this.blockR = blockR;
    this.blockC = blockC;
    this.w = w;
    this.value = value;
    x = column * w;
    y = row * w;
    if (value == 0) prechosen = false;
    else prechosen = true;
  }

  void show()
  {
    push();
    strokeWeight(3);
    rect(x, y, w, w);
    if (value != 0)
    {
       if (prechosen) fill(0);
       else fill (0, 204, 204);
       textSize(28);  
       text("" + value, x + 10, y + 30);
    }
    pop();
  }
}
