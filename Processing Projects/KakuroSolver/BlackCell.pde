class BlackCell extends Cell
{
  BlackCell(int row, int column, int w)
  {
    super(row, column, w, -1);
  }
  
  void show()
  {
    push();
    fill(0);
    rect(x, y, w, w);
    pop();
  }
}
