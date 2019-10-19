class Player
{
  Cell where;
  float x;
  float y;
  boolean won;
  
  Player(Cell where)
  {
    this.where = where;
    won = false;
  }
  
  void move(boolean exceeded)
  {
    if (exceeded)
      where = board[where.row][where.column + 1];
    else
    {
      if (where.direction == 1)
        where = board[where.row][where.column + 1]; 
      else if (where.direction == -1)
        where = board[where.row][where.column - 1]; 
      else if (where.direction == 0)
        where = board[where.row - 1][where.column];
    }
  }
  
  void checkLadders(Ladder[] ladders)
  {
    for (int i = 0; i < ladders.length; i++)
      if (where == ladders[i].start)
        where = ladders[i].end;
  }
  
  void checkSnakes(Snake[] snakes)
  {
    for (int i = 0; i < snakes.length; i++)
      if (where == snakes[i].start)
        where = snakes[i].end;
  }
  
  void show()
  {
    fill(0);
    ellipse(where.x + 35, where.y + 40, 50, 50);  
  }
}
