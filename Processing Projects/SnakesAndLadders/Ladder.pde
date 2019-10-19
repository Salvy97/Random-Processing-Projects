class Ladder
{
  Cell start;
  Cell end;
  
  Ladder(Cell start, Cell end)
  {
    this.start = start;
    this.end = end;
  }
  
  void show()
  {
    push();
    stroke(0, 255, 0);
    line(start.x + 20, start.y + 50, end.x + 20, end.y + 50);
    pop();
  }
}
