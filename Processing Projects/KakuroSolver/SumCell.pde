class SumCell extends Cell
{
  int sumDown;
  int sumRight;
  
  SumCell(int row, int column, int w, int sumDown, int sumRight)
  {
    super(row, column, w, -1);
    this.sumDown = sumDown;
    this.sumRight = sumRight;
  }
  
  void show()
  {
    push();
    rect(x, y, w, w);
    line(x, y, x + w, y + w);
    textSize(16);
    fill(0);
    if (sumDown != 0) text("" + sumDown, x + 5, y + w - 10); 
    if (sumRight != 0) text("" + sumRight, x + w / 2, y + 20);
    pop();
  }
}
